-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "DiagnosticUnnecessary", {})
  end,
})
vim.api.nvim_set_hl(0, "DiagnosticUnnecessary", {})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "make",
  callback = function(event)
    require("config.make_nav").setup_buffer(event.buf)
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    if vim.bo[event.buf].filetype == "make" then
      require("config.make_nav").setup_buffer(event.buf)
    end
  end,
})
