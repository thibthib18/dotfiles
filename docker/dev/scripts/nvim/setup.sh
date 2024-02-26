#!/bin/bash

function run_packer_install {
	/opt/nvim-linux64/bin/nvim --headless -c "Lazy! sync" -c 'q'
}

run_packer_install
