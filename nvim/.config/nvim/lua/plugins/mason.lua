return {
  {
    "mason-org/mason.nvim",
    cmd = "Mason",                  -- lazy-load when :Mason is run
    build = ":MasonUpdate",         -- update registry on plugin update
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
    event = { "BufReadPre", "BufNewFile" },   -- load when you open a file
    opts = {
      ensure_installed = {
        "lua_ls",          -- Lua (you'll want this for editing your nvim config)
        -- add languages here as you need them, e.g.:
        -- "pyright",      -- Python
        -- "ts_ls",        -- TypeScript/JavaScript
        -- "rust_analyzer",
        -- "gopls",
      },
      automatic_installation = true,
    },
  },
}
