set number relativenumber
set laststatus=0
set showbreak=+++
set textwidth=75

set smartcase
set ignorecase
set incsearch

set inccommand=nosplit

set autoindent
set smartindent
set smarttab
set shiftwidth=2 shiftround softtabstop=2 expandtab

set listchars=tab:>>,trail:.,nbsp:~
set list

" Advanced
set ruler
set history=200

set undolevels=1000
set backspace=indent,eol,start

call plug#begin('~/.config/nvim/bundle')
Plug 'tomtom/tcomment_vim'
Plug 'machakann/vim-highlightedyank'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'mattn/emmet-vim'
Plug 'junegunn/vim-easy-align'
call plug#end()

" move  lines up and down
noremap <c-s-k> :. m .-2<CR>
noremap <c-s-j> :. m .+1<CR>

" Copy to clipboard
set clipboard =unnamedplus

" reload and source your init.vim
let mapleader = ' '
noremap <silent> <Leader><leader> :so %<CR>:exe ":echo 'Reloaded'"<CR>
noremap <silent> <leader>w :w<CR>
noremap <silent> <leader>q :q<CR>

inoremap ;; <C-o>m`<C-o>A;<C-o>``

" ,c to comment any line
noremap <silent> <Leader>c :TComment<CR>

" Hit escape with jk combo
inoremap jk <esc>

" Enable Matchit vim plugin
set nocompatible
filetype plugin on
runtime macros/matchit.vim

" Theme
syntax enable
"colorscheme Tomorrow-Night-Bright
colorscheme base16-bright
let base16colorspace=256
set termguicolors

" Easy align
xmap ga <Plugin>(EasyAlign)
nmap ga <Plugin>(EasyAlign)

" Polyglot
let g:javascript_plugin_jsdoc = 1

" Vim Javascript
let g:javascript_plugin_jsdoc = 1

" UtilSnipp
let g:UltiSnipsExpandTrigger="<c-space>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

" Deoplete Config
let g:deoplete#enable_at_startup = 1

" TernJS Configuration
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#depths = 1
let g:deoplete#sources#ternjs#filter = 0
let g:deoplete#sources#ternjs#case_insensitive = 1
let g:deoplete#sources#ternjs#sort = 0

" Enhance completion experience
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#manual_complete()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Run the current JS file after you save it.
noremap <leader>r :w<CR>:!node %<CR>

" Emmet configuration
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
