return {
  "folke/tokyonight.nvim",
  style = 'moon',
  light_style = 'day',
  lazy = false,
  priority = 1000,
  config = function ()
      vim.cmd('colorscheme tokyonight-moon')
  end,
}
