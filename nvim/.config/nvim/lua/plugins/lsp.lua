return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      pylsp = {
        settings = {
          pylsp = {
            plugins = {
              flake8 = {
                ignore = { "E501" },
              },
              pycodestyle = {
                ignore = { "E501" },
              },
              jedi_definition = { enabled = false },
              jedi_hover = { enabled = false },
              jedi_references = { enabled = false },
            },
          },
        },
      },
      pyright = {
        settings = {
          pyright = {
            disableOrganizeImports = true,
          },
          python = {
            analysis = {
              typeCheckingMode = "off",
              diagnosticMode = "openFilesOnly",
              diagnosticSeverityOverrides = {
                reportMissingImports = "error",
                reportUndefinedVariable = "error",
                reportAttributeAccessIssue = "warning",
              },
            },
          },
        },
      },
    },
  },
}
