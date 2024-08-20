return {
    "HiPhish/rainbow-delimiters.nvim",

    config = function()
        vim.g.rainbow_delimiters = {
            highlight = {
                'RainbowDelimiterYellow',
                "FFFFFF"
                -- 'RainbowDelimiterRed',
                -- 'RainbowDelimiterViolet',
                -- 'RainbowDelimiterBlue',
                -- 'RainbowDelimiterGreen',
                -- 'RainbowDelimiterOrange',
                -- 'RainbowDelimiterCyan',
            }
        }
    end
}
