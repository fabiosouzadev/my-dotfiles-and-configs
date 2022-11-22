-- import language-servers plugin safely
local lang_servers_status, language_servers_ensure_installed = pcall(require, "lang-servers-ensure-installed")
if not lang_servers_status then
  return
end

require("nvim-treesitter.configs").setup({
  highlight = {
    enable = true, -- false will disable the whole extension
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true },
  autopairs = {
    enable = true,
  },
  -- enable autotagging (w/ nvim-ts-autotag plugin)
  autotag = { enable = true },
  -- ensure these language parsers are installed
  ensure_installed = language_servers_ensure_installed.ensure_installed_treesitter,
  -- auto install above language parsers
  auto_install = true,
  incremental_selection = {
    enable = true,
  },
  textobjects = {
    enable = true,
  },
  -- context_commentstring = {
  --   enable = true,
  --   enable_autocmd = false,
  -- },
})
