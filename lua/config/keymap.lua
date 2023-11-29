vim.g.mapleader = ' '
local silent= {noremap = true, silent = true}
local mappings = {

  --settings for copy and paste
  { mode = 'n',          from = '<C-e>',           to = '<Esc>ggVG'                                                   },
  { mode = 'v',          from = '<C-y>',           to = '"+y'                                                         },
  { mode = 'i',          from = '<C-p>',           to = '<Esc>"*pa'                                                   },
  { mode = 'v',          from = '<C-p>',           to = '<Esc>"*p'                                                    },
  { mode = 'n',          from = '<C-p>',           to = '"*p'                                                         },

  --nohl
  { mode = 'n',          from = '<Esc>u',          to = ':nohlsearch<CR>',                     opt = silent           },

  --save file
  { mode = {'n', 'v'},   from = 's',               to = '<Nop>'                                                       },
  { mode = 'n',          from = '<C-s>',           to = ':w<CR>',                              opt = silent           },

  --fast source
  { mode = 'n',          from = 'zc',              to = ':source ~/.config/nvim/init.lua<CR>', opt = silent           },
  { mode = 'n',          from = 'zz',              to = ':e ~/.config/nvim/init.lua<CR>',                             },

  --settings for buliding new tabes and splits
  { mode = 'n',          from = '<C-m>',           to = ':tabe<CR>',                                                  },
  { mode = 'n',          from = "<C-h>",           to = ":BufferLineCyclePrev<CR>",            opt = silent           },
  { mode = 'n',          from = "<C-l>",           to = ":BufferLineCycleNext<CR>",            opt = silent           },
  { mode = 'n',          from = "<C-q>",           to = ":Bdelete!<CR>",                       opt = silent           },
  { mode = 'n',          from = "<leader>q",       to = ":Bdelete!<CR>:q<CR>",                 opt = silent           },

}

for _, mapping in ipairs(mappings) do
  vim.keymap.set(mapping.mode or 'n', mapping.from, mapping.to, mapping.opt or {noremap = true})
end



--vim.keymap.set('n', '<C-h>', ':-tabnext<CR>')
--vim.keymap.set('n', '<C-l>', ':+tabnext<CR>')
vim.keymap.set('n', 'sr', ':set splitright<CR>:vsplit<CR>')
vim.keymap.set('n', 'sl', ':set nosplitright<CR>:vsplit<CR>')
vim.keymap.set('n', 'su', ':set nosplitbelow<CR>:split<CR>')
vim.keymap.set('n', 'sd', ':set splitbelow<CR>:split<CR>')
vim.keymap.set('', '<up>', ':res +2<CR>')
vim.keymap.set('', '<down>', ':res -2<CR>')
vim.keymap.set('', '<left>', ':vertical resize -2<CR>')
vim.keymap.set('', '<right>', ':vertical resize +2<CR>')





vim.cmd([[
nnoremap <leader>mt <Cmd>CocCommand explorer --preset simplify --width 30<CR>

" Use preset argument to open it
nnoremap <leader>mf <Cmd>CocCommand explorer --preset floating <CR>
nnoremap <leader>mb <Cmd>CocCommand explorer --preset buffer <CR>

" List all presets
nmap <leader>ml <Cmd>CocList explPresets<CR>

]])

--CompetiTest
vim.cmd([[
  nmap <F9> :CompetiTest run<CR>
  nmap ]a :CompetiTest add_testcase<CR>
  nmap ]e :CompetiTest edit_testcase<CR>
  nmap [e :CompetiTest edit_testcase
  nmap ]r :CompetiTest receive testcases<CR>
  nmap ]s :CompetiTest show_ui<CR>
  nmap ]d :CompetiTest delete_testcase<CR>
  nmap [d :CompetiTest delete_testcase
  ]])

--Dashboard
vim.keymap.set('n', '<leader>d', '<Cmd>Dashboard<CR>')

--indent
vim.keymap.set('n', '<C-f>', '=G')

--telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fk', builtin.keymaps, {})


--rereferred Shift+Enter
vim.keymap.set('i', '<S-CR>', '<CR>')



--LuaSnip
vim.keymap.set({"i"}, "<C-l>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-j>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-k>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})
