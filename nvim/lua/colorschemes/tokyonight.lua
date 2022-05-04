local g = vim.g

-- Theme
g.tokyonight_style = "storm" --storm, night or day
g.tokyonight_italic_functions = true
g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

-- Change the hint color to the 'orange' color, and make the 'error' color bright red
g.tokyonight_colors = { hint = "orange", error = "#ff0000" }
vim.cmd[[colorscheme tokyonight]]
