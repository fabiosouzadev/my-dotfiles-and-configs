-- Status Line and Bufferline
return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
        { "nvim-tree/nvim-web-devicons", lazy = true },
    },
    config = function()
        require("lualine").setup({
            options = {
                theme = "moonfly",
                component_separators = "|",
                section_separators = "",
            },
        })
    end,
}
