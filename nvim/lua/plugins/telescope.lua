-- Telescope
return {
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        cmd = "Telescope",
        config = function()
            local telescope = require("telescope")
            local fb_actions = telescope.extensions.file_browser.actions
            telescope.setup({
                defaults = {
                    prompt_prefix = " ",
                    selection_caret = " ",
                    file_ignore_patterns = { "%.git/", "node_modules/", "coverage/", "__pycache__/", "%.o" },
                    layout_config = {
                        width = 0.75,
                        prompt_position = "top",
                        preview_cutoff = 120,
                        horizontal = { mirror = false },
                        vertical = { mirror = false },
                    },
                },
                extensions = {
                    fzf = {
                        fuzzy = true, -- false will only do exact matching
                        override_generic_sorter = true, -- override the generic sorter
                        override_file_sorter = true, -- override the file sorter
                        case_mode = "smart_case", -- or "ignore_case" or "respect_case"                          -- the default case_mode is "smart_case"
                    },
                    -- https://github.com/nvim-telescope/telescope-file-browser.nvim/#mappings
                    file_browser = {
                        -- theme = "cursor",
                        -- disables netrw and use telescope-file-browser in its place
                        hijack_netrw = true,
                        mappings = {
                            ["i"] = {
                                -- your custom insert mode mappings
                                ["<C-h>"] = fb_actions.goto_home_dir,
                            },
                            ["n"] = {
                                -- your custom normal mode mappings
                            },
                        },
                    },
                },
            })
            telescope.load_extension("fzf")
            telescope.load_extension("file_browser")
        end,
        dependencies = { "telescope-fzf-native.nvim","telescope-file-browser" },
        lazy = true,
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        lazy = true
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        lazy = true,
    },
}
