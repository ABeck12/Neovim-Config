-- These are not needed when using nvim-ufo plugin
-- function FoldText()
--     local line = vim.fn.getline(vim.v.foldstart)
--     local numOfLines = vim.v.foldend - vim.v.foldstart
--     local fillCount = vim.fn.winwidth('%') - #line - #tostring(numOfLines) - 14
--     return line .. '  ' .. string.rep('.', fillCount) .. ' (' .. numOfLines .. ' L)'
-- end
-- vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- vim.opt.foldtext = [[v:lua.FoldText()]]

vim.opt.foldcolumn = "1"
vim.opt.foldmethod = "expr"
vim.opt.foldlevel = 99
vim.opt.fillchars:append({ fold = ' ' }) -- removes trailing dots

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
