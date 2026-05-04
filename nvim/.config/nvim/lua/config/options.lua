local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true       -- relative numbers make j/k motions easier

-- Indentation
opt.expandtab = true            -- tabs become spaces
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true            -- case-sensitive only if you type a capital
opt.hlsearch = true
opt.incsearch = true

-- UI
opt.termguicolors = true        -- 24-bit color (required for modern themes)
opt.signcolumn = "yes"          -- always show sign column to prevent text shifting
opt.cursorline = true
opt.scrolloff = 8               -- keep 8 lines visible above/below cursor
opt.wrap = false

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Files
opt.swapfile = false
opt.backup = false
opt.undofile = true             -- persistent undo across sessions
opt.undodir = vim.fn.stdpath("data") .. "/undo"

-- Behavior
opt.mouse = "a"
opt.clipboard = "unnamedplus"   -- use system clipboard
opt.updatetime = 250            -- faster CursorHold events (used by LSP)
opt.timeoutlen = 300            -- faster which-key popups later

-- Completion
opt.completeopt = "menu,menuone,noselect"

-- Leader key (must be set before plugins load)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"