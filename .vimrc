" Enable syntax highlighting.
syntax on

" Project specific .vimrc.
set exrc

" Turn off error bells.
set noerrorbells

" Clipboard sharing.
set clipboard=unnamed

" Set reasonable tab defaults.
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent

" Allow backspace.
set backspace=indent,eol,start

" Decrease update time.
set updatetime=50

" Enable line numbers and no line wrapping.
set nu rnu
set nowrap

" Use undo directory and disable swap and backups.
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" Improved searching.
set smartcase
set incsearch
set hlsearch

" Show character column bar.
set colorcolumn=80,120
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Short messages and taller command line.
set shortmess=Ia

" Visualize indentation.
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<,space:␣

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

" Highlight current line.
set cursorline

" Install plugins with Plug.
call plug#begin('~/.vim/plugged')
Plug 'arcticicestudio/nord-vim'
Plug 'dense-analysis/ale'
Plug 'editorconfig/editorconfig-vim'
Plug 'itchyny/lightline.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf'
Plug 'jwalton512/vim-blade'
Plug 'nelsyeung/twig.vim'
Plug 'tpope/vim-fugitive'
Plug 'vimwiki/vimwiki'
Plug 'ycm-core/YouCompleteMe'
call plug#end()

" Color scheme.
colorscheme nord

" Lightline.
set laststatus=2
let g:lightline = {
    \ 'colorscheme': 'nord',
    \ }

" VimWiki requirements.
set nocompatible
filetype plugin on
let g:vimwiki_list = [{'path': '~/vimwiki/',
    \ 'syntax': 'markdown', 'ext': '.md'}]

" Use project root and ignore for searching.
if executable('rg')
    let g:rg_derive_root='true'
endif

" Jump to the last position when reading any file.
autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \ |   exe "normal! g`\""
    \ | endif

" Set leader key to space.
let mapleader = " "

" Remap splits.
nnoremap <leader>sh :sp<CR>
nnoremap <leader>sv :vsp<CR>

" Remap tabs.
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>tn :tabn<CR>

" Remap toggling splits.
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Remap arrow keys.
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

" Remap fuzzy searching.
nnoremap <leader>f :FZF<CR>

" Remap file tree.
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

" Remap ripgrep.
nnoremap <Leader>r :!rg<Space>

" Remap toggle list.
nnoremap <Leader>i :set list!<CR>

" Don't show the mode.
set noshowmode
