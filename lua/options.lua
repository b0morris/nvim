require "nvchad.options"

-- add yours here!

local o = vim.o

vim.o.mouse = "a"
vim.o.clipboard = "unnamedplus"

-- Disable popup menu
vim.cmd('aunmenu PopUp')

-- Clear popup menu autocmds
vim.cmd('autocmd! nvim.popupmenu')

-- Right click copies selected text
vim.keymap.set('v', '<RightMouse>', '"+y')
