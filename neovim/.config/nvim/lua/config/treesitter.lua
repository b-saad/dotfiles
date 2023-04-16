local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
  -- A list of parser names, or "all"
  ensure_installed = {
    "bash",
    "c",
    "cmake",
    "cpp",
    "css",
    "dockerfile",
    "go",
    "gomod",
    "gosum",
    "http",
    "java",
    "javascript",
    "lua",
    "make",
    "markdown",
    "markdown_inline",
    "python",
    "rust",
    "sql",
    "terraform",
    "vim",
    "yaml",
    "query"
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
