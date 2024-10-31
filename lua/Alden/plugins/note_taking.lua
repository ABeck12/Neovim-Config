return {
    { "dhruvasagar/vim-table-mode" },
    { "opdavies/toggle-checkbox.nvim" },
    vim.keymap.set("n", "<leader>tc", ":lua require('toggle-checkbox').toggle()<CR>"),

    --{
    --    'MeanderingProgrammer/render-markdown.nvim',
    --    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    --    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    --    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    --    ---@module 'render-markdown'
    --    ---@type render.md.UserConfig
    --    opts = {},
    --},

}
