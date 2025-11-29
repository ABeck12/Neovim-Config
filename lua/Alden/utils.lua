local utils = {}

function utils.format()
    local bufnr = vim.api.nvim_get_current_buf()
    local clients = vim.lsp.get_clients({ bufnr = bufnr })
    local is_attached = #clients > 0

    if is_attached then
        -- format using lsp if attached
        vim.lsp.buf.format()
    else
        -- otherwise use vim to reindent
        local cursor_position = vim.api.nvim_win_get_cursor(0)
        vim.cmd("normal! ggVG=")
        vim.api.nvim_win_set_cursor(0, cursor_position)
    end
end

function utils.check_number_real_buffers()
    local buffers = vim.api.nvim_list_bufs()
    local num_nonempty_buf = 0
    for _, bufnr in ipairs(buffers) do
        if vim.api.nvim_buf_is_loaded(bufnr) and vim.api.nvim_buf_get_option(bufnr, 'buftype') == '' and
            vim.api.nvim_buf_get_name(bufnr) ~= "" then
            num_nonempty_buf = num_nonempty_buf + 1
        end
    end
    return num_nonempty_buf
end

-- Check if path is a directory or file.
-- Returns nil is path doesn't exist. otherwise returns "file", "directory", "link", "socket", etc.
function utils.path_type(path)
    local stat = vim.loop.fs_stat(path)
    if not stat then
        return nil
    end
    return stat.type
end

-- Implements the clangd swapSourceHeader function.
-- Returns nil on failure otherwise returns name of file to swap to.
function utils.clangd_swap_source_header(client, bufnr)
    local params = vim.lsp.util.make_text_document_params(0)
    client.request("textDocument/switchSourceHeader", params, function(err, result)
        if err then
            vim.notify("Clangd error switching source/header: " .. err.message, vim.log.levels.ERROR)
            return
        end
        if not result or result == "" then
            return
        end
        vim.cmd.edit(vim.uri_to_fname(result))
        return result
    end, bufnr)
end

-- Attemps to swap between cpp and cppm files within the same directory if they exist.
-- Returns nil on failure otherwise returns name of file to swap to.
function utils.swap_impl_module_file_cpp()
    local current_file = vim.fn.expand("%:r")
    local current_extension = vim.fn.expand("%:e")

    local target_extension = (current_extension == "cpp") and "cppm" or "cpp"
    local target_file = current_file .. "." .. target_extension

    if vim.fn.filereadable(target_file) == 1 then
        vim.cmd("e " .. target_file)
        return target_file
    else
        vim.notify("Target file does not exist: " .. target_file, vim.log.levels.WARN)
    end
end

return utils
