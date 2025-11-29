local utils = require("Alden.utils")
local log = require("Alden.log")

return {
    "letieu/btw.nvim",
    config = function()
        require('btw').setup()

        vim.api.nvim_create_autocmd("BufDelete", {
            callback = function(event)
                local num_nonempty_buf = utils.check_number_real_buffers()

                -- If no real buffers are left, show Startup
                if num_nonempty_buf == 0 and utils.path_type(event.file) == "file" then
                    -- Use Schedule so Startup doesn't close itself immediately
                    vim.schedule(function()
                        require("btw").open()
                    end)
                end
            end,
        })
    end,
}
