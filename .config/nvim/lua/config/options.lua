local opt = vim.opt

opt.showmode = false
opt.hidden = true
opt.cmdheight = 1
opt.incsearch = true
opt.showmatch = true
opt.relativenumber = true
opt.number = true
opt.ignorecase = true
opt.smartcase = true
opt.cursorline = true
opt.splitright = true
opt.splitbelow = true
opt.updatetime = 1000
opt.hlsearch = true
opt.scrolloff = 10

opt.autoindent = true
opt.cindent = true
opt.wrap = false

opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true

opt.clipboard = 'unnamedplus'

opt.inccommand = 'split'

opt.shortmess = 'c'

--opt.spell = true

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

vim.cmd [[colorscheme gruvbox]]

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
}
