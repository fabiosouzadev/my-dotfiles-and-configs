-- n, v, i, t = mode names
local M = {}

M.general = {
  n = {
    -- disable arrow keys cause im learning vim ;)
    ["<Up>"] = {"<Nop>", "Disable up"},
    ["<Down>"] = {"<Nop>", "Disable down"},
    ["<Left>"] = {"<Nop>", "Disable left"},
    ["<Right>"] = {"<Nop>", "Disable right"}
  },
}

M.whichkey = {
  plugin = true,
  n = {
    ["<leader>wK"] = {
      function()
        vim.cmd "WhichKey"
      end,
      "Which-key all keymaps",
    },
    ["<leader>wk"] = {
      function()
        local input = vim.fn.input "WhichKey: "
        vim.cmd("WhichKey " .. input)
      end,
      "Which-key query lookup",
    },
  },
}

return M