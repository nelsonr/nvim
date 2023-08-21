-- Disable builtin file explorer
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.o.termguicolors = true

-- Use Space as leader key
vim.g.mapleader = " "

-- Show line numbers
vim.o.number = true

-- Use system clipboard
vim.o.clipboard = "unnamedplus"

-- Highlight cursor line
vim.o.cursorline = true

-- Highlight search results
vim.o.hlsearch = true

-- Ignore case when using lowercase in search
vim.o.ignorecase = true

-- But don't ignore it when using upper case 
vim.o.smartcase = true

vim.o.smarttab = true
vim.o.smartindent = true

-- Convert tabs to spaces.
vim.o.expandtab = true

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

vim.o.splitbelow = true
vim.o.splitright = true

-- Minimum offset in lines to screen borders
vim.o.scrolloff = 12

-- Encoding
vim.fileencoding = "utf-8"

-- Disable unused providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- Hide blank lines "~"
vim.opt.fillchars = { eob = ' ' }

-- Hide builtin mode message (when using a replacement like "lualine")
vim.o.showmode = false
