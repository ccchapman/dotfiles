call plug#begin('~/.vim/plugged')
  Plug 'editorconfig/editorconfig-vim'
  Plug 'itchyny/lightline.vim'
  Plug 'junegunn/fzf'
  Plug 'jwalton512/vim-blade', { 'for': 'blade.php' }
  Plug 'mattn/emmet-vim'
  Plug 'morhetz/gruvbox'
  Plug 'nelsyeung/twig.vim', { 'for': 'twig' }
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  Plug 'tpope/vim-fugitive'
call plug#end()

set autoindent
set clipboard=unnamedplus
set colorcolumn=80,120
set expandtab
set hlsearch
set icm=split
set incsearch
set laststatus=2
set listchars=tab:>-,trail:~,space:␣
set noshowmode
set nowrap
set nu rnu
set shell=bash
set shiftwidth=2
set shortmess=Ia
set smartcase
set smartindent
set softtabstop=2
set spell
set tabstop=2
set undodir=~/.vim/undodir
set undofile
set updatetime=300

colorscheme gruvbox
hi ColorColumn ctermbg=0 guibg=lightgrey
hi SpellBad cterm=underline ctermbg=none

let mapleader = ' '

inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<c-h>"
inoremap <silent><expr> <tab> pumvisible() ? "\<c-n>" : <sid>checkBackSpace() ? "\<tab>" : coc#refresh()
nmap <leader>cs :noh<cr>
nmap <leader>f :FZF<cr>
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>gs :G<bar> :only<cr>
nmap <leader>h :wincmd h<cr>
nmap <leader>i :set list!<cr>
nmap <leader>j :wincmd j<cr>
nmap <leader>k :wincmd k<cr>
nmap <leader>l :wincmd l<cr>
nmap <leader>rg :CocSearch<space>
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>sh :sp<cr>
nmap <leader>sv :vsp<cr>
nmap <leader>tc :tabnew<cr>
nmap <leader>tn :tabn<cr>

autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif
autocmd BufWritePre * :call TrimWhitespace()

let g:lightline = {
  \ 'colorscheme': 'gruvbox',
  \ }
let g:coc_global_extensions = [
  \ 'coc-css',
  \ 'coc-emmet',
  \ 'coc-pairs',
  \ 'coc-phpls',
  \ 'coc-tailwindcss',
  \ 'coc-tsserver',
  \ ]
let g:coc_filetype_map = {
  \ 'html.twig.js.css': 'html',
  \ }

fun! s:checkBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfun

fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun
