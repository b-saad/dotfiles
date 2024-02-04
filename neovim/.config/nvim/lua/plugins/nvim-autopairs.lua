return {
	-- Autopairs, integrates with both cmp and treesitter
	"windwp/nvim-autopairs",
	config = function()
		-- Setup nvim-autopairs
		local npairs = require("nvim-autopairs")
		npairs.setup({
			check_ts = true,
			fast_wrap = {},
		})
	end,
}
