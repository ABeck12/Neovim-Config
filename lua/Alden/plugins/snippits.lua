return {}
-- local luasnip = require("luasnip")
  -- local cmp = require("cmp")

--   opts.mapping = vim.tbl_extend("force", opts.mapping, {
--     ["<CR>"] = cmp.config.disable,
--     ["<Tab>"] = cmp.mapping.confirm({ select = true }),
--     ["<Ctr-n>"] = cmp.mapping(function(fallback)
--       if cmp.visible() then
--         cmp.select_next_item()
--         -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
--         -- this way you will only jump inside the snippet region
--       elseif luasnip.expand_or_jumpable() then
--         luasnip.expand_or_jump()
--       elseif has_words_before() then
--         cmp.complete()
--       else
--         fallback()
--       end
--     end, { "i", "s" }),
--     ["<Ctr-p>"] = cmp.mapping(function(fallback)
--       if cmp.visible() then
--         cmp.select_prev_item()
--       elseif luasnip.jumpable(-1) then
--         luasnip.jump(-1)
--       else
--         fallback()
--       end
--     end, { "i", "s" }),
--   })
-- end,
