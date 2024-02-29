#!/bin/bash

function run_packer_install {
	/opt/nvim-linux64/bin/nvim --headless -c "Lazy! sync" -c 'q'
}

run_packer_install

# Create the .local/state directory if it doesn't exist, needed for persistence
mkdir -p ~/.local/state
