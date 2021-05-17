vim.g.mapleader = ' '

-- Global helpers
require('config.globals.opt')

-- Plugins from packer.nvim package manager
require('config.plugins')

-- Neovim options & mappings
require('config.options')
require('config.mappings')

-- Neovim LSP configuration
require('config.lsp')

-- Telescope configuration
require('config.telescope')
require('config.telescope.mappings')
