local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd [[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]]

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = " "


-- Install your plugins here
require("lazy").setup({
  {
    "goolord/alpha-nvim",                   -- nvim dashboard
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  "nvim-tree/nvim-web-devicons",        -- Lua fork of vim-web-devicons for neovim
  "nvim-tree/nvim-tree.lua",            -- A file explorer tree for neovim written in lua
  "lukas-reineke/indent-blankline.nvim", -- Indent guides
  "RRethy/vim-illuminate",               -- Same word highlighting (ex. variable usage)
  "windwp/nvim-autopairs",               -- Autopairs, integrates with both cmp and treesitter

  -- Bufferline
  {
    "akinsho/bufferline.nvim",
    version = "v3.*",
    dependencies = "nvim-tree/nvim-web-devicons"
  },
  "famiu/bufdelete.nvim",                -- Better buffer closing behaviour

  -- Cmp
  "hrsh7th/nvim-cmp",                    -- completion plugin for neovim coded in Lua
  "hrsh7th/cmp-buffer",                  -- nvim-cmp source for buffer words
  "hrsh7th/cmp-path",                    -- nvim-cmp source for path
  "hrsh7th/cmp-nvim-lsp",

  -- Colorschems
  "sainnhe/gruvbox-material",

  -- Comments
  "numToStr/Comment.nvim",

  -- Git -- 
  "lewis6991/gitsigns.nvim",             -- fast git decorations 

  -- LSP
  "neovim/nvim-lspconfig",               -- enable lsp
  "williamboman/mason.nvim",             -- simple to use language server installer
  "williamboman/mason-lspconfig.nvim",
  "jose-elias-alvarez/null-ls.nvim",     -- for formatters and linters

  -- Lualine
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }
  },

 -- Markdown
  {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  -- Snippets
  "L3MON4D3/LuaSnip",                    -- snippet Engine for Neovim written in Lua

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",        -- Find, filter, preview, pick. all lua, with telescope
    dependencies = { {"nvim-lua/plenary.nvim"} }
  },

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
})

