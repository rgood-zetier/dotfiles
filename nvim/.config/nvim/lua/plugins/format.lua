return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      python = { "yapf" },
    },
    formatters = {
      yapf = {
        cwd = require("conform.util").root_file({ "pyproject.toml", "setup.cfg", ".style.yapf" }),
        require_cwd = false,
      },
    },
  },
}
