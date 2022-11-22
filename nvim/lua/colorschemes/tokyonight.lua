local g = vim.g
local opt = vim.opt

-- termguicolors
opt.termguicolors = true

-- Theme
opt.background = "dark"

-- Change the hint color to the 'orange' color, and make the 'error' color bright red
g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

require("tokyonight").setup({
  -- use the night style
  style = "moon",
  sidebars = { "qf", "vista_kind", "terminal", "packer" },
  transparent = false,
  lualine_bold = true,
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    functions = { italic = true },
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  },
  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  on_colors = function(colors)
    colors.hint = colors.orange
    colors.error = "#ff0000"
  end,
})

vim.cmd([[colorscheme tokyonight-moon]])
