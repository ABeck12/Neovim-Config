return {
    "akinsho/toggleterm.nvim",

    config = function()
        local shell = "bash" -- either "pwsh" or "bash"

        if shell == "bash" then
            vim.cmd [[let &shell = '"C:\Program Files\Git\bin\bash.exe"']]
            vim.cmd [[let &shellcmdflag = '-s']]
        end

        if shell == "pwsh" then
            vim.cmd("let &shell = has('win32') ? 'powershell' : 'pwsh'")
            vim.cmd(
                "let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'")
            vim.cmd("let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'")
            vim.cmd("let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'")
            vim.cmd("set shellquote= shellxquote=")
        end

        require("toggleterm").setup {
            open_mapping = [[<C-j>]],
            hide_numbers = true,
            shade_filetypes = {},
            shade_terminals = true,
            start_in_insert = true,
            insert_mappings = true,
            persist_size = true,
            persist_mode = true,
            close_on_exit = false,
        }
    end
}
