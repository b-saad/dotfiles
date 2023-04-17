
---- Core Settings ----------------------------------
require "core/keymaps"            -- Custom Keymaps
require "core/options"            -- General Options
require "core/plugins"            -- Plugins + Packer Config

--- LSP ---------------------------------------------
require "lsp"                     -- LSP plugins and setup

--- Plugin Configurations ---------------------------
require "config/alpha-nvim"       -- Dashboard
require "config/bufferline"       -- Buffferline
require "config/colorscheme"      -- Color scheme
require "config/comment"          -- Commenting
require "config/gitsigns"         -- Git signs
require "config/illuminate"       -- Same word highlighting
require "config/indent-blankline" -- Indent Guides
require "config/lualine"          -- Lua status line
require "config/nvim-autopairs"   -- Auto completion for brackets & quotes
require "config/nvim-cmp"         -- Auto Complete
require "config/nvim-tree"        -- Nvim-tree
require "config/telescope"        -- Fuzzy finder
require "config/treesitter"       -- Syntax Highlighting
