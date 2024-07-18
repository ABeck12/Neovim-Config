return {
    "tpope/vim-commentary",

    config = function()
        vim.cmd([[
            augroup set_commentstring_cpp
            autocmd!
            autocmd FileType cpp setlocal commentstring=//\ %s
            autocmd FileType c setlocal commentstring=//\ %s
            autocmd FileType h setlocal commentstring=//\ %s
            autocmd FileType hpp setlocal commentstring=//\ %s
            augroup END
        ]])
    end
}
