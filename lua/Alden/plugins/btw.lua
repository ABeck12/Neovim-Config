return {
    "letieu/btw.nvim",
    config = function()
        require('btw').setup()
    end,

    open = function()
        require("btw").open()
    end
}
