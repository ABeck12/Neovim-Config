vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-p>', builtin.find_files, {})
--vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
-- vim.keymap.set('n', '<leader>pg', builtin.git_files, {})

vim.api.nvim_set_keymap('n', '<C-m>', ':Comment<CR>', { noremap = true })

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
