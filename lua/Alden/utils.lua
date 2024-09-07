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

function utils.close_if_not_last_opened()
    local buffers = vim.api.nvim_list_bufs()
    local num_nonempty_buf = 0
    for _, bufnr in ipairs(buffers) do
        if vim.api.nvim_buf_is_loaded(bufnr) and vim.api.nvim_buf_get_option(bufnr, 'buftype') == '' and
            vim.api.nvim_buf_get_name(bufnr) ~= "" then
            num_nonempty_buf = num_nonempty_buf + 1
        end
    end
    if num_nonempty_buf > 1 then
        vim.cmd.bd()
    else
        vim.cmd.bd()
        require("Alden.plugins.btw").open()
    end
end

return utils
