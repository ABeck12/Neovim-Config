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
            },
            filesystem = {
                hide_dotfiles = false,
                hide_gitignored = false,
                hide_by_name = {
                  ".github",
                --   ".gitignore",
                  "package-lock.json",
                },
                never_show = { ".git" },

                -- visible = true, 
                -- -- hide_hidden = false
                filtered_items = {
                    hide_gitignored = false,
                }
            },
            default_component_settings = {
                git_status = {
                    symbols = {
                        -- Change type
                        added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
                        modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
                        deleted   = "✖", -- this can only be used in the git_status source
                        renamed   = "󰁕", -- this can only be used in the git_status source
                        -- Status type
                        untracked = "",
                        ignored   = "",
                        unstaged  = "",
                        staged    = "",
                        conflict  = "",
                        -- untracked = "",
                        -- ignored   = "",
                        -- unstaged  = "󰄱",
                        -- staged    = "",
                        -- conflict  = "",
                    }
                },
            }
        })
        -- vim.cmd("Neotree show")
        -- vim.cmd("Neotree close")
        -- vim.cmd("Neotree show")
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
