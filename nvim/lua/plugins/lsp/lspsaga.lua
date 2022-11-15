-- import lspsaga safely
local saga_status, lspsaga = pcall(require, "lspsaga")
if not saga_status then
  return
end

lspsaga.init_lsp_saga({
    move_in_saga = { prev = "<C-k>", next = "<C-j>" },
})
