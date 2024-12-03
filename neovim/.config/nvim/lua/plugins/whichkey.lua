local opts = {
	mode = "n", -- NORMAL mode
	prefix = "",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	{ "<leader>F", group = "Search", nowait = true, remap = false },
	{ "<leader>FF", "<cmd>Telescope live_grep<cr>", desc = "Find text", nowait = true, remap = false },
	{ "<leader>FS", "<cmd>Telescope grep_string<cr>", desc = "Find string under cursor", nowait = true, remap = false },
	{ "<leader>f", group = "file", nowait = true, remap = false },
	{ "<leader>fe", "<cmd>NvimTreeToggle<CR>", desc = "File Explorer", nowait = true, remap = false },
	{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", nowait = true, remap = false },
	{ "<leader>h", "<cmd>nohlsearch<CR>", desc = "No Highlight", nowait = true, remap = false },
	{ "<leader>q", "<cmd>q!<CR>", desc = "Quit", nowait = true, remap = false },
	{ "<leader>t", group = "Terminal", nowait = true, remap = false },
	{ "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float", nowait = true, remap = false },
	{
		"<leader>th",
		"<cmd>ToggleTerm size=20 direction=horizontal<cr>",
		desc = "Horizontal",
		nowait = true,
		remap = false,
	},
	{ "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "Vertical", nowait = true, remap = false },
	{ "<leader>w", "<cmd>w!<CR>", desc = "Save", nowait = true, remap = false },
	{ "g", group = "LSP", nowait = true, remap = false },
	{ "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", desc = "Go to declaration", nowait = true, remap = false },
	{ "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", desc = "Go to implementation", nowait = true, remap = false },
	{ "gK", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "Show Hover", nowait = true, remap = false },
	{ "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "Go to definition", nowait = true, remap = false },
	{ "gf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", desc = "Format", nowait = true, remap = false },
	{ "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "Open diagnostics", nowait = true, remap = false },
	{ "gr", "<cmd>lua vim.lsp.buf.references()<CR>", desc = "Show references", nowait = true, remap = false },
}

return {
	-- Keyboard shortcut helpers
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = opts,
	keys = mappings,
}
