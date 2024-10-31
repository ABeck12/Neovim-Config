return {
    { "dhruvasagar/vim-table-mode" },
    { "opdavies/toggle-checkbox.nvim" },
    vim.keymap.set("n", "<leader>tc", ":lua require('toggle-checkbox').toggle()<CR>")
}
