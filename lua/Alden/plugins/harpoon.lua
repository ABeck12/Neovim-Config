return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
        local harpoon = require("harpoon")

        -- REQUIRED
        harpoon:setup()
        -- REQUIRED

        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, {desc = "Add to Harpoon"})
        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, {desc = "Toggle Harpoon menu"})

        vim.keymap.set("n", "<A-1>", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<A-2>", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<A-3>", function() harpoon:list():select(3) end)
        vim.keymap.set("n", "<A-4>", function() harpoon:list():select(4) end)

        -- -- Toggle previous & next buffers stored within Harpoon list
        -- Alt j,k are used for moving around multiple windows
        -- vim.keymap.set("n", "<A-j>", function() harpoon:list():prev() end)
        -- vim.keymap.set("n", "<A-k>", function() harpoon:list():next() end)

    end
}
