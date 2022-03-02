local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP =
        fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

CONFIG_PATH = "~/.config/nvim/thib/plugins/"

return require("packer").startup(
    function(use)
        -- Packer can manage itself
        use "wbthomason/packer.nvim"
        -- Refactoring
        use "ThePrimeagen/refactoring.nvim"

        use "fannheyward/telescope-coc.nvim"
        -- Debug
        use "mfussenegger/nvim-dap"
        use "jbyuki/one-small-step-for-vimkind"
        use "rcarriga/nvim-dap-ui"
        use "theHamsta/nvim-dap-virtual-text"
        use "sindrets/diffview.nvim"

        -- Ros
        use "thibthib18/vim-ros"
        use {
            "thibthib18/ros-nvim",
            config = function()
                vim.cmd("source" .. CONFIG_PATH .. "ros.vim")
            end
        }

        -- Mongo
        use {
            "thibthib18/mongo-nvim",
            config = function()
                vim.cmd("source" .. CONFIG_PATH .. "mongo.vim")
            end
        }

        use "xiyaowong/telescope-emoji.nvim"
        use "LinArcX/telescope-env.nvim"
        -- Formatting
        use "lukas-reineke/format.nvim"

        use "michaeljsmith/vim-indent-object"

        use "junegunn/vim-peekaboo"

        use {
            "vim-test/vim-test",
            config = function()
                vim.cmd("source" .. CONFIG_PATH .. "vimtest.vim")
            end
        }

        require("packer").startup(
            function()
                use "lukas-reineke/indent-blankline.nvim"
            end
        )
        -- Pretty notifications
        use "rcarriga/nvim-notify"

        use "nvim-telescope/telescope-fzy-native.nvim"

        -- Gitlab
        use "thibthib18/octo.nvim"

        -- vim UI libs, might use later
        use "skywind3000/vim-quickui"

        -- Terminal utils wrapper
        use "kassio/neoterm"

        -- Builtin LSP config helpers
        use "neovim/nvim-lspconfig"
        use {
            "nvim-lua/completion-nvim",
            config = function()
                vim.cmd("source" .. CONFIG_PATH .. "completion.vim")
            end
        }
        use "kabouzeid/nvim-lspinstall"

        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSInstall lua cpp python typescript css bash dockerfile graphql tsx"
        }
        use "nvim-treesitter/nvim-treesitter-textobjects"
        use "nvim-treesitter/playground"

        -- Lua dev
        use "euclidianAce/BetterLua.vim"
        use "tjdevries/manillua.nvim"
        use "~/dotfiles/config/nvim/plugins/nvim-whid"

        -- Git interface
        use {
            "tpope/vim-fugitive",
            config = function()
                vim.cmd("source" .. CONFIG_PATH .. "fugitive.vim")
            end
        }

        use "tpope/vim-surround"

        use "tpope/vim-repeat"

        use "tpope/vim-commentary"

        -- LSP plugin
        use {
            "neoclide/coc.nvim",
            branch = "release",
            run = ":CocInstall -sync coc-sumneko-lua coc-json coc-eslint coc-json coc-marketplace coc-pairs coc-jedi coc-pyright coc-css coc-git coc-prettier coc-snippets coc-tsserver coc-clangd",
            config = function()
                vim.cmd("source" .. CONFIG_PATH .. "coc.vim")
            end
        }

        -- Seamless navigation between vim buffers and tmux panes (must have with Tmux)
        use "christoomey/vim-tmux-navigator"

        -- Fast search keywords
        use "mileszs/ack.vim"

        -- Different colors for intricated [[(({}))]]
        use "luochen1990/rainbow"

        -- Hard to use for now, will check it out later --> lets try the cousin plugin
        use "machakann/vim-sandwich"

        -- camel/snake_case conversions (crs and crc), and more features I should try
        use {
            "tpope/vim-abolish",
            config = function()
                vim.cmd("source" .. CONFIG_PATH .. "abolish.vim")
            end
        }

        -- Nice colorscheme
        use {
            "sainnhe/sonokai",
            config = function()
                vim.cmd("colorscheme sonokai")
            end
        }
        use "morhetz/gruvbox"
        use {
            "sonph/onehalf",
            rtp = "vim",
            config = function()
                --vim.cmd("colorscheme onehalfdark")
            end
        }
        use "chriskempson/base16-vim"
        use "shaunsingh/moonlight.nvim"
        use "shaunsingh/nord.nvim"

        -- camel/snake_case motions
        use "bkad/CamelCaseMotion"

        -- Maximize windows
        use "szw/vim-maximizer"

        -- cheat.sh
        use "dbeniamine/cheat.sh-vim"
        -- Use :HowIn

        -- Telescope
        use "nvim-lua/popup.nvim"
        use "nvim-lua/plenary.nvim"
        use {
            "nvim-telescope/telescope.nvim",
            config = function()
                vim.cmd("source" .. CONFIG_PATH .. "telescope.vim")
            end
        }
        use "nvim-telescope/telescope-symbols.nvim"
        use "nvim-telescope/telescope-dap.nvim"

        -- for nice icons <- require a nerd font installed (on your machine)
        use "kyazdani42/nvim-web-devicons"

        -- File explorer
        use {
            "kyazdani42/nvim-tree.lua",
            config = function()
                vim.cmd("source " .. CONFIG_PATH .. "nvim-tree.vim")
            end
        }

        -- top buffer line
        use {
            "akinsho/nvim-bufferline.lua",
            config = function()
                vim.cmd("source " .. CONFIG_PATH .. "bufferline.vim")
            end
        }
        -- Status line
        use {
            "glepnir/galaxyline.nvim",
            branch = "main",
            config = function()
                require("galaxylinePlugin")
            end
        }

        -- Nice search highlight
        use {
            "kevinhwang91/nvim-hlslens",
            config = function()
                vim.cmd("source " .. CONFIG_PATH .. "nvim-hlslens.vim")
            end
        }

        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
        if packer_bootstrap then
            require("packer").sync()
        end
    end
)
