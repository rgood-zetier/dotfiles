return {
  "folke/snacks.nvim",
  opts = {
    scroll = { enabled = false },
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
