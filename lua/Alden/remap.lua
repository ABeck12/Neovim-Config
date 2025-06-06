local utils = require("Alden.utils")

vim.keymap.set("n", "<leader>pv", vim.cmd.Explore, { desc = "[P]re[v]iew File Tree", noremap = true })

vim.keymap.set("n", "<leader>hh", ":%s//g<left><left>", { desc = "Find and replace global" })
vim.keymap.set("n", "<leader>hg", ":%s//gc<left><left><left>", { desc = "Find and replace confirmation" })

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = "Move line up" })

vim.keymap.set('n', 'yap', 'vapy', { desc = "[Y]ank [A]round [P]aragraph" })

vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "[P]aste into void register" })

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "[Y]ank to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "[Y]ank to system clipboard" })

vim.keymap.set("n", "<leader>f", utils.format, { desc = "[F]ormat" })

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("i", "<C-h>", "<C-W>", { noremap = true })
vim.keymap.set("c", "<C-h>", "<C-W>", { noremap = true })

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "J", "mzJ`z", { desc = "Append to current paragraph" })

vim.keymap.set("n", "<A-.>", "<cmd> BufferLineCycleNext <CR>", { desc = "Go to next buffer" })     --"  cycle next buffer"
vim.keymap.set("n", "<A-,>", "<cmd> BufferLineCyclePrev <CR>", { desc = "Go to previous buffer" }) --"  cycle prev buffer"
vim.keymap.set("n", "<A->>", "<cmd> BufferLineMoveNext <CR>", { desc = "Move next buffer" })       --"  cycle next buffer"
vim.keymap.set("n", "<A-<>", "<cmd> BufferLineMovePrev <CR>", { desc = "Move previous buffer" })   --"  cycle prev buffer"

vim.keymap.set("n", "<A-h>", "<C-w>h")
vim.keymap.set("n", "<A-j>", "<C-w>j")
vim.keymap.set("n", "<A-k>", "<C-w>k")
vim.keymap.set("n", "<A-l>", "<C-w>l")

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix" })

vim.keymap.set("n", "<A-w>", utils.close_if_not_last_opened, { desc = "Close current buffer" })

vim.keymap.set("n", "<", "V<")
vim.keymap.set("n", ">", "V>")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
