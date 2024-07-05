return {
    'nvimdev/dashboard-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'VimEnter',
    config = function()
        require('dashboard').setup {
            config = {
                center = {
                  {
                    icon = '',
                    icon_hl = 'group',
                    desc = 'description',
                    desc_hl = 'group',
                    key = 'shortcut key in dashboard buffer not keymap !!',
                    key_hl = 'group',
                    key_format = ' [%s]', -- `%s` will be substituted with value of `key`
                    action = '',
                  },
                },
                footer = {},
              }
        }
    end,
}
