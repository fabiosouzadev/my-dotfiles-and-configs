local g = vim.g
local opt = vim.opt

-- termguicolors
opt.termguicolors = true

-- Theme
g.tokyonight_style = "moon" --storm, night, moon or day
g.tokyonight_italic_functions = true
g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

-- Change the hint color to the 'orange' color, and make the 'error' color bright red
g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

require("tokyonight").setup({
  -- use the night style
  style = "moon",
  sidebars = { "qf", "vista_kind", "terminal", "packer" },
  lualine_bold = true,
  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  on_colors = function(colors)
    colors.hint = colors.orange
    colors.error = "#ff0000"
  end
})

vim.cmd[[colorscheme tokyonight-moon]]
