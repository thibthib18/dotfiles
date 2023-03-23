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
    autocmd BufWritePost packer.lua source <afile> | PackerInstall
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, _ = pcall(require, "packer")
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

    -- Debug
    use "mfussenegger/nvim-dap"
    use "rcarriga/nvim-dap-ui"
    use "theHamsta/nvim-dap-virtual-text"
    use "jbyuki/one-small-step-for-vimkind" -- Lua adapter

    -- Diffview
    use "sindrets/diffview.nvim"

    -- Github copilot
    use {
      "zbirenbaum/copilot.lua",
      event = "VimEnter",
      config = function()
        vim.schedule(function()
          require("copilot").setup()
        end)
      end,
    }


    use({
      "MunifTanjim/nui.nvim",
      module = { "nui.layout", "nui.popup" },
      module_pattern = { "nui.*" }
    })

    use({
      "jackMort/ChatGPT.nvim",
      config = function()
        require("chatgpt").setup({
          keymaps = {
            submit = "<C-x>"
          }
        })
      end,
      requires = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim"
      }
    })

    use {
      "zbirenbaum/copilot-cmp",
      after = { "copilot.lua" },
      config = function()
        require("copilot_cmp").setup()
      end
    }

    -- Ros
    use "thibthib18/vim-ros"
    use {
      "thibthib18/ros-nvim",
    }

    -- Mongo
    use {
      "thibthib18/mongo-nvim",
    }
    use {
      "tpope/vim-dadbod",
      opt = true,
      requires = {
        "kristijanhusak/vim-dadbod-ui",
        "kristijanhusak/vim-dadbod-completion"
      },
      config = function()
        require("thib.dadbod").setup()
      end,
      cmd = { "DBUIToggle", "DBUI", "DBUIAddConnection", "DBUIFindBuffer", "DBUIRenameBuffer", "DBUILastQueryInfo" }
    }

    use "xiyaowong/telescope-emoji.nvim"
    use "LinArcX/telescope-env.nvim"

    use "michaeljsmith/vim-indent-object"

    -- A bit annoying when using registers in telescope inputs
    -- use "junegunn/vim-peekaboo"

    use {
      "vim-test/vim-test",
      config = function()
        require('thib.vimtest')
      end
    }

    -- Pretty notifications
    use "rcarriga/nvim-notify"

    use "nvim-telescope/telescope-fzy-native.nvim"

    -- Gitlab
    use {
      "thibthib18/glab.nvim",
      requires = { "pwntester/octo.nvim" },
    }

    -- vim UI libs, might use later
    use "skywind3000/vim-quickui"

    -- Builtin LSP config helpers
    use {
      "neovim/nvim-lspconfig",
      config = function()
      end
    }
    use "williamboman/mason-lspconfig.nvim"
    use {
      "williamboman/mason.nvim",
    } -- Package manager
    use 'WhoIsSethDaniel/mason-tool-installer.nvim'

    -- lsp saga
    use {
      "glepnir/lspsaga.nvim",
      config = function()
        require("thib.lsp.lspsaga")
      end
    }

    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }

    -- Completion
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use 'hrsh7th/cmp-calc'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-emoji'
    use "hrsh7th/cmp-cmdline"
    use {
      "hrsh7th/nvim-cmp",
      config = function()
      end
    }

    use { "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require("thib.lsp.null-ls")
      end
    }

    use 'onsails/lspkind.nvim'

    -- Luasnip
    use "L3MON4D3/LuaSnip"

    -- TreeSitter
    use "nvim-treesitter/nvim-treesitter"
    use {
      "nvim-treesitter/nvim-treesitter-textobjects",
      requires = { "nvim-treesitter/nvim-treesitter" }
    }
    use "nvim-treesitter/playground"
    use "nvim-treesitter/nvim-treesitter-context"

    -- Lua dev
    use "euclidianAce/BetterLua.vim"
    use "tjdevries/manillua.nvim"
    --use "~/dotfiles/config/nvim/plugins/nvim-whid"

    -- Git interface
    use "tpope/vim-fugitive"

    use {
      'lewis6991/gitsigns.nvim',
    }

    use "tpope/vim-surround"

    use "tpope/vim-repeat"

    use "tpope/vim-commentary"

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
        require('thib.abolish')
      end
    }

    -- Nice colorscheme
    use "sainnhe/sonokai"
    use 'folke/tokyonight.nvim'

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

    -- REPL
    use { 'hkupty/iron.nvim' }

    -- Tab out of (), needs treesitter
    use {
      "abecodes/tabout.nvim",
      config = function()
        require("tabout").setup {
          tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
          backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
          act_as_tab = true, -- shift content if tab out is not possible
          act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
          default_tab = "<C-t>", -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
          default_shift_tab = "<C-d>", -- reverse shift default action,
          enable_backwards = true, -- well ...
          completion = true, -- if the tabkey is used in a completion pum
          tabouts = {
            { open = "'", close = "'" },
            { open = '"', close = '"' },
            { open = "`", close = "`" },
            { open = "(", close = ")" },
            { open = "[", close = "]" },
            { open = "{", close = "}" }
          },
          ignore_beginning = true --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]] ,
          exclude = {} -- tabout will ignore these filetypes
        }
      end,
      wants = { "nvim-treesitter" }, -- or require if not used so far
      after = { "nvim-cmp" } -- if a completion plugin is using tabs load it before
    }

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
    }
    use "nvim-telescope/telescope-symbols.nvim"
    use "nvim-telescope/telescope-dap.nvim"

    -- for nice icons <- require a nerd font installed (on your machine)
    use "kyazdani42/nvim-web-devicons"

    -- File explorer
    use {
      "kyazdani42/nvim-tree.lua",
    }

    -- top buffer line
    use {
      "akinsho/nvim-bufferline.lua",
      config = function()
        require('bufferline').setup {}
      end
    }
    -- Status line
    use {
      "glepnir/galaxyline.nvim",
      branch = "main",
      config = function()
        require("thib.galaxyline")
      end
    }

    -- Nice search highlight
    use {
      "kevinhwang91/nvim-hlslens",
      config = function()
        require('thib.nvim-hlslens')
      end
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
      require("packer").sync()
    end
  end
)
