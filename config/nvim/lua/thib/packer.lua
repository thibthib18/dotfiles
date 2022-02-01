-- Bootstrap packer (install if not installed)
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap =
        fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
end

return require("packer").startup(
    function(use)
        -- Packer can manage itself
        use "wbthomason/packer.nvim"
        -- Refactoring
        use "ThePrimeagen/refactoring.nvim"

        -- Debug
        use "mfussenegger/nvim-dap"
        use "jbyuki/one-small-step-for-vimkind"
        use "rcarriga/nvim-dap-ui"
        use "theHamsta/nvim-dap-virtual-text"
        use "sindrets/diffview.nvim"

        use "thibthib18/ros-nvim"
        use "thibthib18/mongo-nvim"

        use "xiyaowong/telescope-emoji.nvim"
        use "LinArcX/telescope-env.nvim"
        -- Formatting
        use "lukas-reineke/format.nvim"

        use "michaeljsmith/vim-indent-object"

        use "junegunn/vim-peekaboo"

        use "vim-test/vim-test"

        -- Pretty notifications
        use "rcarriga/nvim-notify"

        use "nvim-telescope/telescope-fzy-native.nvim"
        -- Ros
        use "thibthib18/vim-ros"

        -- Gitlab
        use "thibthib18/octo.nvim"

        -- vim UI libs, might use later
        use "skywind3000/vim-quickui"

        -- Terminal utils wrapper
        use "kassio/neoterm"

        -- Builtin LSP config helpers
        use "neovim/nvim-lspconfig"
        use "nvim-lua/completion-nvim"
        use "kabouzeid/nvim-lspinstall"

        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSInstall lua cpp python typescript css bash dockerfile graphql tsx"
        }
        use "nvim-treesitter/nvim-treesitter-textobjects"
        use "nvim-treesitter/playground"

        -- Lua dev
        use "thibthib18/nlua.nvim"
        use "euclidianAce/BetterLua.vim"
        use "tjdevries/manillua.nvim"
        use "~/dotfiles/config/nvim/plugins/nvim-whid"

        -- Git interface
        use "tpope/vim-fugitive"

        use "tpope/vim-surround"

        use "tpope/vim-repeat"

        use "tpope/vim-commentary"

        -- LSP plugin
        use {
            "neoclide/coc.nvim",
            branch = "release",
            run = ":CocInstall coc-json coc-eslint coc-json coc-marketplace coc-pairs coc-jedi coc-pyright coc-css coc-git coc-prettier coc-snippets coc-tsserver coc-clang"
        }

        -- Fuzzy file finder
        use {"junegunn/fzf", run = "-> fzf#install()"}
        use "junegunn/fzf.vim"

        -- Seamless navigation between vim buffers and tmux panes (must have with Tmux)
        use "christoomey/vim-tmux-navigator"

        -- Fast search keywords
        use "mileszs/ack.vim"

        -- Different colors for intricated [[(({}))]]
        use "luochen1990/rainbow"

        -- Hard to use for now, will check it out later --> lets try the cousin plugin
        use "machakann/vim-sandwich"

        -- camel/snake_case conversions (crs and crc), and more features I should try
        use "tpope/vim-abolish"

        -- Nice colorscheme
        use "morhetz/gruvbox"
        use {"sonph/onehalf", rtp = "vim"}
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
        use "nvim-telescope/telescope.nvim"
        use "nvim-telescope/telescope-symbols.nvim"
        use "nvim-telescope/telescope-dap.nvim"

        -- for nice icons <- require a nerd font installed (on your machine)
        use "kyazdani42/nvim-web-devicons"

        -- File explorer
        use "kyazdani42/nvim-tree.lua"

        -- top buffer line
        use "akinsho/nvim-bufferline.lua"
        -- Status line
        use {"glepnir/galaxyline.nvim", branch = "main"}

        -- Nice search highlight
        use "kevinhwang91/nvim-hlslens"

        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
        if packer_bootstrap then
            require("packer").sync()
        end
    end
)
