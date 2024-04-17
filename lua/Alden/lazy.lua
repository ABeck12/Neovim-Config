local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
    spec = "Alden.plugins",
    change_detection = { notify = false }
})

-- require("lazy").setup("plugins")
-- require("lazy").setup({
--     -- "folke/which-key.nvim",
--     -- { "folke/neoconf.nvim",   cmd = "Neoconf" },
--     -- "folke/neodev.nvim",
--     require("lazy.telescope"),

--     {
--         'nvim-telescope/telescope.nvim',
--         tag = '0.1.6',
--         dependencies = { 'nvim-lua/plenary.nvim' }
--     },

--     { "folke/tokyonight.nvim" },

--     -- { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

--     -- { 'williamboman/mason.nvim' },
--     -- { 'williamboman/mason-lspconfig.nvim' },
--     --{ "williamboman/mason.nvim" },
--     --{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
--     --{'neovim/nvim-lspconfig'},
--     --{'hrsh7th/cmp-nvim-lsp'},
--     --{'hrsh7th/nvim-cmp'},
--     --{'L3MON4D3/LuaSnip'},
-- })
