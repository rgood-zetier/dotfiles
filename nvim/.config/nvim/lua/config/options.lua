-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.smoothscroll = false

local cargo_bin = vim.fn.expand("~/.cargo/bin")
if vim.fn.isdirectory(cargo_bin) == 1 then
  local path_sep = package.config:sub(1, 1) == "\\" and ";" or ":"
  local path = vim.env.PATH or ""
  local entries = vim.tbl_filter(function(entry)
    return entry ~= "" and entry ~= cargo_bin
  end, vim.split(path, path_sep, { plain = true }))
  table.insert(entries, 1, cargo_bin)
  vim.env.PATH = table.concat(entries, path_sep)
end
