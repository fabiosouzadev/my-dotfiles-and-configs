-- toggleterm -- config
return {
    -- measure startuptime
    {
        "dstein64/vim-startuptime",
        cmd = "StartupTime",
        config = function()
            vim.g.startuptime_tries = 10
        end,
    },
    {
        "folke/neodev.nvim",
        lazy = true,
        config = true,
    },
    {
        "nvim-lua/plenary.nvim",
        cmd = { "PlenaryBustedFile", "PlenaryBustedDirectory" },
        lazy = true,
    },
    -- {{{ Navigate Vim Splits and Tmux pains.

    {
        "alexghergh/nvim-tmux-navigation",
        event = "BufEnter",
        config = function()
            require("nvim-tmux-navigation").setup({
                disable_when_zoomed = true,
            })
            local keymap = vim.api.nvim_set_keymap
            local opts = { noremap = true, silent = true }
            -- nvim-tmux-navigation
            keymap("n", "<C-h>", '<cmd>lua require("nvim-tmux-navigation").NvimTmuxNavigateLeft()<cr>', opts)
            keymap("n", "<C-j>", '<cmd>lua require("nvim-tmux-navigation").NvimTmuxNavigateDown()<cr>', opts)
            keymap("n", "<C-k>", '<cmd>lua require("nvim-tmux-navigation").NvimTmuxNavigateUp()<cr>', opts)
            keymap("n", "<C-l>", '<cmd>lua require("nvim-tmux-navigation").NvimTmuxNavigateRight()<cr>', opts)
            keymap("n", "<C-\\>", '<cmd>lua require("nvim-tmux-navigation").NvimTmuxNavigateLastActive()<cr>', opts)
            keymap("n", "<C-Space>", '<cmd>lua require("nvim-tmux-navigation").NvimTmuxNavigateNext()<cr>', opts)
        end,
    },
    {
        "wakatime/vim-wakatime",
        event = "VeryLazy",
    },
    {
        "ThePrimeagen/vim-be-good",
        event = "VeryLazy",
    },
    {
        "ThePrimeagen/harpoon",
        event = "BufEnter",
        lazy = true,
    },
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = true,
    },
}
