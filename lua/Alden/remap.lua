vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
--vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
--vim.keymap.set('n', '<leader>pg', builtin.git_files, {})
