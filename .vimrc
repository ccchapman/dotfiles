" Enable syntax highlighting.
syntax on

" Turn off error bells.
set noerrorbells

" Set reasonable tab defaults.
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Allow backspace.
set backspace=indent,eol,start

" Enable line numbers and no line wrapping.
set nu
set nowrap

" Use undo directory and disable swap and backups.
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" Improved searching.
set smartcase
set incsearch

" Show character column bar.
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Remove trailing whitespace on save.
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()

" Show spelling errors.
set spell
hi SpellBad cterm=underline ctermbg=none

" Install plugins with Plug.
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'kien/ctrlp.vim'
Plug 'mbbill/undotree'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-airline/vim-airline'
call plug#end()

" Color scheme.
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

" Use project root and ignore for searching.
if executable('rg')
    let g:rg_derive_root='true'
endif

" Set leader key to space.
let mapleader = " "

" Remap splits.
nnoremap <leader>sh :sp<CR>
nnoremap <leader>sv :vsp<CR>

" Remap toggling splits.
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Remap undotree.
nnoremap <leader>u :UndotreeShow<CR>

" Remap file tree.
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

" Remap ripgrep.
nnoremap <Leader>ps :Rg<SPACE>
