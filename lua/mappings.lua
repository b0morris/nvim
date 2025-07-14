require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
map("n", "<leader>X", ":%bd|e#|bd#<CR>", {desc = "Close all other buffers"})

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>fm", require("telescope.builtin").marks, {desc = "telescope find marks"})
map("n", "<leader>fc", require("telescope.builtin").lsp_references, {desc = "telescope find LSP references"})


-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--
vim.api.nvim_create_user_command('W', 'w', {})
vim.api.nvim_create_user_command('Wq', 'wq', {})
vim.api.nvim_create_user_command('WQ', 'wq', {})
vim.api.nvim_create_user_command('Q', 'q', {})
vim.keymap.set('c', 'Q!', 'q!', {})

vim.opt.scrolloff = 5
