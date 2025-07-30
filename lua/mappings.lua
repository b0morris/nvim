require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>fm", require("telescope.builtin").marks, {desc = "telescope find marks"})
map("n", "<leader>cc", "<cmd>ClangdSwitchSourceHeader<CR>", {desc = "C++ Switch Source/Header"})
-- vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
