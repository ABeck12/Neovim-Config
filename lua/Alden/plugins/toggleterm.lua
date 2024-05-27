return {
    "akinsho/toggleterm.nvim",

    config = function()
        -- vim.cmd [[let &shell = '"C:\Program Files\Git\bin\bash.exe"']]
        -- vim.cmd [[let &shellcmdflag = '-s']]
        local powershell_options = {
            shell = vim.fn.executable "powershell" == 1 and "pwsh" or "powershell",
            -- shell = vim.fn.executable "powershell",
            -- shellcmdflag =
            -- "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
            -- shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
            -- shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
            -- shellquote = "",
            -- shellxquote = "",
        }

        for option, value in pairs(powershell_options) do
            vim.opt[option] = value
        end

        require("toggleterm").setup {
            open_mapping = [[<C-j>]],

            shell = "pwsh",
            -- direction = "float",
            -- float_opts = {
            --     border = "curved",
            --     winblend = 3,
            -- }
        }
    end
}
