set nocompatible
filetype off

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')
" Utility
Plug 'tomtom/tcomment_vim'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-endwise'
Plug 'kana/vim-textobj-user'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
Plug 'ingydotnet/yaml-vim'
Plug 'janko-m/vim-test'
Plug 'benmills/vimux'

" Colors :)
Plug 'Zabanaa/neuromancer.vim'
Plug 'AlessandroYorba/Sierra'
Plug 'AlessandroYorba/Despacio'
Plug 'cocopon/iceberg.vim'
Plug 'dracula/vim'
Plug 'znake/znake-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'morhetz/gruvbox'
Plug 'whatyouhide/vim-gotham'
Plug 'sjl/badwolf'
Plug 'nowk/genericdc'
Plug 'jordwalke/flatlandia'
Plug 'effkay/argonaut.vim'
Plug 'fcpg/vim-fahrenheit'
Plug 'jacoborus/tender.vim'
Plug 'alessandroyorba/alduin'
Plug 'xero/sourcerer.vim'
Plug 'blackgate/tropikos-vim-theme'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'marciomazza/vim-brogrammer-theme'

" Git
Plug 'tpope/vim-fugitive'

" Ruby / Rails
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rbenv'
Plug 'thoughtbot/vim-rspec'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'ngmy/vim-rubocop'
Plug 'jgdavey/tslime.vim'
Plug 'vim-ruby/vim-ruby'

" Javascript
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'walm/jshint.vim'
Plug 'vim-scripts/jQuery'
Plug 'mxw/vim-jsx'

" Clojure
" Plug 'guns/vim-clojure-static'

" Haskell
Plug 'dag/vim2hs'

" Go
Plug 'fatih/vim-go'

" Rust
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'

" Elixir
Plug 'elixir-lang/vim-elixir'

" Elm
Plug 'elmcast/elm-vim'

" Pony
Plug 'dleonard0/pony-vim-syntax'

" AIRLINE
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/repeat.vim'
Plug 'vim-scripts/file-line'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ' '
au BufRead,BufNewFile {COMMIT_EDITMSG}                                         set ft=gitcommit
au BufRead,BufNewFile {Gemfile,Rakefile,Capfile,Guardfile,*.rake,config.ru}    set ft=ruby
set termguicolors
set background=dark
let g:gruvbox_contrast_dark='soft'
colorscheme dracula
filetype plugin indent on
set autoindent
set backspace=indent,eol,start
set colorcolumn=80
set encoding=utf-8
set expandtab
set foldenable
set foldlevel=100
set foldmethod=marker
set foldopen=block,hor,mark,percent,quickfix,tag
set formatoptions-=or
set hidden
set history=10000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set matchtime=5
set mouse=
set nobackup
set noerrorbells
set noswapfile
set novisualbell
set nowrap
set nu
set ruler
set shiftwidth=2
set showcmd
set showmatch
set smartcase
set smarttab
set softtabstop=2
set tabstop=2
set textwidth=100
set wildmenu
set wildmode=longest,list
syntax on

" Start Interactive EasyAlign in visual mode
vmap <ENTER> <Plug>(EasyAlign)
" Start Interactive EasyAlign with a Vim movement
nmap <leader>a <Plug>(EasyAlign)

vmap ç :!pbcopy \| pbpaste<cr>

nmap <leader>rw :%s/\s\+$//<cr>

let g:bufferline_echo = 0

" Fast saving
nmap <leader>w :w!<cr>

" Fast vim closing
nnoremap <leader>qq :q<cr>

" Switch back to previous file
nnoremap <leader><leader> <c-^>

" Window navigation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
imap <c-c> <esc>

" Clear the search buffer when hitting return
function! MapCR()
  nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()

" Contextual tab key
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

let test#strategy = 'vimux'
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case'
  cnoreabbrev ag Ack
  cnoreabbrev aG Ack
  cnoreabbrev Ag Ack
  cnoreabbrev AG Ack
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor\ -U
endif

" Airline settings

let g:airline_theme="dracula"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'
map <c-p> :FZF<CR>
map <leader>bp :Buffers<CR>
nmap <Left> :bprev<CR>
nmap <Right> :bnext<CR>

" Fast buffer closing
nmap <leader>q :bp\|bd #<CR>

" edit .vimrc
nmap <leader>ev :e ~/.config/nvim/init.vim<CR>
nmap <leader>zv :source ~/.config/nvim/init.vim<CR>

" GitGutter

let g:gitgutter_override_sign_column_highlight = 0

" Fugitive

nmap <leader>gs :Gstatus<CR>
nmap <leader>gc :Gcommit<CR>

" JSX

let g:jsx_ext_required = 0

" Rubocop
" let g:vimrubocop_config = '~/.rubocop.yml'

" Elm
autocmd FileType elm setlocal shiftwidth=4 tabstop=4

let g:elm_setup_keybindings = 0
let g:elm_format_autosave = 1

autocmd FileType rust setlocal shiftwidth=4 tabstop=4
let g:rustfmt_autosave = 1

