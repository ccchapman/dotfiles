call plug#begin('~/.vim/plugged')

  Plug 'editorconfig/editorconfig-vim'
  Plug 'itchyny/lightline.vim'
  Plug 'jremmen/vim-ripgrep'
  Plug 'junegunn/fzf'
  Plug 'jwalton512/vim-blade'
  Plug 'morhetz/gruvbox'
  Plug 'nelsyeung/twig.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'tpope/vim-fugitive'

call plug#end()

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<,space:␣

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

colorscheme gruvbox

hi ColorColumn ctermbg=0 guibg=lightgrey
hi SpellBad cterm=underline ctermbg=none

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

nnoremap <Leader>rg :Rg<Space>

nnoremap <Leader>i :set list!<CR>

nnoremap <Leader>cs :noh<CR>

nnoremap <Leader>g :G<CR>

fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

autocmd BufReadPost * exe 'normal! g`"'
autocmd BufWritePre * :call TrimWhitespace()

let g:lightline = {
  \ 'colorscheme': 'gruvbox',
  \ }

let g:coc_global_extensions = [
  \ 'coc-phpls',
  \ 'coc-tsserver',
  \ ]
