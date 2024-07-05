return {
    "goolord/alpha-nvim",
    config = function()
        local alpha = require('alpha')
        local dashboard = require('alpha.themes.dashboard')
        -- dashboard.section.header.val = 'foo'
        dashboard.section.buttons.val = {
            -- dashboard.button("SPC pf", "Open File", ""),
            -- dashboard.button("SPC pv", "Open File Explorer", "")

            -- dashboard.button( "e", "  New file" , ":ene <BAR> startinsert <CR>"),
            -- dashboard.button( "q", "  Quit NVIM" , ":qa<CR>"),
            -- dashboard.button( "q", "  Quit NVIM" , ":qa<leader>"),
        }
        local handle = io.popen('fortune')
        local fortune = handle:read("*a")
        handle:close()
        dashboard.section.footer.val = fortune
        alpha.setup(dashboard.opts)
    end
}
