call plug#begin('~/.vim/plugged')
  Plug 'editorconfig/editorconfig-vim'
  Plug 'itchyny/lightline.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'jwalton512/vim-blade', { 'for': 'blade.php' }
  Plug 'mattn/emmet-vim'
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'beyondwords/vim-twig'
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  Plug 'tpope/vim-fugitive'
  Plug 'nvim-treesitter/nvim-treesitter'
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
set foldmethod=indent

let g:dracula_colorterm=0
colorscheme dracula
hi ColorColumn ctermbg=0 guibg=lightgrey
hi SpellBad cterm=underline ctermbg=none
hi Comment cterm=italic

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
nmap <leader>tf :call Tether()<cr>

autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif
autocmd BufWritePre * :call TrimWhitespace()
autocmd BufRead,BufNewFile *.twig set filetype=html.twig

command! -nargs=0 Prettier :CocCommand prettier.formatFile

let g:lightline = {
  \ 'colorscheme': 'dracula',
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' }
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

fun! Tether()
  call inputsave()
  let extension = input('Enter extension: ')
  call inputrestore()
  for file in systemlist($FZF_DEFAULT_COMMAND)
    if file =~ expand('%:t:r') . '.' . extension
      execute 'e ' . file
    endif
  endfor
endfun

" Treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
    highlight = {
      enable = true,                    -- false will disable the whole extension
      disable = { "c", "rust" },        -- list of language that will be disabled
      custom_captures = {               -- mapping of user defined captures to highlight groups
        -- ["foo.bar"] = "Identifier"   -- highlight own capture @foo.bar with highlight group "Identifier", see :h nvim-treesitter-query-extensions
      },
    },
    incremental_selection = {
      enable = true,
      disable = { "cpp", "lua" },
      keymaps = {                       -- mappings for incremental selection (visual mappings)
        init_selection = "gnn",         -- maps in normal mode to init the node/scope selection
        node_incremental = "grn",       -- increment to the upper named parent
        scope_incremental = "grc",      -- increment to the upper scope (as defined in locals.scm)
        node_decremental = "grm",       -- decrement to the previous node
      }
    },
    refactor = {
      highlight_definitions = {
        enable = true
      },
      highlight_current_scope = {
        enable = true
      },
      smart_rename = {
        enable = true,
        keymaps = {
          smart_rename = "grr"          -- mapping to rename reference under cursor
        }
      },
      navigation = {
        enable = true,
        keymaps = {
          goto_definition = "gnd",      -- mapping to go to definition of symbol under cursor
          list_definitions = "gnD"      -- mapping to list all definitions in current file
        }
      }
    },
    textobjects = { -- syntax-aware textobjects
    enable = true,
    disable = {},
    keymaps = {
        ["iL"] = { -- you can define your own textobjects directly here
          python = "(function_definition) @function",
          cpp = "(function_definition) @function",
          c = "(function_definition) @function",
          java = "(method_declaration) @function"
        },
        -- or you use the queries from supported languages with textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["aC"] = "@class.outer",
        ["iC"] = "@class.inner",
        ["ac"] = "@conditional.outer",
        ["ic"] = "@conditional.inner",
        ["ae"] = "@block.outer",
        ["ie"] = "@block.inner",
        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner",
        ["is"] = "@statement.inner",
        ["as"] = "@statement.outer",
        ["ad"] = "@comment.outer",
        ["am"] = "@call.outer",
        ["im"] = "@call.inner"
      }
    },
    ensure_installed = "all" -- one of "all", "language", or a list of languages
}
EOF
