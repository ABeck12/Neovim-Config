return {
    "tpope/vim-fugitive",

    config = function()
        vim.keymap.set("n", "<leader>gd", ":Gvdiffsplit<CR>", { desc = "[G]it [D]iff" })
        vim.keymap.set("n", "<leader>gs", ":Git status<CR>", { desc = "[G]it [S]tatus" })
    end
}
