
lua << EOF
require("mongo-nvim").setup(
    {
        list_document_key = {
            seervision = {
                settings = "setting",
                ptu_configs = "name",
                ptu_drivers = "ptu_driver_type",
                lens_mappings = function(document)
                    return document.camera_name .. "/" .. document.lens_name
                end,
                ptus = "label",
                analytics = "name"
            }
        },
        connection_string = "mongodb://10.99.5.10:27017"
    }
)
EOF

"nnoremap <leader>dbl <cmd>lua require('mongo-nvim.telescope.pickers').document_picker('seervision', 'settings')<cr>
nnoremap <leader>dbl <cmd>lua require('mongo-nvim.telescope.pickers').collection_picker('seervision')<cr>

