--settings for buliding new tabes and splits
vim.keymap.set('n', '<C-m>', ':tabe<CR>')
vim.keymap.set('n', '<C-h>', ':-tabnext<CR>')
vim.keymap.set('n', '<C-l>', ':+tabnext<CR>')
vim.keymap.set('n', 'sr', ':set splitright<CR>:vsplit<CR>')
vim.keymap.set('n', 'sl', ':set nosplitright<CR>:vsplit<CR>')
vim.keymap.set('n', 'su', ':set nosplitbelow<CR>:split<CR>')
vim.keymap.set('n', 'sd', ':set splitbelow<CR>:split<CR>')
vim.keymap.set('', '<up>', ':res +5<CR>')
vim.keymap.set('', '<down>', ':res -5<CR>')
vim.keymap.set('', '<left>', ':vertical resize -5<CR>')
vim.keymap.set('', '<right>', ':vertical resize +5<CR>')

