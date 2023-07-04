return {
  options = {
    disabled_filetypes = { 
      statusline = { 
        "dashboard", 
        "alpha" 
      } 
    },
    theme = 'moonfly',
    -- theme = 'catppuccin',
    component_separators = '|',

    section_separators = '',
  },
  sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch', 'diff', 'diagnostics' },
      lualine_c = { 'filename', 'lsp_progress' },
      lualine_x = { 'encoding', 'fileformat', 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = { 'location' },
  },
}