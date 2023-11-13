return {
  {
    --dashboard
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      local logo = [[
       █████╗  ██████╗███╗   ███╗
      ██╔══██╗██╔════╝████╗ ████║
      ███████║██║     ██╔████╔██║
      ██╔══██║██║     ██║╚██╔╝██║
      ██║  ██║╚██████╗██║ ╚═╝ ██║
      ╚═╝  ╚═╝ ╚═════╝╚═╝     ╚═╝
      ]]
      logo = '\n\n' .. logo .. '\n'
      require('dashboard').setup {
        theme = 'hyper',
        config = {
          header = vim.split(logo, '\n'),
          week_header = {
            enable = false,
          },
          shortcut = {
            { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
            {
              icon = ' ',
              icon_hl = '@variable',
              desc = 'Files',
              group = 'Label',
              action = 'Telescope find_files',
              key = 'f',
            },
            {
              desc = ' Apps',
              group = 'DiagnosticHint',
              action = 'Telescope app',
              key = 'a',
            },
            {
              desc = ' dotfiles',
              group = 'Number',
              action = 'Telescope dotfiles',
              key = 'd',
            },
          },
          footer = {'TODO: coc-cofig, autopairs'},
        },
      }
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },
  --lualine
  {
    'nvim-lualine/lualine.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function ()
      require('lualine').setup {
        options = {
          theme = 'tokyonight'
        }
      }
    end
  },
  --bufferline
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = {'nvim-tree/nvim-web-devicons', 'moll/vim-bbye'},
    config = function ()
      require('bufferline').setup {
        options = {
          theme = 'tokyonight',
          --mode = 'tabs',
          diagnostics = 'coc',
          offsets = {
            {
              --TODO
              filetype = "coc-explorer",
              text = "File Explorer",
              highlight = "Directory",
              text_align = "left"
            },
            show_buffer_close_icons = false,
            show_close_icon = false,
            enforce_regular_tabs = true,
            tab_size = 16,
            padding = 0,
            separator_style = "thick",
          }
        }
      }
    end,
  },
}
