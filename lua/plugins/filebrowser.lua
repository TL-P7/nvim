return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          -- Default configuration for telescope goes here:
          -- config_key = value,
          mappings = {
            i = {
              -- map actions.which_key to <C-h> (default: <C-/>)
              -- actions.which_key shows the mappings for your picker,
              -- e.g. git_{create, delete, ...}_branch for the git_branches picker
              ["<C-j>"] = "move_selection_next",
              ["<C-k>"] = "move_selection_previous",
              ["<C-n>"] = false,
              ["<C-p>"] = false,
              ["<C-h>"] = "select_horizontal",
            }
          }
        },
        pickers = {
          -- Default configuration for builtin pickers goes here:
          -- picker_name = {
          --   picker_config_key = value,
          --   ...
          -- }
          -- Now the picker_config_key will be applied every time you call this
          -- builtin picker
        },
        extensions = {
          -- Your extension configuration goes here:
          -- extension_name = {
          --   extension_config_key = value,
          -- }
          -- please take a look at the readme of the extension you want to configure
        }
      })
    end,
  },
  {
    --coc-explorer
    'neoclide/coc.nvim',
    config = function()
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
    "nvim-tree/nvim-tree.lua",
    enabled = false,
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-tree").setup({

      })
    end,
  },
}
