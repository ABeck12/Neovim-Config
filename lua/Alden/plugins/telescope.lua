return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
        "folke/todo-comments.nvim",
    },

    config = function()
        local telescope = require("telescope")
        local builtin = require("telescope.builtin")

        telescope.setup()
        telescope.load_extension("fzf")

        vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "[P]review [F]iles" })
        vim.keymap.set('n', '<leader>pg', builtin.git_files, { desc = "[P]review [G]it Files" })
        vim.keymap.set('n', '<leader>pr', builtin.oldfiles, { desc = "[P]review [R]ecent Files" })

        vim.keymap.set('n', '<leader>/', function()
            -- You can pass additional configuration to Telescope to change the theme, layout, etc.
            builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                winblend = 10,
                previewer = false,
            })
        end, { desc = '[/] Fuzzily search in current buffer' })

    end
}
