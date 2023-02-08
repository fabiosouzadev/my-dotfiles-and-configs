-- "nvim-neo-tree/neo-tree.nvim",
-- search/replace in multiple files
-- "windwp/nvim-spectre",
-- easily jump to any location and enhanced f/t motions for Leap
-- "ggandor/leap.nvim",
-- "folke/trouble.nvim",
--  OPtion for comments
--  "folke/todo-comments.nvim",
return {
    -- Comments
    {
        "numToStr/Comment.nvim",
        config = true,
        keys = { { "gc", mode = { "n", "v" } }, { "gb", mode = { "n", "v" } } },
        event = "User FileOpened",
    },
    { 'mg979/vim-visual-multi'}
}
