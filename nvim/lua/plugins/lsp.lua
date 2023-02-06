return {
    -- {{{ nvim-lspconfig
    {
        "neovim/nvim-lspconfig",
        event = "BufReadPre",
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            -- "williamboman/mason.nvim",
            "mason-lspconfig.nvim",
            -- 'hrsh7th/cmp-nvim-lsp',
            -- Useful status updates for LSP
            -- "j-hui/fidget.nvim",

            -- Additional lua configuration, makes nvim stuff amazing
            "neodev.nvim",
        },
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            -- capabilities = require('cmp_nvim_lsp').default_capabilities()
            local servers = require("lsp.ensure_installed")
            local lsp_language_servers = servers.ensure_installed_lsp
            -- Setup neovim lua configuration
            local signs = {
                { name = "DiagnosticSignError", text = "" },
                { name = "DiagnosticSignWarn", text = "" },
                { name = "DiagnosticSignHint", text = "" },
                { name = "DiagnosticSignInfo", text = "" },
            }

            for _, sign in ipairs(signs) do
                vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
            end

            for _, server in pairs(lsp_language_servers) do
                local opts = {
                    capabilities = capabilities,
                }
                local has_custom_opts, server_custom_opts = pcall(require, "lsp.providers." .. server)
                if has_custom_opts then
                    opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
                end
                lspconfig[server].setup(opts)
            end
        end,
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            -- "williamboman/mason.nvim",
            "mason-null-ls.nvim",
            "plenary.nvim",
        },
        config = function()
            local null_ls = require("null-ls")
            -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
            -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
            local formatting = null_ls.builtins.formatting
            local diagnostics = null_ls.builtins.diagnostics
            -- local code_actions = null_ls.builtins.code_actions
            -- local hover = null_ls.builtins.hover
            -- local completion = null_ls.builtins.completion

            local sources = {
                -- formatting
                formatting.prettierd,
                formatting.black.with({ extra_args = { "--fast" } }),
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

            local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

            local lsp_formatting = function(bufnr)
                vim.lsp.buf.format({
                    filter = function(client)
                        return client.name == "null-ls"
                    end,
                    bufnr = bufnr,
                })
            end

            local on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            lsp_formatting(bufnr)
                        end,
                    })
                end
                if client.supports_method("textDocument/rangeFormatting") then
                    vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
                end
            end

            null_ls.setup({
                debug = true,
                sources = sources,
                -- on_attach = on_attach,
            })
        end,
    },
    -- ----------------------------------------------------------------------- }}}
    -- {{{ Mason
    {
        "williamboman/mason.nvim",
        config = true,
        cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
        lazy = true,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        cmd = { "LspInstall", "LspUninstall" },
        lazy = true,
        dependencies = "mason.nvim",
        config = function()
            local servers = require("lsp.ensure_installed")
            local mason_lspconfig = require("mason-lspconfig")
            mason_lspconfig.setup({
                ensure_installed = servers.ensure_installed_lsp,
                -- auto-install configured servers (with lspconfig)
                automatic_installation = true, -- not the same as ensure_installed
            })
        end,
    },
    {
        "jay-babu/mason-null-ls.nvim",
        lazy = true,
        dependencies = {
            "mason.nvim",
        },
        config = function()
            local servers = require("lsp.ensure_installed")
            local mason_null_ls = require("mason-null-ls")
            mason_null_ls.setup({
                ensure_installed = servers.ensure_installed_null_ls,
                -- auto-install configured servers (with lspconfig)
                automatic_installation = true, -- not the same as ensure_installed
            })
        end,
    },
    { -- Useful status updates for LSP
        "j-hui/fidget.nvim",
        event = "VeryLazy",
        config = true,
    },
}
