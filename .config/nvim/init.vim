call plug#begin('~/.vim/plugged')

  Plug 'morhetz/gruvbox'

  Plug 'itchyny/lightline.vim'

  Plug 'junegunn/fzf'
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  Plug 'mattn/emmet-vim'
  Plug 'tpope/vim-fugitive'

  Plug 'editorconfig/editorconfig-vim'
  Plug 'jwalton512/vim-blade', { 'for': 'blade.php' }
  Plug 'nelsyeung/twig.vim', { 'for': 'twig' }

call plug#end()

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent
set listchars=tab:>-,trail:~,space:␣

set nu rnu
set nowrap
set undodir=~/.vim/undodir
set undofile

set smartcase
set incsearch
set hlsearch
set icm=split

set clipboard=unnamed
set colorcolumn=80,120
set shortmess=Ia
set spell
set noshowmode
set laststatus=2
set updatetime=300
set shell=bash

colorscheme gruvbox

hi ColorColumn ctermbg=0 guibg=lightgrey
hi SpellBad cterm=underline ctermbg=none

fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

fun! s:checkBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfun

let mapleader = ' '

nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>checkBackSpace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

nnoremap <leader>sh :sp<CR>
nnoremap <leader>sv :vsp<CR>

nnoremap <leader>tc :tabnew<CR>
nnoremap <leader>tn :tabn<CR>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nnoremap <leader>f :FZF<CR>

nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

nnoremap <Leader>i :set list!<CR>

nnoremap <Leader>cs :noh<CR>

nmap <Leader>gs :G<bar> :only<CR>

autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif
autocmd BufWritePre * :call TrimWhitespace()

let g:lightline = {
  \ 'colorscheme': 'gruvbox',
  \ }

let g:coc_global_extensions = [
  \ 'coc-phpls',
  \ 'coc-tsserver',
  \ 'coc-css',
  \ 'coc-tailwindcss',
  \ 'coc-emmet',
  \ 'coc-pairs',
  \ ]

let g:coc_filetype_map = {
  \ 'html.twig.js.css': 'html',
  \ }
