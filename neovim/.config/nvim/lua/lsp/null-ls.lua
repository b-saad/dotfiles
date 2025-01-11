local null_ls = require("null-ls")

local null_ls_servers = {
	-- An opinionated code formatter for Lua.
	null_ls.builtins.formatting.stylua,

	-- Fix common misspellings in text files.
	null_ls.builtins.completion.spell,

	-- Fix common misspellings in text files.
	null_ls.builtins.formatting.codespell,
}

null_ls.setup({
	sources = null_ls_servers,
	debug = false,
})
