
lua << EOF
require("mongo-nvim").setup(
    {
        list_document_key = "setting"
    }
)
EOF

nnoremap <leader>dbl <cmd>lua require('mongo-nvim.telescope.pickers').document_picker('seervision', 'settings')<cr>

