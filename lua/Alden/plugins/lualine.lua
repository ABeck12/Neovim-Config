return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },

    config = function()
        local clients_lsp = function()
            local bufnr = vim.api.nvim_get_current_buf()

            local clients = vim.lsp.get_clients({bufnr=bufnr})
            if next(clients) == nil then
                return ''
            end

            local c = {}
            for _, client in pairs(clients) do
                table.insert(c, client.name)
            end
            return '\u{f085} ' .. table.concat(c, '|')
        end

        require('lualine').setup({
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = { 'filename' },
                lualine_x = { clients_lsp, 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
        })
    end

}
