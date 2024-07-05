return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    config = function ()
        require("nvim-treesitter").setup({
            ensure_installed = { "c", "c++", "lua", "vim", "vimdoc", "python", "markdown", "markdown_inline" },
        })
        -- local builtin = require("nvim-treesitter.builtin")
        -- vim.keymap.set("n", "<C-o>", builtin.symbols)
    end
}
