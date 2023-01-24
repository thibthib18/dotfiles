local lspconfig = require('thib.lsp.lspconfig')
local on_attach = lspconfig.on_attach
local lsp_flags = lspconfig.lsp_flags
local capabilities = require('thib.lsp.complete')

require('lspconfig')['rust_analyzer'].setup{
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
}
