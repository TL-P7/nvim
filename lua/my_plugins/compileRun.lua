--Compile function
local split = function ()
  vim.cmd([[
  set splitbelow
  sp
  res -5
  ]])
end
local compileRun = function()
  local ft = vim.bo.filetype
  vim.cmd([[
    w
    ]])
  if ft == "cpp" then
    split()
    vim.cmd("term g++ -std=c++2a % -o %< && time ./%<")
  elseif ft == "c" then
    split()
    if vim.fn.filereadable("Makefile") == 1 then
      vim.cmd("term make && ./main")
    else
      vim.cmd("term gcc -std=c99 % -o %< && time ./%<")
    end
  elseif ft == "py" then
    split()
    vim.cmd("!python3 %")
  elseif ft == "sh" then
    split()
    vim.cmd("!time bash %")
  elseif ft == "markdown" then
    vim.cmd("MarkdownPreview")
  elseif ft == "lua" then
    split()
    vim.cmd("term lua %")
  end
end

vim.keymap.set("n", "<F11>", compileRun, { silent = true, noremap = true })
