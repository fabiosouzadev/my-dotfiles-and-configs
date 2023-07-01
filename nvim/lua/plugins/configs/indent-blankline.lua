-- vim.opt.list = true
-- vim.opt.listchars:append 'space:⋅'
-- vim.opt.listchars:append 'eol:↴'
return {
  indentLine_enabled = 1,
  filetype_exclude = {
    "help",
    "terminal",
    "lazy",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "mason",
    "nvdash",
    "nvcheatsheet",
    'NvimTree',
    'Trouble',
    'startify',
    'dashboard',
    "",
  },
  buftype_exclude = { "terminal" },
  -- vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
  -- space_char_blankline = ' ',
  show_current_context = true,
  show_current_context_start = true,
}