local utils = {}
function utils.format()
    local function is_lsp_attached()
        local clients = vim.lsp.get_active_clients()
        local buffer = vim.api.nvim_get_current_buf()

        for _, client in pairs(clients) do
            if client.attached_buffers[buffer] then
                return true
            end
        end
        return false
    end

    if is_lsp_attached() then
        -- format using lsp if attached
        vim.lsp.buf.format()
    else
        -- otherwise use vim to reindent
        local cursor_position = vim.api.nvim_win_get_cursor(0)
        vim.cmd("normal! ggVG=")
        vim.api.nvim_win_set_cursor(0, cursor_position)
    end
end

return utils
