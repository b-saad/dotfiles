-- Load nord colorscheme with A protected call

-- colorscheme options
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_background = "hard"

local colorscheme = "gruvbox-material"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
