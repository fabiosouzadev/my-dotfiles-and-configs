-- import lspsaga safely
local saga_status, lspsaga = pcall(require, "lspsaga")
if not saga_status then
  return
end

lspsaga.setup({})
