return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      pyright = {
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = "openFilesOnly",
              extraPaths = { "/home/sv/main/libs/pylib/src", "/home/sv/main/backend/workflow_automation/src" },
            },
          },
        },
      },
    },
  },
}
