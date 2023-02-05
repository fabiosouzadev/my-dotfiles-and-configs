return {
    -- {{{ nvim-lspconfig
    {
        'neovim/nvim-lspconfig',
        dependencies = {
          -- Automatically install LSPs to stdpath for neovim
          'williamboman/mason.nvim',
          'williamboman/mason-lspconfig.nvim',
          -- 'hrsh7th/cmp-nvim-lsp',
          -- Useful status updates for LSP
          'j-hui/fidget.nvim',

          -- Additional lua configuration, makes nvim stuff amazing
          'folke/neodev.nvim',
        },
        config = function()
            local lspconfig = require('lspconfig')
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            -- capabilities = require('cmp_nvim_lsp').default_capabilities()
            local servers = require('lsp.ensure_installed')
            local lsp_language_servers = servers.ensure_installed_lsp
            -- Setup neovim lua configuration
            local signs = {
                { name = "DiagnosticSignError", text = "" },
                { name = "DiagnosticSignWarn",  text = "" },
                { name = "DiagnosticSignHint",  text = "" },
                { name = "DiagnosticSignInfo",  text = "" },
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
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        cmd = { "LspInstall", "LspUninstall" },
        lazy = true,
        dependencies = "mason.nvim",
        config = function()
            local servers = require('lsp.ensure_installed')
            local mason_lspconfig = require('mason-lspconfig')
            mason_lspconfig.setup({
                ensure_installed = servers.ensure_installed_lsp,
                -- auto-install configured servers (with lspconfig)
                automatic_installation = true, -- not the same as ensure_installed
            })
        end
    },
    {
        "williamboman/mason.nvim",
        config = true,
        cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
        lazy = true,
    },
    {
        "folke/neodev.nvim",
        config = true,
        lazy = true,
    },
    {   -- Useful status updates for LSP
        'j-hui/fidget.nvim',
        config = true,
        event = 'VeryLazy',
        dependencies = "neodev.nvim",
    },
}
