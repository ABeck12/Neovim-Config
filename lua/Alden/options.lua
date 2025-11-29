local theme = require("Alden.theme")

vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.scrolloff = 10

-- Set block cursor for all modes
-- vim.opt.guicursor = "n-v-i-c:block-Cursor"

vim.opt.updatetime = 50

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.signcolumn = "yes"

vim.opt.incsearch = true
vim.opt.hlsearch = true

vim.o.timeout = true
vim.o.timeoutlen = 300

-- Theme
vim.cmd("colorscheme " .. theme.name)
vim.opt.termguicolors = true

local function set_line_number_colors()
    local orange = "#ff9e64"
    -- local light_blue = "#7aa2f7"
    local whiteish = '#a9b1d6'
    -- local electric_blue = "#51b3ec"
    -- local electric_red = "#fb508f"

    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = whiteish, bold = false })
    vim.api.nvim_set_hl(0, 'LineNr', { fg = orange, bold = true })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = whiteish, bold = false })
end
-- set_line_number_colors()

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN]  = "",
            [vim.diagnostic.severity.INFO]  = "",
            [vim.diagnostic.severity.HINT]  = "",
        },
    },
})

-- Force dissable italics for any theme
local function dissable_italics()
    local hl_groups = vim.api.nvim_get_hl(0, {})
    for key, hl_group in pairs(hl_groups) do
        if hl_group.italic then
            vim.api.nvim_set_hl(0, key, vim.tbl_extend("force", hl_group, { italic = false }))
        end
    end
end
-- dissable_italics()

-- Maximum number of items to show in a popup
vim.o.pumheight = 15

-- Enable hidden buffers, allows for multiple open buffers
vim.o.hidden = true

vim.opt.laststatus = 3

vim.g.netrw_banner = 0

vim.opt.swapfile = false
vim.opt.backup = false

-- Folds
vim.opt.foldcolumn = "1"
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.opt.foldmethod = "expr"
vim.opt.foldlevel = 99

vim.o.statuscolumn = '%s%=%l %#FoldColumn#%{'
    .. 'foldlevel(v:lnum) > foldlevel(v:lnum - 1)'
    .. '? foldclosed(v:lnum) == -1'
    .. '? ""'
    .. ': ""'
    .. ': foldlevel(v:lnum) == 0'
    .. '? " "'
    .. ': " "'
    .. '} '

-- Opt out of default lsp keymaps
vim.keymap.del('n', 'gra')
vim.keymap.del('n', 'gri')
vim.keymap.del('n', 'grn')
vim.keymap.del('n', 'grr')
vim.keymap.del('n', 'grt')
vim.keymap.del('n', 'gO')
