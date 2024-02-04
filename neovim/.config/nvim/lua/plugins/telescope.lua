return {
	"nvim-telescope/telescope.nvim", -- Find, filter, preview, pick. all lua, with telescope
	dependencies = { { "nvim-lua/plenary.nvim" } },
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {

				prompt_prefix = " ",
				selection_caret = " ",
				path_display = { "smart" },

				mappings = {
					i = {
						["<C-c>"] = actions.close,
					},

					n = {
						["<esc>"] = actions.close,
						["<CR>"] = actions.select_default,
						["?"] = actions.which_key,
					},
				},
			},
		})
	end,
}
