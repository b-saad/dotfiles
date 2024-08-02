return {
	"nvim-treesitter/nvim-treesitter", -- Syntax highlighting
	build = function()
		local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
		ts_update()
	end,
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			-- A list of parser names, or "all"
			ensure_installed = {
				"bash",
				"c",
				"cmake",
				"cpp",
				"css",
				"csv",
				"dockerfile",
				"go",
				"gomod",
				"gosum",
				"http",
				"java",
				"javascript",
				"json",
        "jsonnet",
				"latex",
				"lua",
				"make",
				"markdown",
				"markdown_inline",
				"printf",
				"proto",
				"puppet",
				"python",
				"rust",
				"sql",
				"terraform",
				"vim",
				"xml",
				"yaml",
			},

			-- List of parsers to ignore installing
			ignore_install = { "" },

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,

			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = false,

			highlight = {
				enable = true, -- false will disable the whole extension
				disable = { "" }, -- list of language that will be disabled
			},
			indent = { enable = true, disable = {} },
		})
	end,
}
