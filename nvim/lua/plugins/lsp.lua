return {
    -- {{{ lspconfig
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            -- Useful status updates for LSP
            {
                "j-hui/fidget.nvim",
                event = "VeryLazy",
                config = true,
            },
            -- Additional lua configuration, makes nvim stuff amazing
            {
                "folke/neodev.nvim",
                lazy = true,
                opts = {
                    experimental = { pathStrict = true },
                },
                config = true,
            },
            -- Automatically install LSPs to stdpath for neovim
            "mason.nvim",
            { "williamboman/mason-lspconfig.nvim", cmd = { "LspInstall", "LspUninstall" } },
            "cmp-nvim-lsp",
        },
        opts = function()
            local servers_to_lsp = {}
            local servers = require("lsp.ensure_installed")
            for _, value in pairs(servers.lsp_to_mason) do
                table.insert(servers_to_lsp, value.lsp)
            end
            return {
                -- Setup neovim lua configuration
                signs = {
                    { name = "DiagnosticSignError", text = "" },
                    { name = "DiagnosticSignWarn",  text = "" },
                    { name = "DiagnosticSignHint",  text = "" },
                    { name = "DiagnosticSignInfo",  text = "" },
                },
                servers_to_lsp = servers_to_lsp,
            }
        end,
        config = function(_, opts)
            local lspconfig = require("lspconfig")
            local mason_lspconfig = require("mason-lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

            -- diagnostics
            for _, sign in ipairs(opts.signs) do
                vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
            end
            -- lspconfig
            for _, server in pairs(opts.servers_to_lsp) do
                local cap_opts = {
                    capabilities = capabilities,
                }
                local has_custom_opts, server_custom_opts = pcall(require, "lsp.providers." .. server)
                if has_custom_opts then
                    cap_opt = vim.tbl_deep_extend("force", server_custom_opts, cap_opts)
                end
                lspconfig[server].setup(cap_opts)
            end
            --
            -- temp fix for lspconfig rename
            -- https://github.com/neovim/nvim-lspconfig/pull/2439
            local mappings = require("mason-lspconfig.mappings.server")
            if not mappings.lspconfig_to_package.lua_ls then
                mappings.lspconfig_to_package.lua_ls = "lua-language-server"
                mappings.package_to_lspconfig["lua-language-server"] = "lua_ls"
            end

            -- mason-lspconfig
            mason_lspconfig.setup({
                ensure_installed = opts.servers_to_lsp,
                -- auto-install configured servers (with lspconfig)
                automatic_installation = true, -- not the same as ensure_installed
            })
        end,
    },
    -- ----------------------------------------------------------------------- }}}
    -- {{{ Null-ls
    {
        "jose-elias-alvarez/null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            "mason.nvim",
            "jay-babu/mason-null-ls.nvim",
            "plenary.nvim",
        },
        opts = function()
            local null_ls = require("null-ls")
            -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
            -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
            local formatting = null_ls.builtins.formatting
            local diagnostics = null_ls.builtins.diagnostics
            -- local code_actions = null_ls.builtins.code_actions
            -- local hover = null_ls.builtins.hover
            local completion = null_ls.builtins.completion

            local sources = {
                -- snippets support
                completion.luasnip,
                -- formatting
                formatting.prettierd,
                formatting.black.with({ extra_args = { "--line-length", "79", "-t", "py37", "--skip-string-normalization" } }),
                formatting.stylua,
                formatting.fixjson,
                -- diagnostics
                diagnostics.flake8,
                diagnostics.eslint_d.with({ -- js/ts linter
                    -- only enable eslint if root has .eslintrc.js (not in youtube nvim video)
                    condition = function(utils)
                        return utils.root_has_file(".eslintrc.js") -- change file extension if you use something else
                    end,
                }),
                -- code actions
                -- hover
            }
            return {
                null_ls = null_ls,
                servers = require("lsp.ensure_installed"),
                mason_null_ls = require("mason-null-ls"),
                sources = sources,
            }
        end,
        config = function(_, opts)
            local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

            local lsp_formatting = function(bufnr)
                vim.lsp.buf.format({
                    filter = function(client)
                        return client.name == "null-ls"
                    end,
                    bufnr = bufnr,
                })
            end

            -- -- Format on save
            -- local on_attach = function(client, bufnr)
            --     if client.supports_method("textDocument/formatting") then
            --         vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            --         vim.api.nvim_create_autocmd("BufWritePre", {
            --             group = augroup,
            --             buffer = bufnr,
            --             callback = function()
            --                 lsp_formatting(bufnr)
            --             end,
            --         })
            --     end
            --     if client.supports_method("textDocument/rangeFormatting") then
            --         vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
            --     end
            -- end

            -- mason_null_ls
            opts.mason_null_ls.setup({
                ensure_installed = opts.servers.ensure_installed_null_ls,
                -- auto-install configured servers (with lspconfig)
                automatic_installation = true, -- not the same as ensure_installed
            })

            opts.null_ls.setup({
                debug = true,
                sources = opts.sources,
                -- on_attach = on_attach,
            })
        end,
    },
    -- ----------------------------------------------------------------------- }}}
    -- {{{ Mason
    {
        "williamboman/mason.nvim",
        config = true,
        lazy = true,
        cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
    },

    -- ----------------------------------------------------------------------- }}}
    {
        "glepnir/lspsaga.nvim",
        event = "BufRead",
        lazy = true,
        config = function()
            require("lspsaga").setup({})
        end,
        dependencies = { { "nvim-web-devicons" } },
    },
    {
        "folke/trouble.nvim",
        lazy = true,
        requires = "nvim-web-devicons",
        config = true,
    },
}
