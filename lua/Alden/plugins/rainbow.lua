return {
    "HiPhish/rainbow-delimiters.nvim",

    config = function()
        vim.g.rainbow_delimiters = {
            highlight = {
                "FFFFFF",
                'RainbowDelimiterYellow',
                'RainbowDelimiterViolet',
                -- 'RainbowDelimiterRed',
                -- 'RainbowDelimiterBlue',
                -- 'RainbowDelimiterGreen',
                -- 'RainbowDelimiterOrange',
                -- 'RainbowDelimiterCyan',
            }
        }
    end
}
