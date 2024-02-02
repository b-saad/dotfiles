return {
  {
    "nvim-tree/nvim-web-devicons",        -- Lua fork of vim-web-devicons for neovim
    lazy = true,
  },
  "windwp/nvim-autopairs",               -- Autopairs, integrates with both cmp and treesitter

  -- Bufferline
  "famiu/bufdelete.nvim",                -- Better buffer closing behaviour

  -- Cmp
  "hrsh7th/nvim-cmp",                    -- completion plugin for neovim coded in Lua
  "hrsh7th/cmp-buffer",                  -- nvim-cmp source for buffer words
  "hrsh7th/cmp-path",                    -- nvim-cmp source for path
  "hrsh7th/cmp-nvim-lsp",

  -- LSP
  "neovim/nvim-lspconfig",               -- enable lsp
  "williamboman/mason.nvim",             -- simple to use language server installer
  "williamboman/mason-lspconfig.nvim",
  "jose-elias-alvarez/null-ls.nvim",     -- for formatters and linters

 -- Markdown
  {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  -- Snippets
  "L3MON4D3/LuaSnip",                    -- snippet Engine for Neovim written in Lua

  -- Which Key
  "folke/which-key.nvim",                -- Keyboard shortcut helpers
}
