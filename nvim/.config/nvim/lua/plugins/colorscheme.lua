return {
  "folke/tokyonight.nvim",
  lazy = false,        -- load immediately, not on demand
  priority = 1000,     -- load before other plugins so colors apply correctly
  config = function()
    require("tokyonight").setup({
      style = "night",   -- options: "storm", "moon", "night", "day"
      transparent = false,
    })
    vim.cmd.colorscheme("tokyonight")
  end,
}