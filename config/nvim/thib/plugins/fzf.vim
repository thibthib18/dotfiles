
" Ignore the third_party directory when searching files
nnoremap <C-p> :GFiles<CR>
if executable('ag')
  let g:ackprg = 'ag --vimgrep --ignore-dir={~/main/tools/third_party}'
endif
" :Ag search only files content
" --nogroup --column --color  --
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)
nnoremap <C-f> :Ag<CR>
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

