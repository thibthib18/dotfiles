local null_ls = require("null-ls")

local sources = {
  null_ls.builtins.formatting.beautysh, -- shell script formatting
  null_ls.builtins.formatting.prettier,
  null_ls.builtins.formatting.lua_format,
  null_ls.builtins.formatting.yapf,
  null_ls.builtins.formatting.clang_format,
  -- refactoring
  null_ls.builtins.code_actions.refactoring,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
-- you can reuse a shared lspconfig on_attach callback here
local on_attach = function(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd(
      "BufWritePre",
      {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          vim.lsp.buf.format(
            {
              bufnr = bufnr,
            }
          )
        end
      }
    )
  end
end

null_ls.setup(
  {
    sources = sources,
    on_attach = on_attach
  }
)
