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

return {
    "kevinhwang91/nvim-ufo",
    dependencies = { 'kevinhwang91/promise-async' },
    config = function()
        require("ufo").setup({
            provider_selector = function(bufnr, filetype, buftype)
                return { 'treesitter', 'indent' }
            end
        })
    end
}
-- See https://github.com/kevinhwang91/nvim-ufo/issues/4 for more info on good setups
