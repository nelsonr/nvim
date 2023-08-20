-- Load Packer
vim.cmd([[packadd packer.nvim]])

-- Rerun PackerCompile everytime plugins.lua is updated
vim.cmd([[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local packer = require("packer")

-- Initialize plugins
return packer.startup(function(use)
  -- Let Packer manage itself
  use { "wbthomason/packer.nvim", opt = true }

  -- Better syntax highlighting
  use {
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
    config = function() require("plugins.treesitter") end
  }

  -- LSP
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  require("plugins.lsp_config")

  -- Fuzzy finder
  use { "junegunn/fzf", run = ":call fzf#install()" }
  use {
    "junegunn/fzf.vim",
    config = function() require("plugins.fzf") end
  }

  -- File Explorer
  use {
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons", -- optional
    },
    config = function() require("plugins.nvim-tree") end
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }

  -- Status line
  use {
    "hoob3rt/lualine.nvim",
    config = function() require("plugins.lualine") end,
  }

  -- Github themes
  use {
    "projekt0n/github-nvim-theme",
    config = function() vim.cmd("colorscheme github_dark_dimmed") end
  }

  -- Add/delete/change surrounding pairs (quotes, parenthesis, etc..)
  use {
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function() require("plugins.nvim-surround") end
  }
end)
