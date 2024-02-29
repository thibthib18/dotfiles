return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {

        "bash-language-server",
        "chrome-debug-adapter",
        -- 'clang-format',
        "clangd",
        -- 'cmake-language-server',
        "eslint-lsp",
        "eslint_d",
        "lua-language-server",
        "node-debug2-adapter",
        "prettier",
        "pyright",
        "typescript-language-server",
        -- 'yapf' -- some issues with Python version on SV rn

        -- PHP / Laravel
        "phpactor",
        "phpstan",
        "pint",
        "blade-formatter",
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        automatic_installation = true,
      })
    end,
  },
}
