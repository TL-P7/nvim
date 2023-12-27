return {
  {
    --dashboard
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
      local logo = [[
       █████╗  ██████╗███╗   ███╗
      ██╔══██╗██╔════╝████╗ ████║
      ███████║██║     ██╔████╔██║
      ██╔══██║██║     ██║╚██╔╝██║
      ██║  ██║╚██████╗██║ ╚═╝ ██║
      ╚═╝  ╚═╝ ╚═════╝╚═╝     ╚═╝
      ]]
      logo = "\n\n" .. logo .. "\n"
      require("dashboard").setup {
        theme = "hyper",
        config = {
          header = vim.split(logo, "\n"),
          week_header = {
            enable = false,
          },
          shortcut = {
            { desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
            {
              icon = " ",
              icon_hl = "@variable",
              desc = "Files",
              group = "Label",
              action = "Telescope find_files",
              key = "f",
            },
            {
              desc = " Apps",
              group = "DiagnosticHint",
              action = "Telescope app",
              key = "a",
            },
            {
              desc = " dotfiles",
              group = "Number",
              action = "Telescope dotfiles",
              key = "d",
            },
          },
          footer = { "TODO: nvim-dap" },
        },
      }
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } }
  },
  --lualine
  {
    "nvim-lualine/lualine.nvim",
    event = "BufEnter",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("lualine").setup {
        options = {
          theme = "tokyonight"
        },
      }
    end
  },
  --bufferline
  {
    "akinsho/bufferline.nvim",
    event = "BufEnter",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons", "moll/vim-bbye" },
    config = function()
      require("bufferline").setup {
        options = {
          theme = "tokyonight",
          --mode = "tabs",
          diagnostics = "nvim-lsp",
          offsets = {
            {
              --TODO
              filetype = "coc-explorer",
              text = "File Explorer",
              highlight = "Directory",
              text_align = "left"
            },
            show_buffer_close_icons = true,
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
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    config = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
      },
    },
    opts = {
      cmdline = {
      }
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  }
}
