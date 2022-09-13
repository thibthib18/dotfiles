
function! LspCompletionOnAttach()
  try
     lua require'completion'.on_attach()
  catch
    echo "Completion package missing"
  endtry
endfunction
" autocmd BufEnter *.lua :call LspCompletionOnAttach()

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

