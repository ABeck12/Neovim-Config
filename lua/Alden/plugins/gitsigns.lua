return {
    "lewis6991/gitsigns.nvim",

    config = function()
        require('gitsigns').setup({
            signs = {
                add       = { text = '┃' },
                change    = { text = '┃' },
                delete    = { text = '_' },
                topdelete = { text = '‾' },
                -- changedelete = { text = '~' },
                untracked = { text = '┆' },
            },
            -- vim.cmd('hi GitSignsAdd guifg=#0d540c guibg=NONE'),

        })
        -- vim.cmd('hi GitSignsAdd guifg=#487e02 guibg=NONE')
        -- vim.cmd('hi GitSignsChange guifg=#1b81a8 guibg=NONE')
        -- vim.cmd('hi GitSignsDelete guifg=#f14c4c guibg=NONE')
    end

    -- vim.cmd('hi GitSignsAdd guifg=#487e02 guibg=NONE'),
    -- vim.cmd('hi GitSignsChange guifg=#1b81a8 guibg=NONE'),
    -- vim.cmd('hi GitSignsDelete guifg=#f14c4c guibg=NONE'),


    -- vim.cmd('hi GitSignsAdd guibg=#333333 guifg=#d2ebbe ctermbg=none')
    -- vim.cmd('hi DiffChange guibg=#333333 guifg=#dad085 ctermbg=none')
    -- vim.cmd('hi DiffDelete guibg=#333333 guifg=#f0a0c0 ctermbg=none')
    -- vim.cmd('hi! DiffAdd guifg=#ffffff ctermfg=100')
    -- vim.cmd('hi! DiffChange guifg=#ffffff ctermfg=0')
    -- vim.cmd('hi! DiffDelete guifg=#ffffff ctermfg=0')
    -- vim.cmd('hi! DiffText guifg=#ffffff ctermfg=0')
}
