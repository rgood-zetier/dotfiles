-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.smoothscroll = false

vim.filetype.add({
  extension = {
    mak = "make",
    make = "make",
    mk = "make",
  },
  pattern = {
    [".*/GNUmakefile%..*"] = "make",
    [".*/Makefile%..*"] = "make",
    [".*/makefile%..*"] = "make",
  },
})

local user_bins = {
  vim.fn.expand("~/.cargo/bin"),
  vim.fn.expand("~/.local/bin"),
}

local path_sep = package.config:sub(1, 1) == "\\" and ";" or ":"
local path = vim.env.PATH or ""
local prepend = vim.tbl_filter(function(dir)
  return vim.fn.isdirectory(dir) == 1
end, user_bins)

if #prepend > 0 then
  local seen = {}
  for _, dir in ipairs(prepend) do
    seen[dir] = true
  end

  local entries = vim.tbl_filter(function(entry)
    return entry ~= "" and not seen[entry]
  end, vim.split(path, path_sep, { plain = true }))

  vim.list_extend(prepend, entries)
  vim.env.PATH = table.concat(prepend, path_sep)
end
