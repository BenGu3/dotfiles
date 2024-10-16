return {
  'sudormrfbin/cheatsheet.nvim',
  version = '*',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require('cheatsheet').setup {}
  end,
}
