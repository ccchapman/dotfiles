call plug#begin('~/.vim/plugged')
  Plug 'dracula/vim'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'itchyny/lightline.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'stsewd/fzf-checkout.vim'
  Plug 'jwalton512/vim-blade', { 'for': 'blade.php' }
  Plug 'mattn/emmet-vim'
  Plug 'beyondwords/vim-twig'
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  Plug 'tpope/vim-fugitive'
  Plug 'ccchapman/watson.nvim', { 'branch': 'main' }
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

let g:dracula_colorterm = 0
colorscheme dracula
hi SpellBad cterm=underline ctermbg=none
hi Comment cterm=italic

let mapleader = ' '

inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<c-h>"
inoremap <silent><expr> <tab> pumvisible() ? "\<c-n>" : <sid>checkBackSpace() ? "\<tab>" : coc#refresh()
nmap <leader>cs :noh<cr>
nmap <leader>f :FZF<cr>
nmap <leader>ga :CocDiagnostics<cr>
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>gs :G<bar> :only<cr>
nmap <leader>gc :GCheckout<cr>
nmap <leader>h :wincmd h<cr>
nmap <leader>i :set list!<cr>
nmap <leader>j :wincmd j<cr>
nmap <leader>k :wincmd k<cr>
nnoremap <silent> K :call <sid>show_documentation()<cr>
nmap <leader>l :wincmd l<cr>
nmap <leader>rg :CocSearch<space>
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>sh :sp<cr>
nmap <leader>sv :vsp<cr>
nmap <leader>tc :tabnew<cr>
nmap <leader>tn :tabn<cr>
nmap <leader>tw :Watson<cr>
nmap <leader>ts :WatsonStartCwd<cr>
nmap <leader>te :WatsonStop<cr>
nmap <leader>tr :WatsonRestart<cr>

autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif
autocmd BufWritePre * :call TrimWhitespace()
autocmd BufRead,BufNewFile *.twig set filetype=html.twig

command! -nargs=0 Prettier :CocCommand prettier.formatFile

let g:lightline = {
  \ 'colorscheme': 'dracula',
  \ }
let g:coc_global_extensions = [
  \ 'coc-css',
  \ 'coc-emmet',
  \ 'coc-pairs',
  \ 'coc-phpls',
  \ 'coc-prettier',
  \ 'coc-tailwindcss',
  \ 'coc-tsserver',
  \ 'coc-snippets',
  \ 'coc-svg',
  \ 'coc-yank',
  \ ]
let g:coc_filetype_map = {
  \ 'html.twig': 'html',
  \ }
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"

fun! s:checkBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfun

fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

fun! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfun
