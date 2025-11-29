return {
    -- List all themes that should be installed here. To select the active theme see Alden/theme.lua

    { "folke/tokyonight.nvim", priority = 1000 },
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
        end,
        priority = 1000
    },
    { "rose-pine/neovim",      name = "rose-pine",  priority = 1000 },
    { "rebelot/kanagawa.nvim", priority = 1000 },
    { "catppuccin/nvim",       name = "catppuccin", priority = 1000 },
}
