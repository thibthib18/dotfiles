#!/bin/bash

function run_packer_install {
    /opt/nvim-linux64/bin/nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
}
run_packer_install

# For Jedi's python completion: install jedi package
pip3 install -U jedi
