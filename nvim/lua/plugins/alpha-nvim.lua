-- import alpha-nvim safely
local alpha_nvim_setup, alpha = pcall(require, "alpha")
if not alpha_nvim_setup then
  return
end

-- import alpha-themes safely
local alpha_nvim_themes_setup, alpha_themes = pcall(require, "alpha.themes.dashboard")
if not alpha_nvim_themes_setup then
  return
end

alpha.setup(alpha_themes.config)
