return {
  defaults = {
    prompt_prefix = "   ",
    file_ignore_patterns = { "node_modules" },
    color_devicons = true,
    mappings = {
      n = { ["q"] = require("telescope.actions").close },
    },
  },
  pickers = {
    colorscheme = {
      enable_preview = true
    }
  },
}