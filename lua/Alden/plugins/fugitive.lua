return {
    "tpope/vim-fugitive",
    lazy=true,
    config = function()
        vim.keymap.set("n", "<leader>gd", ":Gvdiffsplit<CR>", { desc = "Git Diff" })
        vim.keymap.set("n", "<leader>gs", ":Git status<CR>", { desc = "Git Status" })
    end
}
