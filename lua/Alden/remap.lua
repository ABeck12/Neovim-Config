vim.keymap.set("n", "<leader>pv", vim.cmd.Explore, { desc = "[P]re[v]iew File Tree", noremap = true })

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = "Move line up" })

vim.keymap.set('n', 'yap', 'vapy', { desc = "Yank around paragraph" })

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "[F]ormat" })

vim.keymap.set("n", "<A-o>",
    function()
        vim.cmd("w")
        local status_ok = pcall(vim.cmd.ClangdSwitchSourceHeader)
        if not status_ok then
            return
        end
    end,
    { desc = "LSP: Swap source and header C/C++" }
)

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

vim.keymap.set("n", "<A-w>",
    function()
        local buffers = vim.api.nvim_list_bufs()
        local numNonEmptyBuffers = 0
        for _, bufnr in ipairs(buffers) do
            if vim.api.nvim_buf_is_loaded(bufnr) and vim.api.nvim_buf_get_option(bufnr, 'buftype') == '' and
                vim.api.nvim_buf_get_name(bufnr) ~= "" then
                numNonEmptyBuffers = numNonEmptyBuffers + 1
            end
        end

        if numNonEmptyBuffers > 0 then
            vim.cmd.bd()
        end

        local buffers2 = vim.api.nvim_list_bufs()
        local numEmptyBuffers2 = 0
        for _, bufnr in ipairs(buffers2) do
            if vim.api.nvim_buf_is_loaded(bufnr) and vim.api.nvim_buf_get_option(bufnr, 'buftype') == '' and
                vim.api.nvim_buf_get_name(bufnr) == "" then
                numEmptyBuffers2 = numEmptyBuffers2 + 1
            end
        end

        if numEmptyBuffers2 == 1 then
            vim.cmd.Alpha()
        end
    end,
    { desc = "Close current buffer" }
)

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
