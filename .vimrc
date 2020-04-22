" Enable syntax highlighting.
syntax on

" Project specific .vimrc.
set exrc

" Turn off welcome message.
set shortmess=I

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
Plug 'morhetz/gruvbox' " Color scheme.
Plug 'jremmen/vim-ripgrep' " Search in project.
Plug 'tpope/vim-fugitive' " Everything Git.
Plug 'vim-utils/vim-man' " Vim man pages.
Plug 'mbbill/undotree' " Show recent changes.
Plug 'editorconfig/editorconfig-vim' " Support .editorconfig.
Plug 'vim-airline/vim-airline' " Status bar.
Plug 'junegunn/fzf' " Fuzzy file finder.
Plug 'dense-analysis/ale'
call plug#end()

" Color scheme.
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

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
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Down> :echoe "Use j"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Right> :echoe "Use l"<CR>

" Remap fuzzy searching.
nnoremap <leader>f :FZF<CR>

" Remap undotree.
nnoremap <leader>u :UndotreeShow<CR>

" Remap file tree.
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

" Remap ripgrep.
nnoremap <Leader>ps :Rg<SPACE>
