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
" set backspace=indent,eol,start

" Decrease update time.
set updatetime=50

" Enable line numbers and no line wrapping.
set nu rnu
set nowrap
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

" Use undo directory and disable swap and backups.
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" Improved searching.
set smartcase
set incsearch
set hlsearch
set icm=split

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

" coc extensions.
let g:coc_global_extensions = [
            \ 'coc-phpls',
            \ 'coc-tsserver',
            \ ]

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Install plugins with Plug.
call plug#begin('~/.vim/plugged')
Plug 'editorconfig/editorconfig-vim'
Plug 'itchyny/lightline.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf'
Plug 'jwalton512/vim-blade'
Plug 'nelsyeung/twig.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'vimwiki/vimwiki'
Plug 'morhetz/gruvbox'
call plug#end()

" Color scheme.
colorscheme gruvbox

" Lightline.
set laststatus=2
let g:lightline = {
    \ 'colorscheme': 'gruvbox',
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
nnoremap <leader>tc :tabnew<CR>
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
nnoremap <Leader>rg :Rg<Space>

" Remap toggle list.
nnoremap <Leader>i :set list!<CR>

" Remap search clearing.
nnoremap <Leader>cs :noh<CR>

" Don't show the mode.
set noshowmode

" coc
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
