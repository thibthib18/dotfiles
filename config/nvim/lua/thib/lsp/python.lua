local lspconfig = require('thib.lsp.lspconfig')
local on_attach = lspconfig.on_attach
local lsp_flags = lspconfig.lsp_flags
local capabilities = require('thib.lsp.complete')

require('lspconfig')['pyright'].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "openFilesOnly",
        extraPaths = { '/home/sv/main/libs/pylib/src' }

      }
    }
  },
}
