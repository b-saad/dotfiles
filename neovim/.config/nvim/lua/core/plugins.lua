local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install your plugins here
return packer.startup(function(use)
    use "wbthomason/packer.nvim"              -- a use-package inspired plugin manager for Neovim
    use {
      "goolord/alpha-nvim",                   -- nvim dashboard
      requires = { 'nvim-tree/nvim-web-devicons' }
    }
    use "kyazdani42/nvim-web-devicons"        -- Lua fork of vim-web-devicons for neovim
    use "kyazdani42/nvim-tree.lua"            -- A file explorer tree for neovim written in lua
    use "lukas-reineke/indent-blankline.nvim" -- Indent guides
    use "RRethy/vim-illuminate"               -- Same word highlighting (ex. variable usage)
    use "windwp/nvim-autopairs"               -- Autopairs, integrates with both cmp and treesitter

    -- Bufferline
    use {
      "akinsho/bufferline.nvim",
      tag = "v3.*",
      requires = "kyazdani42/nvim-web-devicons"
    }
    use "famiu/bufdelete.nvim"                -- Better buffer closing behaviour

    -- Cmp
    use "hrsh7th/nvim-cmp"                    -- completion plugin for neovim coded in Lua
    use "hrsh7th/cmp-buffer"                  -- nvim-cmp source for buffer words
    use "hrsh7th/cmp-path"                    -- nvim-cmp source for path
    use "hrsh7th/cmp-nvim-lsp"

    -- Colorschems
    use "sainnhe/gruvbox-material"

    -- Comments
    use "numToStr/Comment.nvim"

    -- Git -- 
    use "lewis6991/gitsigns.nvim"             -- fast git decorations 

    -- LSP
    use "neovim/nvim-lspconfig"               -- enable lsp
    use "williamboman/mason.nvim"             -- simple to use language server installer
    use "williamboman/mason-lspconfig.nvim"
    use "jose-elias-alvarez/null-ls.nvim"     -- for formatters and linters

    -- Lualine
    use {
      "nvim-lualine/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons", opt = true }
    }

   -- Markdown
    use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
    })

    -- Snippets
    use "L3MON4D3/LuaSnip"                    -- snippet Engine for Neovim written in Lua

    -- Telescope
    use {
      "nvim-telescope/telescope.nvim",        -- Find, filter, preview, pick. all lua, with telescope
      requires = { {"nvim-lua/plenary.nvim"} }
    }

    -- Treesitter
    use {
      "nvim-treesitter/nvim-treesitter",
      run = function()
        local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
        ts_update()
      end,
    }
  
    -- Which Key
    use "folke/which-key.nvim"                -- Keyboard shortcut helpers

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
