----------------------
-- General settings --
----------------------
local set = vim.opt
set.autoindent = true                        -- good auto indent
set.clipboard = "unnamedplus"                -- allows neovim to access the system clipboard
set.expandtab = true                         -- converts tabs to spaces
set.fileencoding = "utf-8"                   -- The encoding written to file
set.incsearch = true                         -- sets incremental search
set.iskeyword:append("-")                    -- treat dash separated words as a word text object
set.mouse = 'a'                              -- enable mouse support
set.shell = "/bin/zsh"                       -- set your shell to bash or zsh
set.shortmess:append "sI"                    -- disable nvim intro
set.shortmess:append "c"                     -- don't give |ins-completion-menu| messages
set.smartindent = true                       -- makes indenting smart
set.smarttab = true                          -- makes tabbing smarter will realize you have 2 vs 4
set.swapfile = false                         -- don't use swapfile
set.timeoutlen = 400			                   -- time (ms) to wait for a mapped sequence to complete
set.updatetime = 300                         -- faster completion
vim.cmd [[set completeopt=menuone,noselect]] -- mostly just for cmp
vim.cmd [[set formatoptions-=cro]]           -- stop newline continution of comments

---------------
-- Neovim UI --
---------------
set.cmdheight = 2                            -- more space for displaying messages
set.conceallevel = 0                         -- so that I can see `` in markdown files
set.cursorline = true                        -- enable highlighting of the current line
set.number = true                            -- absolute line numbers
set.numberwidth = 5                          -- set number column width to 2 {default 4}
set.laststatus = 2                           -- always display the status line
set.linebreak = true                         -- companion to wrap, don't split words
set.pumheight = 10                           -- makes popup menu smaller
set.relativenumber = true                    -- vim’s absolute, relative and hybrid line numbers
set.ruler = true              	             -- show the cursor position all the time
set.scrolloff = 8                            -- minimal number of screen lines to keep above and below the cursor
set.shiftwidth = 2                           -- change the number of space characters inserted for indentation
set.showtabline = 2                          -- always show tabs
set.signcolumn = "yes"			                 -- always show the sign column, otherwise it would shift the text each time 
set.splitbelow = true                        -- horizontal splits will automatically be below
set.splitright = true                        -- vertical splits will automatically be to the right
set.tabstop = 2                              -- insert 2 spaces for a tab
set.termguicolors = true                     -- set term gui colors (most terminals support this), kinda buggy off for now
set.title = false                            -- show current txt that you editing, This causes a weird visual bug with nvim-cmp menu https://github.com/LunarVim/LunarVim/issues/3481
set.wrap = true                              -- display lines as one long line
