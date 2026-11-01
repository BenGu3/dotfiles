return {
  'akinsho/bufferline.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('bufferline').setup {
      options = {
        offsets = {
          {
            filetype = 'snacks_layout_box',
            text = '󰙅 File Explorer',
            separator = true,
          },
        },
      },
    }
  end,
}
