return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
  },
  config = function()
        -- Tell LSP about blink.cmp's expanded capabilities
    local capabilities = require("blink.cmp").get_lsp_capabilities()
    -- Diagnostic display configuration
    vim.diagnostic.config({
      virtual_text = true,         -- show errors inline at end of line
      signs = true,                -- show error/warning signs in gutter
      underline = true,
      update_in_insert = false,    -- don't update diagnostics while typing
      severity_sort = true,
      float = {
        border = "rounded",
        source = true,
      },
    })

    -- Pretty diagnostic icons in the sign column
    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    -- LSP keymaps — only active in buffers with an LSP attached
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf }
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", opts, { desc = desc }))
        end

        -- Navigation
        map("n", "gd", vim.lsp.buf.definition, "Go to definition")
        map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
        map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
        map("n", "gr", vim.lsp.buf.references, "Find references")
        map("n", "gt", vim.lsp.buf.type_definition, "Go to type definition")

        -- Information
        map("n", "K", vim.lsp.buf.hover, "Hover documentation")
        map("n", "<C-k>", vim.lsp.buf.signature_help, "Signature help")

        -- Actions
        map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
        map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
        map("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, "Format buffer")

        -- Diagnostics
        map("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, "Previous diagnostic")
        map("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, "Next diagnostic")
        map("n", "<leader>e", vim.diagnostic.open_float, "Show diagnostic")
        map("n", "<leader>q", vim.diagnostic.setloclist, "Diagnostics to loclist")
      end,
    })

    -- Per-server configuration overrides
    -- Neovim 0.11+ uses vim.lsp.config() — much cleaner than the old setup pattern
    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          diagnostics = {
            globals = { "vim" },     -- stop "undefined global 'vim'" warnings in nvim configs
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = { enable = false },
        },
      },
    })

    -- Add other servers here as you install them, e.g.:
    -- vim.lsp.config("pyright", { settings = { ... } })
  end,
}
