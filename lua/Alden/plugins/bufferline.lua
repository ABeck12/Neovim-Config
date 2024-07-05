return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',

    config = function()
        vim.opt.termguicolors = true
        local bufferline = require("bufferline")

        bufferline.setup({
            options = {
                themable = true,
                show_tab_indicators = true,
                separator_style = "slant",
                diagnostics = "nvim_lsp",
                style_preset = {
                    bufferline.style_preset.no_italic,
                    bufferline.style_preset.no_bold
                },
                -- show_close_icon = false,
                hover = {
                    enabled = true,
                    delay = 50,
                    reveal = { 'close' }
                }
            }

        })
    end
}
