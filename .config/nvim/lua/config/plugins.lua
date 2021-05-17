return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'tpope/vim-fugitive'
  use 'prettier/vim-prettier'
  use 'editorconfig/editorconfig-vim'

  -- LSP
    use 'neovim/nvim-lspconfig'
    use 'wbthomason/lsp-status.nvim'
    use 'glepnir/lspsaga.nvim'
    use 'onsails/lspkind-nvim'
    use {
      'folke/lsp-trouble.nvim',
      config = function()
        require('trouble').setup {
          auto_preview = false,
          auto_fold = true,
        }
      end,
    }
    use 'hrsh7th/nvim-compe'
    use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }

    use 'morhetz/gruvbox'

    use 'mhinz/vim-startify'

    use 'vim-airline/vim-airline'

    use 'nvim-treesitter/nvim-treesitter'

    use 'SirVer/ultisnips'

    use 'nelsyeung/twig.vim'
end)
