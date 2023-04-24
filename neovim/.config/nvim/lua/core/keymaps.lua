local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Move to window using the <alt> hjkl keys
keymap("n", "<C-h>", "<C-w>h", { desc = "Go to left window", noremap = true, silent = true })
keymap("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", noremap = true, silent = true })
keymap("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", noremap = true, silent = true })
keymap("n", "<C-l>", "<C-w>l", { desc = "Go to right window", noremap = true, silent = true })

-- Resize window using <alt> arrow keys
keymap("n", "<A-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height", silent = true })
keymap("n", "<A-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height", silent = true })
keymap("n", "<A-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width", silent = true })
keymap("n", "<A-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width", silent = true })

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Delete buffers
keymap("n", "<leader>bd", ":Bdelete!<CR>", opts)

-- Don't accidently create macros when trying to quit
keymap('n', 'Q', 'q', opts)
keymap('n', 'q', '<nop>', opts)

-- quit
keymap("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- Clear search with <esc>
keymap("n", "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch", silent = true })

-- Insert --
-- Press jk fast to exit insert mode 
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Clear search with <esc>
keymap("i", "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch", silent = true })

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
