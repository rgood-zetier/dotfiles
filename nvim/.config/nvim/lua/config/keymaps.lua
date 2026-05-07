-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>uT", function()
  if vim.b._ts_off then
    vim.treesitter.start()
    vim.b._ts_off = false
  else
    vim.treesitter.stop()
    vim.b._ts_off = true
  end
end, { desc = "Toggle Treesitter (buffer)" })
