return {
    { "folke/tokyonight.nvim" },
    {
        "neanias/everforest-nvim",
        config = function()
            local everforest = require("everforest")
            everforest.setup({
                background = "hard",
                italics = true,
                colours_override = function(palette)
                    palette.bg0 = "#1e2326"
                end
            })
            everforest.load()
        end
    }
    -- { "rose-pine/neovim",                   name = "rose-pine" },
    -- { "rebelot/kanagawa.nvim" },
    -- { "briones-gabriel/darcula-solid.nvim", dependencies = { 'rktjmp/lush.nvim' } },
    -- { "catppuccin/nvim",                    name = "catppuccin",                                  priority = 1000 },
    -- { "Shatur/neovim-ayu" },
    -- -- { "xiantang/darcula-dark.nvim",         dependencies = { "nvim-treesitter/nvim-treesitter", } },
    -- { "doums/darcula" },
}
