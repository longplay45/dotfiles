local opt = vim.opt

-- [[ Context ]]
opt.numberwidth = 7
opt.colorcolumn = '80'           -- str:  Show col for max line length
opt.number = true                -- bool: Show line numbers
opt.relativenumber = true        -- bool: Show relative line numbers
opt.scrolloff = 4                -- int:  Min num lines of context
opt.signcolumn = "yes"           -- str:  Show the sign column

-- [[ Filetypes ]]
opt.encoding = 'utf8'            -- str:  String encoding to use
opt.fileencoding = 'utf8'        -- str:  File encoding to use

local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
-- local expr_opts = { noremap = true, expr = true, silent = true }

-- Better escape using jk in insert and terminal mode
keymap("i", "jk", "<ESC>", default_opts)
keymap("t", "jk", "<C-\\><C-n>", default_opts)

-- Better save
keymap("n", "zz", ":update<cr>", default_opts)
keymap("i", "zz", "<Esc>:update<cr>gi", default_opts)

-- Better settings shortcut: 
keymap("n", "<leader>ev", ":edit /Users/i/.config/nvim/lua/custom/init.lua<cr>", default_opts)
keymap("n", "<leader>ez", ":edit /Users/i/.zshrc<cr>", default_opts)
keymap("n", "<leader>ek", ":edit /Users/i/.config/kitty/kitty.conf<cr>", default_opts)

