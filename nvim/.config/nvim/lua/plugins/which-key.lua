return {
  "folke/which-key.nvim",
  event = "VeryLazy",     -- load after startup is complete
  opts = {
    preset = "modern",
    delay = 300,
  },
  keys = {
    {
      "<leader>?",
      function() require("which-key").show({ global = false }) end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}