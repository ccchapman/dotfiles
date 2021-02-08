vim.api.nvim_set_keymap(
  'n',
  '<leader>ff',
  '<cmd>Telescope find_files<cr>',
  {
    noremap = true,
    silent = true,
  }
)

vim.api.nvim_set_keymap(
  'n',
  '<leader>gs',
  '<cmd>Telescope git_status<cr>',
  {
    noremap = true,
    silent = true,
  }
)
