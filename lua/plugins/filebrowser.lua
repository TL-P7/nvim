return {
  {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
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
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      local api = require("nvim-tree.api")

      local function my_on_attach(bufnr)
        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        ---- default mappings dia
        --api.config.mappings.default_on_attach(bufnr)

        ---- custom mappings
        vim.keymap.set("n", "<CR>", api.tree.change_root_to_node, opts("CD"))
        vim.keymap.set("n", "<C-e>", "<Nop>", opts("Disable Open: In Place"))
        vim.keymap.set("n", "ii", api.node.show_info_popup, opts("Info"))
        vim.keymap.set("n", "<C-t>", "<Nop>", opts("Disable Open: New Tab"))
        vim.keymap.set("n", "<C-h>", api.node.open.horizontal, opts("Open: Horizontal Split"))
        vim.keymap.set("n", "<C-v>", api.node.open.vertical, opts("Open: Vertical Split"))
        vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
        vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
        vim.keymap.set("n", ">", "<Nop>", opts("Disable Next Sibling"))
        vim.keymap.set("n", "<", "<Nop>", opts("Disable Previous Sibling"))
        vim.keymap.set("n", ".", api.node.run.cmd, opts("Run Command"))
        vim.keymap.set("n", "ip", api.node.open.preview, opts("Open Preview"))
        vim.keymap.set("n", "<BS>", api.tree.change_root_to_parent, opts("Up"))
        vim.keymap.set("n", "a", api.fs.create, opts("Create File Or Directory"))
        vim.keymap.set("n", "bc", api.marks.clear, opts("Clear all marks"))
        vim.keymap.set("n", "bd", api.marks.bulk.delete, opts("Delete Bookmarked"))
        vim.keymap.set("n", "bt", api.marks.bulk.trash, opts("Trash Bookmarked"))
        vim.keymap.set("n", "bmv", api.marks.bulk.move, opts("Move Bookmarked"))
        vim.keymap.set("n", "yy", api.fs.copy.node, opts("Copy"))
        vim.keymap.set("n", "B", api.tree.toggle_no_buffer_filter, opts("Toggle Filter: No Buffer"))
        vim.keymap.set("n", "C", api.tree.toggle_git_clean_filter, opts("Toggle Filter: Git Clean"))
        vim.keymap.set("n", "[c", api.node.navigate.git.prev, opts("Prev Git"))
        vim.keymap.set("n", "]c", api.node.navigate.git.next, opts("Next Git"))
        vim.keymap.set("n", "dF", api.fs.remove, opts("Delete"))
        vim.keymap.set("n", "df", api.fs.trash, opts("Trash"))
        vim.keymap.set("n", "E", api.tree.expand_all, opts("Expand All"))
        vim.keymap.set("n", "e", api.fs.rename_basename, opts("Rename: Basename"))
        vim.keymap.set("n", "]g", api.node.navigate.diagnostics.next, opts("Next Diagnostic"))
        vim.keymap.set("n", "[g", api.node.navigate.diagnostics.prev, opts("Prev Diagnostic"))
        vim.keymap.set("n", "Fc", api.live_filter.clear, opts("Live Filter: Clear"))
        vim.keymap.set("n", "F", api.live_filter.start, opts("Live Filter: Start"))
        vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
        vim.keymap.set("n", "yap", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
        vim.keymap.set("n", "zh", api.tree.toggle_hidden_filter, opts("Toggle Filter: Dotfiles"))
        vim.keymap.set("n", "I", api.tree.toggle_gitignore_filter, opts("Toggle Filter: Git Ignore"))
        vim.keymap.set("n", "b", api.node.navigate.sibling.last, opts("Last Sibling"))
        vim.keymap.set("n", "t", api.node.navigate.sibling.first, opts("First Sibling"))
        vim.keymap.set("n", "M", api.tree.toggle_no_bookmark_filter, opts("Toggle Filter: No Bookmark"))
        vim.keymap.set("n", "m", api.marks.toggle, opts("Toggle Bookmark"))
        vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
        vim.keymap.set("n", "O", api.node.open.no_window_picker, opts("Open: No Window Picker"))
        vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))
        vim.keymap.set("n", "P", api.node.navigate.parent, opts("Parent Directory"))
        vim.keymap.set("n", "q", api.tree.close, opts("Close"))
        vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
        vim.keymap.set("n", "R", api.tree.reload, opts("Refresh"))
        vim.keymap.set("n", "s", api.node.run.system, opts("Run System"))
        vim.keymap.set("n", "u", api.fs.rename_full, opts("Rename: Full Path"))
        vim.keymap.set("n", "U", api.tree.toggle_custom_filter, opts("Toggle Filter: Hidden"))
        vim.keymap.set("n", "W", api.tree.collapse_all, opts("Collapse"))
        vim.keymap.set("n", "dd", api.fs.cut, opts("Cut"))
        vim.keymap.set("n", "yn", api.fs.copy.filename, opts("Copy Name"))
        vim.keymap.set("n", "yrp", api.fs.copy.relative_path, opts("Copy Relative Path"))
        vim.keymap.set("n", "f", api.tree.search_node, opts("Search"))
        vim.keymap.set("n", "<2-LeftMouse>", api.node.open.edit, opts("Open"))
        vim.keymap.set("n", "<2-RightMouse>", api.tree.change_root_to_node, opts("CD"))
        local function toggle_mark_and_move_down()
          api.marks.toggle()
          --api.node.navigate.sibling.next()
          vim.cmd([[norm j]])
        end
        local function toggle_mark_and_move_up()
          api.marks.toggle()
          --api.node.navigate.sibling.prev()
          vim.cmd([[norm k]])
        end
        vim.keymap.set("n", "J", toggle_mark_and_move_down, opts("Toggle Bookmark and Move Down"))
        vim.keymap.set("n", "K", toggle_mark_and_move_up, opts("Toggle Bookmark and Move Up"))
      end
      require("nvim-tree").setup({
        on_attach = my_on_attach,
        update_focused_file = {
          enable = false,
          update_root = false,
          ignore_list = {},
        },
      })
    end
  },
}
