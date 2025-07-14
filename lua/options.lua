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

-- Restore cursor position when opening files (row AND column)
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local line = vim.fn.line("'\"")
    local col = vim.fn.col("'\"")
    if line > 1 and line <= vim.fn.line("$") then
      vim.api.nvim_win_set_cursor(0, {line, col - 1})  -- col is 0-indexed in nvim_win_set_cursor
    end
  end,
})
