vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open File Explorer" })

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = "Move line up" })

vim.keymap.set('n', 'yap', 'vapy', { desc = "Yank around paragraph" })

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format" })

vim.keymap.set("n", "<A-o>", vim.cmd.ClangdSwitchSourceHeader, { desc = "Swap source and header C/C++"})

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("i", "<C-h>", "<C-W>", { noremap = true })

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "J", "mzJ`z", { desc = "Append to current paragraph" })
