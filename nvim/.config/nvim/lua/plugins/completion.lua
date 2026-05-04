return {
  "saghen/blink.cmp",
  event = "InsertEnter",       -- load when you enter insert mode
  version = "1.*",             -- use the latest stable release
  dependencies = {
    "rafamadriz/friendly-snippets",  -- huge community snippet library
  },
  opts = {
    keymap = {
      preset = "default",
      -- default preset keys:
      --   <C-space>: open menu / toggle docs
      --   <C-e>: hide menu
      --   <C-y>: accept selected item
      --   <C-n>/<C-p>: select next/prev
      --   <Tab>/<S-Tab>: snippet jump (NOT for accepting completions by default)
    },
    appearance = {
      nerd_font_variant = "mono",  -- matches your FiraCode Nerd Font Mono
    },
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
      menu = {
        border = "rounded",
      },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    fuzzy = {
      implementation = "prefer_rust_with_warning",
    },
  },
  opts_extend = { "sources.default" },
}
