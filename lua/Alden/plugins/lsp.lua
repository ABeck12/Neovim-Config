return {
    "neovim/nvim-lspconfig",

    event = {
        "BufReadPre", "BufNewFile"
    },

    dependencies = {
        "williamboman/mason.nvim",
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        "williamboman/mason-lspconfig.nvim",

        { 'j-hui/fidget.nvim', opts = {} },
        "hrsh7th/nvim-cmp",
    },

    config = function()
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )

        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "clangd",
                "basedpyright",
                "ruff_lsp",
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,

                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    }
                end,

                ["clangd"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.clangd.setup {
                        capabilities = capabilities,
                        cmd = {
                            "clangd",
                            "--header-insertion=never",
                            "--clang-tidy"
                        }
                    }
                end,

                ["basedpyright"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.basedpyright.setup {
                        capabilities = capabilities,
                        settings = {
                            pyright = {
                                autoImportCompletion = true,
                                disableOrganizeImports = true,
                            },
                            python = {
                                analysis = {
                                    typeCheckingMode = "basic"
                                },
                                pythonPath = vim.fn.exepath("python3"),
                            }
                        },
                    }
                end,

            }
        })

        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(event)
                local norrmap = function(keys, func, desc)
                    vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
                end

                norrmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
                norrmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
                norrmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
                norrmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
                norrmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
                norrmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
                norrmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
                norrmap('K', vim.lsp.buf.hover, 'Hover Documentation')
                norrmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

                norrmap('<leader>ti', function()
                    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
                end, '[T]oggle [I]nlay Hints')

                vim.lsp.inlay_hint.enable()

                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if client and client.server_capabilities.documentHighlightProvider then
                    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                        buffer = event.buf,
                        callback = vim.lsp.buf.document_highlight,
                    })

                    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                        buffer = event.buf,
                        callback = vim.lsp.buf.clear_references,
                    })
                end

                if client.config.name == "clangd" then
                    vim.keymap.set("n", "<A-o>", vim.cmd.ClangdSwitchSourceHeader,
                        { desc = "LSP: Swap source and header C/C++" })
                else
                    vim.keymap.set("n", "<A-o>", "<nop>")
                end
            end
        })
    end
}
