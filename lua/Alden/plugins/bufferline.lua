return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',

    config = function()
        local bufferline = require("bufferline")
        bufferline.setup({
            highlights = {
                fill= {
                    bg = "#16161e" -- This is the same color as the status bar background
                }
            },
            options = {
                themable = false,
                show_tab_indicators = true,
                -- separator_style = "slant",
                diagnostics = "nvim_lsp",
                indicator = {
                    style = "none"
                },
                style_preset = {
                    bufferline.style_preset.no_italic,
                    bufferline.style_preset.no_bold
                },
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "Explorer",
                        separator = true,
                        text_align = "center",
                    },
                },
                -- show_close_icon = false,
                hover = {
                    enabled = true,
                    delay = 50,
                    reveal = { 'close' }
                },

                custom_filter = function(buf, buf_nums)
                    if not vim.bo[buf].filetype == "help" then
                        return false
                    end
                    if not vim.fn.bufname(buf):match("[No Name]") then
                        return false
                    end

                    return true
                end,
            },
        })
    end

}
