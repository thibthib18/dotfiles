return {
  -- show hex colors
  {
    "norcalli/nvim-colorizer.lua",
    config = function() require("colorizer").setup({ "*" }) end,
  },

  { "bkad/CamelCaseMotion" },

  { "luochen1990/rainbow" },
  -- { "tpope/vim-surround"},

  { "tpope/vim-repeat" },

  {
    "abecodes/tabout.nvim",
    lazy = false,
    config = function()
      require("tabout").setup({
        tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
        backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
        act_as_tab = true, -- shift content if tab out is not possible
        act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
        default_tab = "<C-t>", -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
        default_shift_tab = "<C-d>", -- reverse shift default action,
        enable_backwards = true, -- well ...
        completion = false, -- if the tabkey is used in a completion pum
        tabouts = {
          { open = "'", close = "'" },
          { open = '"', close = '"' },
          { open = "`", close = "`" },
          { open = "(", close = ")" },
          { open = "[", close = "]" },
          { open = "{", close = "}" },
        },
        ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
        exclude = {}, -- tabout will ignore these filetypes
      })
    end,
    requires = {
      "nvim-treesitter/nvim-treesitter",
      "L3MON4D3/LuaSnip",
      "hrsh7th/nvim-cmp",
    },
    opt = true, -- Set this to true if the plugin is optional
    event = "InsertCharPre", -- Set the event to 'InsertCharPre' for better compatibility
    priority = 1000,
  },
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      -- Disable default tab keybinding in LuaSnip
      return {}
    end,
  },

  -- Hard to { for now, will check it out later --> lets try the cousin plugin
  -- { "machakann/vim-sandwich" },
  -- {
  --   "MunifTanjim/nui.nvim",
  --   module = { "nui.layout", "nui.popup" },
  --   module_pattern = { "nui.*" },
  -- },
  -- { "michaeljsmith/vim-indent-object" },

  -- { "kyazdani42/nvim-web-devicons" },
  -- { "rcarriga/nvim-notify" },
  -- { "onsails/lspkind.nvim" },

  --
  -- Nice colorscheme
  -- { "sainnhe/sonokai"},
  -- { 'folke/tokyonight.nvim'},
  --
  -- { "morhetz/gruvbox"},
  -- { {
  --   "sonph/onehalf",
  --   rtp = "vim",
  --   config = function()
  --     --vim.cmd("colorscheme onehalfdark")
  --   end
  -- },
  -- { "chriskempson/base16-vim"},
  -- { "shaunsingh/moonlight.nvim"},
  -- { "shaunsingh/nord.nvim"},
  -- NOOOO *********************8
  -- { { "jose-elias-alvarez/null-ls.nvim",
  --   config = function()
  --     require("thib.lsp.null-ls")
  --   end
  -- }
  --
  -- { {
  --   "glepnir/lspsaga.nvim",
  --   commit = '04617d1f5b1cfbdd2a99d9765ef04fc6ae415622',
  --   config = function()
  --     require("thib.lsp.lspsaga")
  --   end
  -- }
}
