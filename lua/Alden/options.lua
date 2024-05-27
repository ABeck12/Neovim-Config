vim.g.have_nerd_font = false

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.scrolloff = 10

vim.opt.guicursor = ""

vim.opt.updatetime = 50

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.cmd 'set signcolumn=yes'

vim.opt.incsearch = true

-- vim.cmd.colorscheme("darcula")
-- vim.cmd.colorscheme("darcula-dark")

-- vim.cmd.colorscheme("ayu-dark")
-- vim.cmd.colorscheme "tokyonight"
-- vim.cmd.colorscheme "catppuccin"
-- vim.cmd.colorscheme "darcula-solid"
vim.cmd 'colorscheme darcula-solid'
vim.cmd 'set termguicolors'


vim.cmd('hi! LineNr guibg=none ctermbg=none')
vim.cmd('hi! SignColumn guibg=none ctermbg=none')
vim.cmd('hi GitSignsAdd guifg=#487e02 guibg=NONE')
vim.cmd('hi GitSignsChange guifg=#1b81a8 guibg=NONE')
vim.cmd('hi GitSignsDelete guifg=#f14c4c guibg=NONE')
