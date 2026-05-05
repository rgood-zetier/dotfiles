return {
  "mfussenegger/nvim-lint",
  opts = {
    linters = {
      flake8 = {
        args = {
          "--format=%(path)s:%(row)d:%(col)d:%(code)s:%(text)s",
          "--no-show-source",
          "--stdin-display-name",
          function() return vim.api.nvim_buf_get_name(0) end,
          "--extend-ignore=E501",
          "-",
        },
      },
    },
  },
}
