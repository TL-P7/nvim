vim.cmd([[
"CompetiTest
:lua require('competitest').setup()
nmap <F9> :CompetiTest run<CR>
nmap ]a :CompetiTest add_testcase<CR>
nmap ]e :CompetiTest edit_testcase<CR>
nmap [e :CompetiTest edit_testcase
nmap ]r :CompetiTest receive testcases<CR>
nmap ]s :CompetiTest show_ui<CR>
nmap ]d :CompetiTest delete_testcase<CR>
nmap [d :CompetiTest delete_testcase
]])
