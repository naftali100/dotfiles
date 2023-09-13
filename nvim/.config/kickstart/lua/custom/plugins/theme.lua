return {
  -- {
  --   'catppuccin/nvim',
  --   name = 'catppuccin',
  --   config = function()
  --     vim.cmd.colorscheme 'catppuccin'
  --   end
  -- },
  -- {
  --   'folke/tokyonight.nvim',
  --   priority = 1000,
  --   opts = {
  --     style = 'storm', -- mood, night, storm
  --   },
  --   config = function()
  --     vim.cmd.colorscheme 'tokyonight'
  --   end,
  -- },
  -- {
  --   'navarasu/onedark.nvim',
  --   config = function()
  --     vim.cmd.colorscheme 'onedark'
  --   end,
  -- },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      print('rose-pine')
      require('rose-pine').setup()
      vim.cmd.colorscheme 'rose-pine'
    end
  }
}
