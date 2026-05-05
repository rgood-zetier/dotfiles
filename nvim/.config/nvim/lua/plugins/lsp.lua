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
              ignore = { "*" },
              typeCheckingMode = "off",
              diagnosticMode = "openFilesOnly",
            },
          },
        },
      },
    },
  },
}
