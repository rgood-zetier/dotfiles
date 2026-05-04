return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          git_status = false,
          git_untracked = false,
          watch = false,
          diagnostics = false,
        },
      },
    },
  },
}
