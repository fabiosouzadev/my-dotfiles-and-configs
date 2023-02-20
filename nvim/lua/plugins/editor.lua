return {
  -- Comments
  {
    "numToStr/Comment.nvim",
    config = true,
    keys = { { "gc", mode = { "n", "v" } }, { "gb", mode = { "n", "v" } } },
    event = "User FileOpened",
  },
  { "mg979/vim-visual-multi" },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      vim.opt.list = true
      vim.opt.listchars:append("space:⋅")
      vim.opt.listchars:append("eol:↴")

      vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
      vim.g.indent_blankline_filetype_exclude = {
        "help",
        "startify",
        "dashboard",
        "packer",
        "neogitstatus",
        "NvimTree",
        "Trouble",
      }

      require("indent_blankline").setup({
        space_char_blankline = " ",
        show_current_context = true,
        show_current_context_start = true,
      })
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = true,
    lazy = true,
    event = "User FileOpened",
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  {
    --https://github.com/junegunn/vim-easy-align
    "junegunn/vim-easy-align",
    event = "BufEnter",
  },
}
