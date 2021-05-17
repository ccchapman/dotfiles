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
  '<leader>fg',
  '<cmd>Telescope live_grep<cr>',
  {
    noremap = true,
    silent = true,
  }
)

vim.api.nvim_set_keymap(
  'n',
  '<leader>fb',
  '<cmd>Telescope buffers<cr>',
  {
    noremap = true,
    silent = true,
  }
)
