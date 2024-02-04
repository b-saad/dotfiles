return {
	"sainnhe/gruvbox-material",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		vim.g.gruvbox_material_better_performance = 1
		vim.g.gruvbox_material_background = "hard"

		local colorscheme = "gruvbox-material"
		local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
		if not status_ok then
			return
		end
	end,
}
