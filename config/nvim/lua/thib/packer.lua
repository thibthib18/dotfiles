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

    -- show hex colors
    use({
      'norcalli/nvim-colorizer.lua',
      config = function()
        require('colorizer').setup({
          "*"
        })
      end
    })

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
      "folke/noice.nvim",
      commit = "6c87c1d11c38180fb72bf8f45518a0a3e081afc1",
      requires = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        "rcarriga/nvim-notify",
      }
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
      'harrisoncramer/gitlab.nvim',
      requires = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "stevearc/dressing.nvim", -- Recommended but not required. Better UI for pickers.
        "nvim-tree/nvim-web-devicons", -- Recommended but not required. Icons in discussion tree.
      },
      run = function() require("gitlab.server").build(true) end,
      config = function()
        print('Setting up gitlab')
        require("gitlab").setup({
          port = nil, -- The port of the Go server, which runs in the background, if omitted or `nil` the port will be chosen automatically
          log_path = vim.fn.stdpath("cache") .. "/gitlab.nvim.log", -- Log path for the Go server
          config_path = nil, -- Custom path for `.gitlab.nvim` file, please read the "Connecting to Gitlab" section
          debug = { go_request = false, go_response = false }, -- Which values to log
          attachment_dir = nil, -- The local directory for files (see the "summary" section)
          popup = { -- The popup for comment creation, editing, and replying
            exit = "<Esc>",
            perform_action = "<leader>s", -- Once in normal mode, does action (like saving comment or editing description, etc)
            perform_linewise_action = "<leader>l", -- Once in normal mode, does the linewise action (see logs for this job, etc)
            width = "40%",
            height = "60%",
            border = "rounded", -- One of "rounded", "single", "double", "solid"
            opacity = 1.0, -- From 0.0 (fully transparent) to 1.0 (fully opaque)
            comment = nil, -- Individual popup overrides, e.g. { width = "60%", height = "80%", border = "single", opacity = 0.85 },
            edit = nil,
            note = nil,
            pipeline = nil,
            reply = nil,
          },
          discussion_tree = { -- The discussion tree that holds all comments
            blacklist = {}, -- List of usernames to remove from tree (bots, CI, etc)
            jump_to_file = "o", -- Jump to comment location in file
            jump_to_reviewer = "m", -- Jump to the location in the reviewer window
            edit_comment = "e", -- Edit comment
            delete_comment = "dd", -- Delete comment
            reply = "r", -- Reply to comment
            toggle_node = "t", -- Opens or closes the discussion
            toggle_resolved = "p", -- Toggles the resolved status of the whole discussion
            position = "left", -- "top", "right", "bottom" or "left"
            size = "20%", -- Size of split
            relative = "editor", -- Position of tree split relative to "editor" or "window"
            resolved = '✓', -- Symbol to show next to resolved discussions
            unresolved = '✖', -- Symbol to show next to unresolved discussions
            tree_type = "simple", -- Type of discussion tree - "simple" means just list of discussions, "by_file_name" means file tree with discussions under file
          },
          info = { -- Show additional fields in the summary pane
            enabled = true,
            horizontal = false, -- Display metadata to the left of the summary rather than underneath
            fields = { -- The fields listed here will be displayed, in whatever order you choose
              "author",
              "created_at",
              "updated_at",
              "merge_status",
              "draft",
              "conflicts",
              "assignees",
              "reviewers",
              "branch",
              "pipeline",
            },
          },
          discussion_sign_and_diagnostic = {
            skip_resolved_discussion = false,
            skip_old_revision_discussion = true,
          },
          discussion_sign = {
            -- See :h sign_define for details about sign configuration.
            enabled = true,
            text = "💬",
            linehl = nil,
            texthl = nil,
            culhl = nil,
            numhl = nil,
            priority = 20, -- Priority of sign, the lower the number the higher the priority
            helper_signs = {
              -- For multiline comments the helper signs are used to indicate the whole context
              -- Priority of helper signs is lower than the main sign (-1).
              enabled = true,
              start = "↑",
              mid = "|",
              ["end"] = "↓",
            },
          },
          discussion_diagnostic = {
            -- If you want to customize diagnostics for discussions you can make special config
            -- for namespace `gitlab_discussion`. See :h vim.diagnostic.config
            enabled = true,
            severity = vim.diagnostic.severity.INFO,
            code = nil, -- see :h diagnostic-structure
            display_opts = {}, -- see opts in vim.diagnostic.set
          },
          pipeline = {
            created = "",
            pending = "",
            preparing = "",
            scheduled = "",
            running = "ﰌ",
            canceled = "ﰸ",
            skipped = "ﰸ",
            success = "✓",
            failed = "",
          },
          colors = {
            discussion_tree = {
              username = "Keyword",
              date = "Comment",
              chevron = "DiffviewNonText",
              directory = "Directory",
              directory_icon = "DiffviewFolderSign",
              file_name = "Normal",
            }
          }
        })
        print('Setting up gitlab.... Done')
      end,
    }
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
      commit = '04617d1f5b1cfbdd2a99d9765ef04fc6ae415622',
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

    -- autopairs
    use {
      "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
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
      commit = 'a708bd2413d46',
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

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
      require("packer").sync()
    end
  end
)
