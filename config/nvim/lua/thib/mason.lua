require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    'chrome-debug-adapter',
    'clang-format',
    'clangd',
    'cmake-language-server',
    'eslint-lsp',
    'eslint_d',
    'lua-language-server',
    'node-debug2-adapter',
    'prettier',
    'pyright',
    'typescript-language-server',
    'yapf'
  },
  automatic_installation = true,
})

