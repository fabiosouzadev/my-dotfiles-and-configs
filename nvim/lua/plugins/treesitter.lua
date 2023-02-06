return {
    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local servers = require("lsp.ensure_installed")
            require("nvim-treesitter.configs").setup({
                highlight = {
                    enable = true, -- false will disable the whole extension
                    additional_vim_regex_highlighting = true,
                },
                indent = { enable = true },
                autopairs = {
                    enable = true,
                },
                -- enable autotagging (w/ nvim-ts-autotag plugin)
                autotag = { enable = true },
                -- ensure these language parsers are installed
                ensure_installed = servers.ensure_installed_treesitter,
                -- auto install above language parsers
                auto_install = true,
                incremental_selection = {
                    enable = true,
                },
                textobjects = {
                    enable = true,
                },
                context_commentstring = {
                  enable = true,
                  enable_autocmd = false,
                },
            })
        end,
        cmd = { "TSInstall", "TSUninstall", "TSUpdate", "TSInstallInfo", "TSInstallSync", "TSInstallFromGrammar" },
        event = "User FileOpened",
    },
    {
        -- Lazy loaded by Comment.nvim pre_hook
        "JoosepAlviste/nvim-ts-context-commentstring",
        lazy = true,
    },
}
