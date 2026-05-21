return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      clangd = {},
      ["make-ls"] = {
        cmd = { "make-ls" },
        enabled = vim.fn.executable("make-ls") == 1,
        filetypes = { "make" },
        mason = false,
        root_markers = { "Makefile", "makefile", "GNUmakefile", ".git" },
      },
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
