return {
  "folke/tokyonight.nvim",
  lazy = false,
  opts = { style = 'moon'},
  config = function ()
    vim.cmd[[colorscheme tokyonight-moon]]
  end,
}
