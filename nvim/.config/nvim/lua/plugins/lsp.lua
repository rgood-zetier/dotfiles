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
              pycodestyle = { enabled = false },
              pyflakes = { enabled = false },
              mccabe = { enabled = false },
              flake8 = { enabled = false },
              pylint = { enabled = false },
              autopep8 = { enabled = false },
              yapf = { enabled = false },
              rope_completion = { enabled = false },
              rope_autoimport = { enabled = false },
            },
          },
        },
      },
    },
  },
}
