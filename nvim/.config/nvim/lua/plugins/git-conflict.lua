return {
  "akinsho/git-conflict.nvim",
  version = "*",
  event = "VeryLazy",
  config = true,
  keys = {
    { "<leader>gx", "<cmd>GitConflictListQf<cr>", desc = "List Conflicts (Quickfix)" },
  },
}
