vim.g.have_nerd_font = false

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.scrolloff = 10

vim.opt.guicursor = "n-v-i-c:block-Cursor"

vim.opt.updatetime = 50

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.cmd 'set signcolumn=yes'

vim.opt.incsearch = true

vim.cmd [[colorscheme tokyonight-night]]
-- vim.cmd [[colorscheme darcula]]
-- vim.cmd [[colorscheme kanagawa-dragon]]
-- vim.cmd [[colorscheme rose-pine]]

vim.opt.termguicolors = true

function LineNumberColors()
    -- vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#51B3EC', bold=true })
    -- vim.api.nvim_set_hl(0, 'LineNr', { fg = 'white', bold = true })
    -- vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#a9b1d6', bold=true }) -- whiteish
    vim.api.nvim_set_hl(0, 'LineNr', { fg = '#ff9e64', bold = true }) -- orange
    -- vim.api.nvim_set_hl(0, 'LineNr', { fg = '#7aa2f7', bold = true }) -- light blue
    -- vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#a9b1d6', bold=true }) -- whiteish
    -- vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#FB508F', bold=true })
end

LineNumberColors()

vim.o.pumheight = 15

vim.o.hidden = true

vim.opt.laststatus = 3

local hl_groups = vim.api.nvim_get_hl(0, {})

for key, hl_group in pairs(hl_groups) do
    if hl_group.italic then
        vim.api.nvim_set_hl(0, key, vim.tbl_extend("force", hl_group, { italic = false }))
    end
end

vim.g.netrw_banner = 0
