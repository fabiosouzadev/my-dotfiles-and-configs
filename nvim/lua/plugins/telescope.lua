local fb_actions = require("telescope").extensions.file_browser.actions
require("telescope").setup({
  defaults = {
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
    -- file_browser = {},
  },
})
require("telescope").load_extension("fzf")
require("telescope").load_extension("file_browser")
