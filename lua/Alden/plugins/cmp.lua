return {
    "hrsh7th/nvim-cmp",
    event = 'InsertEnter',
    dependencies = {
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',

        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-buffer",

        "onsails/lspkind.nvim"        -- for ui
    },

    config = function()
        local cmp = require("cmp")

        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },

            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                -- ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<Enter>"] = cmp.mapping.confirm({ select = true }),
                ["<Tab>"] = cmp.mapping.confirm({ select = true }),
            }),

            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                { name = 'buffer' },
            }),

            -- ui settings for cmp
            window = {
                documentation = {
                    -- border = "rounded",                                                                         -- single|rounded|none
                    winhighlight =
                    "Normal:Normal,FloatBorder:FloatBorder,CursorLine:CursorLineBG,Search:None", -- BorderBG|FloatBorder
                },
                completion = {
                    winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
                    -- winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:CursorLineBG,Search:None", -- BorderBG|FloatBorder
                    -- border = "rounded", -- single|rounded|none
                    col_offset = -3,
                    side_padding = 0,
                },
            },

            -- formatting determines how each item in the auto complete dropdown will look
            formatting = {
                fields = { "kind", "abbr", "menu" },
                format = function(entry, vim_item)
                    local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(
                        entry, vim_item)
                    local strings = vim.split(kind.kind, "%s", { trimempty = true })
                    kind.kind = " " .. (strings[1] or "") .. " "
                    kind.menu = "    (" .. (strings[2] or "") .. ")"
                    return kind
                end,
            },

            -- formatting = {
            --     format = function(entry, vim_item),
            --         if vim.tbl_contains({ 'path' }, entry.source.name) then
            --             local icon, hl_group = require('nvim-web-devicons').get_icon(entry:get_completion_item().label)
            --             if icon then
            --                 vim_item.kind = icon
            --                 vim_item.kind_hl_group = hl_group
            --                 return vim_item
            --             end
            --         end
            --         return require("lspkind").cmp_format({ with_text = false })(entry, vim_item)
            --     end,
            -- },

        })
    end
}
