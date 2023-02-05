-- Telescope
return {
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        config = true,
        dependencies = { "telescope-fzf-native.nvim" },
        lazy = true,
        cmd = "Telescope",
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        lazy = true
    },
}
