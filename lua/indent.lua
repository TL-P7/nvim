--setting for indent
vim.o.smartindent = true
vim.o.autoindent = true

local filetype = vim.bo.filetype

if filetype == 'c' or filetype == 'cpp' then
  vim.o.cindent = true
  vim.o.tabstop = 4
  vim.o.softtabstop = 4
  vim.o.shiftwidth = 4
else if filetype == 'go' or filetype == 'py' or filetype == 'lua' or filetype == 'vim' then
  vim.o.tabstop = 2
  vim.o.softtabstop = 2
  vim.o.shiftwidth = 2
else
  vim.o.tabstop = 4
  vim.o.softtabstop = 4
  vim.o.shiftwidth = 4
end
end

vim.o.list = true
vim.opt.listchars = {tab = '->', trail = '-'}
vim.o.scrolloff = 5
vim.opt.backspace = {"indent", "eol", "start"}
vim.o.foldmethod = "indent"
vim.o.foldlevel = 99
vim.o.laststatus = 2
