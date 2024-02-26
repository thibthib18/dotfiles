
vim.cmd([[
let test#strategy = 'neovim'
let test#python#runner = 'pyunit'
let test#python#pyunit#executable = 'python3 -m unittest'

nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>
]])
