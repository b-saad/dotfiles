return {
  {
    "nvim-tree/nvim-web-devicons",       -- Lua fork of vim-web-devicons for neovim
    lazy = true,
  },

  -- Bufferline
  "famiu/bufdelete.nvim",                -- Better buffer closing behaviour

  -- Cmp
  {
    "hrsh7th/nvim-cmp",                  -- completion plugin for neovim coded in Lua
    dependencies = {
      "hrsh7th/cmp-buffer",              -- nvim-cmp source for buffer words
      "hrsh7th/cmp-path",                -- nvim-cmp source for path
      "hrsh7th/cmp-nvim-lsp",
    },
  },

  -- Git -- 
  "lewis6991/gitsigns.nvim",             -- fast git decorations 

  -- LSP
  "neovim/nvim-lspconfig",               -- enable lsp
  "williamboman/mason.nvim",             -- simple to use language server installer
  "williamboman/mason-lspconfig.nvim",
  {
    "nvimtools/none-ls.nvim",            -- for formatters and linters
    dependencies = {
      "nvim-lua/plenary.nvim",
      "williamboman/mason.nvim",
    },
  },

 -- Markdown
  {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  -- Snippets
  "L3MON4D3/LuaSnip",                    -- snippet Engine for Neovim written in Lua
}
