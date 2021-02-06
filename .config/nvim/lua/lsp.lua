local lspconfig = require('lspconfig')

-- Language Servers

lspconfig.tsserver.setup{
	on_attach=require'completion'.on_attach
}

lspconfig.cssls.setup{
	on_attach=require'completion'.on_attach
}

-- Remaps

vim.api.nvim_set_keymap(
	'n',
	'K',
	'<cmd>lua vim.lsp.buf.hover()<CR>',
	{
		noremap = true,
		silent = true,
	}
)

vim.api.nvim_set_keymap(
	'n',
	'gd',
	'<cmd>lua vim.lsp.buf.definition()<CR>',
	{
		noremap = true,
		silent = true,
	}
)

vim.api.nvim_set_keymap(
	'n',
	'gr',
	'<cmd>lua vim.lsp.buf.references()<CR>',
	{
		noremap = true,
		silent = true,
	}
)
