vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	use 'neovim/nvim-lspconfig'
	use 'nvim-lua/completion-nvim'
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			{'nvim-lua/popup.nvim'},
			{'nvim-lua/plenary.nvim'},
		},
	}
end)
