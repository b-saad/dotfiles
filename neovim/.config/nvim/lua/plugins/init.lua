return {
  "nvim-tree/nvim-web-devicons",        -- Lua fork of vim-web-devicons for neovim
  "nvim-tree/nvim-tree.lua",            -- A file explorer tree for neovim written in lua
  "RRethy/vim-illuminate",               -- Same word highlighting (ex. variable usage)
  "windwp/nvim-autopairs",               -- Autopairs, integrates with both cmp and treesitter

  -- Bufferline
  "famiu/bufdelete.nvim",                -- Better buffer closing behaviour

  -- Cmp
  "hrsh7th/nvim-cmp",                    -- completion plugin for neovim coded in Lua
  "hrsh7th/cmp-buffer",                  -- nvim-cmp source for buffer words
  "hrsh7th/cmp-path",                    -- nvim-cmp source for path
  "hrsh7th/cmp-nvim-lsp",

  -- Colorschemes
  {
    "sainnhe/gruvbox-material",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins 
  },

  -- Git -- 
  "lewis6991/gitsigns.nvim",             -- fast git decorations 

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

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  },

  -- Which Key
  "folke/which-key.nvim",                -- Keyboard shortcut helpers
}
