vim.api.nvim_set_keymap(
  'n',
  '<leader>h',
  '<cmd>wincmd h<cr>',
  {
    noremap = true,
    silent = true,
  }
)

vim.api.nvim_set_keymap(
  'n',
  '<leader>j',
  '<cmd>wincmd j<cr>',
  {
    noremap = true,
    silent = true,
  }
)

vim.api.nvim_set_keymap(
  'n',
  '<leader>k',
  '<cmd>wincmd k<cr>',
  {
    noremap = true,
    silent = true,
  }
)

vim.api.nvim_set_keymap(
  'n',
  '<leader>l',
  '<cmd>wincmd l<cr>',
  {
    noremap = true,
    silent = true,
  }
)

vim.api.nvim_set_keymap(
  'n',
  '<leader>sh',
  '<cmd>sp<cr>',
  {
    noremap = true,
    silent = true,
  }
)

vim.api.nvim_set_keymap(
  'n',
  '<leader>sv',
  '<cmd>vsp<cr>',
  {
    noremap = true,
    silent = true,
  }
)

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
