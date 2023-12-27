vim.g.mapleader = " "
local silent = { noremap = true, silent = true }
local builtin = require("telescope.builtin")
local dap = require("dap")
local mappings = {
  --settings for copy and paste
  { mode = "n",          from = "<C-e>",      to = "<Esc>ggVG" },
  { mode = "v",          from = "<C-y>",      to = '"+y' },
  { mode = "i",          from = "<C-p>",      to = '<Esc>"*pa' },
  { mode = "v",          from = "<C-p>",      to = '<Esc>"*p' },
  { mode = "n",          from = "<C-p>",      to = '"*p' },

  --nohl
  { mode = "n",          from = "<Esc>u",     to = ":nohlsearch<CR>",                                          opt = silent },

  --save file
  { mode = { "n", "v" }, from = "s",          to = "<Nop>" },
  { mode = "n",          from = "<C-s>",      to = ":w<CR>",                                                   opt = silent },

  --fast source
  { mode = "n",          from = "zc",         to = ":source ~/.config/nvim/init.lua<CR>",                      opt = silent },
  { mode = "n",          from = "zz",         to = ":e ~/.config/nvim/init.lua<CR>",                           opt = silent },

  --settings for buliding new tabes and splits
  { mode = "n",          from = "<C-m>",      to = ":tabe<CR>",                                                opt = silent },
  { mode = "n",          from = "<C-h>",      to = ":BufferLineCyclePrev<CR>",                                 opt = silent },
  { mode = "n",          from = "<C-l>",      to = ":BufferLineCycleNext<CR>",                                 opt = silent },
  { mode = "n",          from = "<C-q>",      to = ":Bdelete<CR>",                                             opt = silent },
  { mode = "n",          from = "<leader>q",  to = ":Bdelete<CR>:q<CR>",                                       opt = silent },
  { mode = "n",          from = "<M-q>",      to = ":q<CR>",                                                   opt = silent },
  { mode = "n",          from = "sr",         to = ":set splitright<CR>:vsplit<CR>",                           opt = silent },
  { mode = "n",          from = "sl",         to = ":set nosplitright<CR>:vsplit<CR>",                         opt = silent },
  { mode = "n",          from = "su",         to = ":set nosplitbelow<CR>:split<CR>",                          opt = silent },
  { mode = "n",          from = "sd",         to = ":set splitbelow<CR>:split<CR>",                            opt = silent },

  --resize splits
  { mode = "",           from = "<up>",       to = ":res +2<CR>",                                              opt = silent },
  { mode = "",           from = "<down>",     to = ":res -2<CR>",                                              opt = silent },
  { mode = "",           from = "<left>",     to = ":vertical resize -2<CR>",                                  opt = silent },
  { mode = "",           from = "<right>",    to = ":vertical resize +2<CR>",                                  opt = silent },

  --coc-explorer
  { mode = "n",          from = "<leader>mt", to = "<Cmd>CocCommand explorer --preset simplify --width 30<CR>" },
  { mode = "n",          from = "<leader>mf", to = "<Cmd>CocCommand explorer --preset floating <CR>" },
  { mode = "n",          from = "<leader>mb", to = "<Cmd>CocCommand explorer --preset buffer <CR>" },
  { mode = "n",          from = "<leader>ml", to = "<Cmd>CocList explPresets<CR>" },

  --CompetiTest
  { mode = "n",          from = "<F9>",       to = ":CompetiTest run<CR>" },
  { mode = "n",          from = "]a",         to = ":CompetiTest add_testcase<CR>" },
  { mode = "n",          from = "]e",         to = ":CompetiTest edit_testcase<CR>" },
  { mode = "n",          from = "[e",         to = ":CompetiTest edit_testcase" },
  { mode = "n",          from = "]r",         to = ":CompetiTest receive testcases<CR>" },
  { mode = "n",          from = "]s",         to = ":CompetiTest show_ui<CR>" },
  { mode = "n",          from = "]d",         to = ":CompetiTest delete_testcase<CR>" },
  { mode = "n",          from = "[d",         to = ":CompetiTest delete_testcase" },

  --Dashboard
  { mode = "n",          from = "<leader>b",  to = "<Cmd>Dashboard<CR>" },

  --telescope
  { mode = "n",          from = "<leader>ff", to = builtin.find_files },
  { mode = "n",          from = "<leader>fc", to = builtin.current_buffer_fuzzy_find },
  {mode = "n", from = "<leader>fg", to = builtin.live_grep},
  { mode = "n",          from = "<leader>gs", to = builtin.git_status },
  { mode = "n",          from = "<leader>fb", to = builtin.buffers },
  { mode = "n",          from = "<leader>fh", to = builtin.help_tags },
  { mode = "n",          from = "<leader>fk", to = builtin.keymaps },
  { mode = "n",          from = "<leader>ss", to = builtin.spell_suggest },

  --nvim-dap
  { mode = "n",          from = "<F5>",       to = function() dap.continue() end },
  { mode = "n",          from = "<F6>",       to = function() dap.step_over() end },
  { mode = "n",          from = "<S-F6>",     to = function() dap.step_into() end },
  { mode = "n",          from = "<F7>",       to = function() dap.step_out() end },
  { mode = "n",          from = "<Leader>db", to = function() dap.toggle_breakpoint() end },
  { mode = "n",          from = "<Leader>dr", to = function() dap.repl.opn() end },
  { mode = "n",          from = "<Leader>dl", to = function() dap.run_last() end },
  {
    mode = { "n", "v" },
    from = "<Leader>dh",
    to = function()
      require("dap.ui.widgets").hover()
    end
  },
  {
    mode = { "n", "v" },
    from = "<Leader>dp",
    to = function()
      require("dap.ui.widgets").preview()
    end
  },
  {
    mode = "n",
    from = "<Leader>df",
    to = function()
      local widgets = require("dap.ui.widgets")
      widgets.centered_float(widgets.frames)
    end
  },
  {
    mode = "n",
    from = "<Leader>ds",
    to = function()
      local widgets = require("dap.ui.widgets")
      widgets.centered_float(widgets.scopes)
    end
  },
}


for _, mapping in ipairs(mappings) do
  vim.keymap.set(mapping.mode or "n", mapping.from, mapping.to, mapping.opt or { noremap = true })
end
