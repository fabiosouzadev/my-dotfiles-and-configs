return {
    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "BufNewFile" },
        build = ":TSUpdate",
        config = function()
            local servers = require("lsp.ensure_installed")
            require("nvim-treesitter.configs").setup({
                highlight = {
                    enable = true, -- false will disable the whole extension
                },
                indent = { enable = true, disable = { 'python' } },
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
                    keymaps = {
                        init_selection = '<c-space>',
                        node_incremental = '<c-space>',
                        scope_incremental = '<c-s>',
                        node_decremental = '<c-backspace>',
                    },
                },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                        keymaps = {
                            -- You can use the capture groups defined in textobjects.scm
                            ['aa'] = '@parameter.outer',
                            ['ia'] = '@parameter.inner',
                            ['af'] = '@function.outer',
                            ['if'] = '@function.inner',
                            ['ac'] = '@class.outer',
                            ['ic'] = '@class.inner',
                        },
                    },
                    move = {
                        enable = true,
                        set_jumps = true, -- whether to set jumps in the jumplist
                        goto_next_start = {
                            [']m'] = '@function.outer',
                            [']]'] = '@class.outer',
                        },
                        goto_next_end = {
                            [']M'] = '@function.outer',
                            [']['] = '@class.outer',
                        },
                        goto_previous_start = {
                            ['[m'] = '@function.outer',
                            ['[['] = '@class.outer',
                        },
                        goto_previous_end = {
                            ['[M'] = '@function.outer',
                            ['[]'] = '@class.outer',
                        },
                    },
                    swap = {
                        enable = true,
                        swap_next = {
                            ['<leader>a'] = '@parameter.inner',
                        },
                        swap_previous = {
                            ['<leader>A'] = '@parameter.inner',
                        },
                    },
                },
                context_commentstring = {
                  enable = true,
                  enable_autocmd = false,
                },
            })
        end,
        cmd = { "TSInstall", "TSUninstall", "TSUpdate", "TSInstallInfo", "TSInstallSync", "TSInstallFromGrammar" },
        dependencies = {"nvim-treesitter-textobjects", "nvim-ts-context-commentstring"}
    },
    {
        -- Lazy loaded by Comment.nvim pre_hook
        "JoosepAlviste/nvim-ts-context-commentstring",
        lazy = true,
    },
    { -- Additional text objects via treesitter
        'nvim-treesitter/nvim-treesitter-textobjects',
        lazy = true,
    },
}
