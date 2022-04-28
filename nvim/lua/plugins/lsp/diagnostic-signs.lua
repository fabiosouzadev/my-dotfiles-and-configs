local signs = {Error = " ", Warn = " ", Hint = " ", Info = " "}

for type, icon in pairs(signs) do
  local hl = "LSPDiagnosticSign" .. type
  vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = ""})
end