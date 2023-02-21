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
                keybindings = {
                    left = "<C-h>",
                    down = "<C-j>",
                    up = "<C-k>",
                    right = "<C-l>",
                    last_active = "<C-\\>",
                    next = "<C-Space>",
                }
            })
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
}
