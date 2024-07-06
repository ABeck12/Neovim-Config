return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },

    config = function()
        vim.keymap.set("n", "<C-b>", ":Neotree toggle<cr>", { noremap = true })
        require("neo-tree").setup({
            close_if_last_window = true,
            -- sources = { "filesystem", "buffers", "git_status" },
            window = {
                position = "left",
                width = 34,
                mapping_options = {
                    noremap = true,
                    nowait = true,
                },
            }
        })
	vim.cmd("Neotree show")
	vim.cmd("Neotree close")
	vim.cmd("Neotree show")
        -- vim.api.nvim_create_augroup("neotree", {})
        -- vim.api.nvim_create_autocmd("UiEnter", {
        --     desc = "Open Neotree automatically",
        --     group = "neotree",
        --     callback = function()
        --         if vim.fn.argc() == 0 and not vim.fn.exists "s:std_in" then
        --             vim.cmd "Neotree toggle"
        --         end
        --     end,
        -- })
    end

}
