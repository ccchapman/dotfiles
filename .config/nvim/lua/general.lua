vim.g.mapleader = ' '

vim.api.nvim_set_option('ts', 2)
vim.api.nvim_set_option('sw', 2)
vim.api.nvim_set_option('sts', 2)
vim.api.nvim_set_option('et', true)

vim.api.nvim_set_option('nu', true)
vim.api.nvim_set_option('rnu', true)

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

-- Migrate autocmd to Lua when https://github.com/neovim/neovim/pull/12378 is merged.
vim.api.nvim_exec(
[[
autocmd BufWritePre * :Prettier
autocmd BufRead,BufNewFile *.twig set filetype=html.twig
autocmd BufWritePre * :call TrimWhitespace()

fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun
]],
true)
