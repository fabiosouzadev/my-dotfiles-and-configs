return {
    {
        "glepnir/dashboard-nvim",
        event = "VimEnter",
        config = function()
            require("dashboard").setup({
                theme = "hyper",
                config = {},
            })
        end,
        dependencies = { "nvim-web-devicons" },
    },
    {
        "nvim-lualine/lualine.nvim",
        event = "VimEnter",
        dependencies = {
            "nvim-web-devicons",
        },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "moonfly",
                    component_separators = "|",
                    section_separators = "",
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch", "diff", "diagnostics" },
                    lualine_c = { "filename", "lsp_progress" },
                    lualine_x = { "encoding", "fileformat", "filetype" },
                    lualine_y = { "progress" },
                    lualine_z = { "location" },
                },
            })
        end,
    },
    { "romgrk/barbar.nvim",          dependencies = "nvim-web-devicons" },
    {
        "kyazdani42/nvim-tree.lua",
        version = "nightly",
        config = function()
            local nvimtree = require("nvim-tree")
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
            vim.opt.termguicolors = true

            nvimtree.setup({
                diagnostics = {
                    enable = true,
                },
                filters = {
                    custom = { ".git$", ".gitignore", "node_modules", ".cache" },
                },
            })
        end,
    },
    {
        "akinsho/toggleterm.nvim",
        branch = "main",
        event = "VeryLazy",
        cmd = "ToggleTerm",
        config = true,
    },
    {
        "sindrets/diffview.nvim",
        requires = "plenary.nvim",
    },
    {
        "stevearc/dressing.nvim",
        lazy = true,
        config = true,
    },
    {
        'folke/noice.nvim',
        event = 'VeryLazy',
        opts = {
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                }
            },
        },

        presets = {
            bottom_search = true,
            command_palette = true,
            long_message_to_split = true,
        },

        dependencies = {
            'nui.nvim',
            'nvim-notify'
        },
    },
    {
        'rcarriga/nvim-notify',
        event = 'BufEnter',
        opts = {
            background_colour = '#1a1b26',
            timeout = 1000,
        }
    },
    -- icons
    { "nvim-tree/nvim-web-devicons", lazy = true },

    -- ui components
    { "MunifTanjim/nui.nvim",        lazy = true },
}
