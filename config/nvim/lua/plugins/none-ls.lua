local null_ls = require("null-ls")

local sources = {
  null_ls.builtins.formatting.prettier,
  null_ls.builtins.formatting.yapf,
  null_ls.builtins.formatting.clang_format,
  null_ls.builtins.formatting.stylua,

  -- PHP
  null_ls.builtins.diagnostics.phpstan.with({
    prefer_local = "vendor/bin/phpstan",
  }),
  null_ls.builtins.formatting.pint,
  null_ls.builtins.formatting.blade_formatter,

  -- refactoring
  null_ls.builtins.code_actions.refactoring,
}

return {
  "nvimtools/none-ls.nvim",
  opts = { sources = sources },
}
