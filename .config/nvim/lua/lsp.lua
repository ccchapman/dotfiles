local lspconfig = require('lspconfig')
local completion = require('completion')

-- Language Servers

lspconfig.tsserver.setup{
  on_attach = completion.on_attach
}

lspconfig.cssls.setup{
  on_attach = completion.on_attach
}

lspconfig.intelephense.setup{
  on_attach = completion.on_attach
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

vim.api.nvim_set_keymap(
  'i',
  '<S-Tab>',
  'pumvisible() ? "\\<C-p>" : "\\<Tab>"',
  {
    expr = true,
  }
)

vim.api.nvim_set_keymap(
  'i',
  '<Tab>',
  'pumvisible() ? "\\<C-n>" : "\\<Tab>"',
  {
    expr = true,
  }
)

vim.api.nvim_set_option('completeopt', 'menuone,noinsert,noselect')
