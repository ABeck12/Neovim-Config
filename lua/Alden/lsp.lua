local utils = require("Alden.utils")
local log = require("Alden.log")

local function setup_capabilities()
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
    if ok then
        capabilities = cmp_lsp.default_capabilities(capabilities)
        return capabilities
    end
    vim.notify("Nvim cmp not found! Using default capabilities \"{}\"", vim.log.levels.WARN)
    return {}
end

local function default_lsp_on_attach(client, bufnr)
    vim.lsp.inlay_hint.enable(true)

    vim.keymap.set("n", "<leader>ti", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end,
        { desc = "Toggle Inlay Hints" })
    vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions,
        { buffer = bufnr, desc = 'Goto Definition' })
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references,
        { buffer = bufnr, desc = 'Goto References' })
    vim.keymap.set('n', 'gI', require('telescope.builtin').lsp_implementations,
        { buffer = bufnr, desc = 'Goto Implementation' })
    vim.keymap.set('n', '<leader>D', require('telescope.builtin').lsp_type_definitions,
        { buffer = bufnr, desc = 'Type Definition' })
    vim.keymap.set('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols,
        { buffer = bufnr, desc = 'Document Symbols' })
    vim.keymap.set('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols,
        { buffer = bufnr, desc = 'Workspace Symbols' })
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = bufnr, desc = 'Rename' })
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr, desc = 'Code Action' })
    -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr, desc = 'Hover Documentation' }) -- This is mapped by default
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr, desc = 'Goto Declaration' })

    vim.keymap.set('n', '<A-o>', '<nop>')

    if client.server_capabilities.foldingRangeProvider then
        vim.opt.foldmethod = "expr"
        vim.opt.foldexpr = "v:lua.vim.lsp.foldexpr()"
    end

    vim.diagnostic.config({
        virtual_text = true,      -- Show errors inline
        underline = true,         -- Underline errors
        update_in_insert = false, -- Dont update while typing
    })
end


vim.lsp.config['lua-ls'] = {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = { "vim", "it", "describe", "before_each", "after_each" },
            }
        }
    },
}
vim.lsp.enable("lua-ls")


-- Treat C++ module files as cpp filetype
vim.filetype.add({
    pattern = {
        ['*.cppm'] = 'cpp',
        ['*.ixx'] = 'cpp',
        ['*.mpp'] = 'cpp',
    }
})
vim.lsp.config['clangd'] = {
    cmd = { 'clangd',
        "--experimental-modules-support",
        "--header-insertion=never",
        "--clang-tidy",
    },
    filetypes = { 'cpp', 'c' },
    root_markers = { '.git', 'compile_commands.json' },
    on_attach = function(client, bufnr)
        default_lsp_on_attach(client, bufnr)
        vim.keymap.set('n', '<A-o>',
            function()
                local clangd_result = utils.clangd_swap_source_header(client, bufnr)
                if clangd_result ~= nil then return end -- clangd has successfuly swapped source and header files

                -- Try to find a module file if possible
                local module_result = utils.swap_impl_module_file_cpp()
                if module_result ~= nil then return end -- found corresponding cppm/cpp module/implementation files

                -- Otherwise we havn't found anything
                vim.notify("No corresponding file found", vim.log.levels.WARN)
            end,
            { desc = "Swap Source and Header" })
    end
}
vim.lsp.enable("clangd")


vim.lsp.config['pyright'] = {
    cmd = { 'pyright-langserver', '--stdio' },
    filetypes = { 'python' },
    root_markers = { '.git', 'pyproject.toml' },
    settings = {
        pyright = {
            autoImportCompletion = true,
            disableOrganizeImports = false,
        },
        python = {
            analysis = {
                typeCheckingMode = "strict"
            },
            -- pythonPath = vim.fn.exepath("python3"),
        }
    },
}
vim.lsp.enable("pyright")



vim.lsp.config['rust-analyzer'] = {
    cmd = { 'rust-analyzer' },
    filetypes = { 'rust' },
    root_markers = { '.git', 'Cargo.toml' },
}
vim.lsp.enable("rust-analyzer")


-- Default lsp setup
local capabilities = setup_capabilities()
vim.lsp.config('*', {
    root_markers = { '.git' },
    capabilities = capabilities,
    on_attach = default_lsp_on_attach
})
