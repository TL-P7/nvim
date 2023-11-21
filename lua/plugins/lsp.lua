return {
  {
    'neoclide/coc.nvim',
    config = function ()
      --updatetime
      vim.opt.updatetime = 100
      --todo,coc-exlorer
      vim.cmd([[
      let g:coc_explorer_global_presets = {
      \'nvim': {
      \'root-uri': '~/.config/nvim',
      \'width': 30,
      \},
      \'code': {
      \'root-uri': '~/Documents/code',
      \'width': 30,
      \},
      \'cocconfig': {
      \'root-uri': '~/.config/coc',
      \'width': 30,
      \},
      \'tab': {
      \'position': 'tab',
      \'quit-on-open': v:true,
      \},
      \'tab:$': {
      \'position': 'tab:$',
      \'quit-on-open': v:true,
      \},
      \'floating': {
      \'position': 'floating',
      \'open-action-strategy': 'sourcewindow',
      \},
      \'floatingtop': {
      \'position': 'floating',
      \'floating-position': 'center-top',
      \'open-action-strategy': 'sourcewindow',
      \},
      \'floatingleftside': {
      \'position': 'floating',
      \'floating-position': 'left-center',
      \'floating-width': 50,
      \'open-action-strategy': 'sourcewindow',
      \},
      \'floatingrightside': {
      \'position': 'floating',
      \'floating-position': 'right-center',
      \'floating-width': 50,
      \'open-action-strategy': 'sourcewindow',
      \},
      \'simplify': {
      \'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitcenter 1]'
      \},
      \'buffer': {
      \'sources': [{'name': 'buffer', 'expand': v:true}]
      \},
      \}
      ]])
    end
  },
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    priority = 1000,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "c",
          "cpp",
          "bash",
          "go",
          "lua",
          "vim",
        },
        highlight = {
          enable = true,
          disable = {}, -- list of language that will be disabled
        },
        indent = {
          enable = true
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection    = "<CR>",
            node_incremental  = "<CR>",
            node_decremental  = "<BS>",
            scope_incremental = "<TAB>",
          },
        }
      })
    end
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = {
          enabled = true,
          auto_refresh = false,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>"
          },
          layout = {
            position = "bottom", -- | top | left | right
            ratio = 0.4
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<M-l>",
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        filetypes = {
          c = true,
          yaml = false,
          markdown = false,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },
        copilot_node_command = 'node', -- Node.js version must be > 18.x
        server_opts_overrides = {},
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    enable = false,
  }
}
