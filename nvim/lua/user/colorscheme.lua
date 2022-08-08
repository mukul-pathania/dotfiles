local colorscheme = "gruvbox"

vim.o.background = "dark"
vim.g.gruvbox_contrast_dark = "hard"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
