return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      clangd = {},
      ruff = {},
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
              jedi_definition = { enabled = true },
              jedi_hover = { enabled = true },
              jedi_references = { enabled = true },
            },
          },
        },
      },
    },
  },
}
