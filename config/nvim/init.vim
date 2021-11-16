call plug#begin(stdpath('data') . '/plugged')
Plug 'andys8/vim-elm-syntax', { 'for': ['elm'] }
Plug 'ap/vim-buftabline'
Plug 'tomtom/tcomment_vim'
Plug 'itchyny/lightline.vim'
Plug 'josa42/nvim-lightline-lsp'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/file-line'
Plug 'vim-test/vim-test'
Plug 'FooSoft/vim-argwrap'
Plug 'cespare/vim-toml'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'gfanto/fzf-lsp.nvim'

" COLORS
Plug 'Rigellute/shades-of-purple.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'Zabanaa/neuromancer.vim'
Plug 'AlessandroYorba/Sierra'
Plug 'AlessandroYorba/Despacio'
Plug 'cocopon/iceberg.vim'
Plug 'dracula/vim'
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
Plug 'junegunn/seoul256.vim'
Plug 'joshdick/onedark.vim'

call plug#end()

syntax on
colorscheme gruvbox
set background=dark
set termguicolors

filetype plugin indent on
set autoindent
set backspace=indent,eol,start
set colorcolumn=80
set completeopt=menuone,noselect
set encoding=utf-8
set expandtab
set foldenable
set foldlevel=80
set foldmethod=marker
set foldopen=block,hor,mark,percent,quickfix,tag
set formatoptions-=or
set hidden
set history=10000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set matchtime=5
set mouse=
set nobackup
set noerrorbells
set noswapfile
set novisualbell
set nowrap
set nowritebackup
set nu
set ruler
set shiftwidth=2
set shortmess+=c
set showcmd
set showmatch
set smartcase
set smarttab
set softtabstop=2
set tabstop=2
set updatetime=300
set wildmenu
set wildmode=longest,list

au BufRead,BufNewFile {COMMIT_EDITMSG}                                         set ft=gitcommit
au BufRead,BufNewFile {Gemfile,Rakefile,Capfile,Guardfile,*.rake,config.ru}    set ft=ruby
autocmd FileType elm setlocal softtabstop=4 shiftwidth=4 expandtab
autocmd FileType rust setlocal softtabstop=4 shiftwidth=4 expandtab
autocmd FileType toml setlocal softtabstop=4 shiftwidth=4 expandtab

if executable('rg')
  let g:ackprg = 'rg --vimgrep --smart-case'
  set grepprg=rg\ --nogroup\ --nocolor\ -U
  let g:rg_derive_root='true'
endif

let g:buftabline_indicators = 1

let g:lightline = { 
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'absolutepath', 'modified', 'lsp_info', 'lsp_hints', 'lsp_errors', 'lsp_warnings', 'lsp_ok' ],
      \             [ 'lsp_status' ] ],
      \   'right': [ [ 'lineinfo', ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype'] ]
      \ },
      \ }

call lightline#lsp#register()

      " \ 'component_expand': {
      " \   'lsp_error'        : 'LightlineLspErrors',
      " \   'lsp_warning'      : 'LightlineLspWarnings',
      " \   'lsp_ok'           : 'LightlineLspOks',
      " \ },
      "
" let g:lightline.component_type = {
"       \   'lsp_error'        : 'error',
"       \   'lsp_warning'      : 'warning',
"       \   'lsp_ok'           : 'middle',
"       \ }

" function! s:lightline_coc_diagnostic(kind, sign) abort
"   let info = get(b:, 'coc_diagnostic_info', 0)
"   if empty(info) || get(info, a:kind, 0) == 0
"     return ''
"   endif
"   try
"     let s = g:coc_user_config['diagnostic'][a:sign . 'Sign']
"   catch
"     let s = ''
"   endtry
"   return printf('%s %d', s, info[a:kind])
" endfunction

" function! LightlineCocErrors() abort
"   return s:lightline_coc_diagnostic('error', 'error')
" endfunction
"
" function! LightlineCocWarnings() abort
"   return s:lightline_coc_diagnostic('warning', 'warning')
" endfunction
"
" function! LightlineCocInfos() abort
"   return s:lightline_coc_diagnostic('information', 'info')
" endfunction
"
" function! LightlineCocHints() abort
"   return s:lightline_coc_diagnostic('hints', 'hint')
" endfunction
"
" function! LightlineLspWarnings() abort
"   let count = 0
"   if luaeval('not vim.tbl_isempty(vim.lsp.buf_get_clients(0))') 
"     let count = luaeval('vim.lsp.diagnostic.get_count(0, [[Warning]])')
"   endif
"   return count == 0 ? '' : printf('%s:%d', 'W', count)
" endfunction
"
" function! LightlineLspErrors() abort
"   let count = 0
"   if luaeval('not vim.tbl_isempty(vim.lsp.buf_get_clients(0))') 
"     let count = luaeval('vim.lsp.diagnostic.get_count(0, [[Error]])')
"   endif
"   return count == 0 ? '' : printf('%s:%d', 'W', count)
" endfunction
"
" function! LightlineLspOks() abort
"   let l:counts =  lsp#get_buffer_diagnostics_counts()
"   let l:total = l:counts.error + l:counts.warning
"   let l:sign = get(g:, 'lightline_lsp_signs_ok', 'OK')
"   return l:total == 0 ? l:sign : ''
" endfunction

" autocmd User LspDiagnosticsChanged call lightline#update()

" set statusline^=

let $FZF_DEFAULT_COMMAND = 'fd --type f --hidden --follow --exclude .git'


let mapleader = " "

" buffer management
nmap <leader>w :w!<CR>
nmap <leader>qq :q<CR>
nmap <leader>q :bp\|bd #<CR>
map <c-p> :Files<CR>
map <c-t> :DocumentSymbols<CR>
map <leader>bs :WorkspaceSymbols<CR>
map <leader>. :DiagnosticsAll<CR>
map <leader>u :References<CR>
map <leader>bp :Buffers<CR>
nmap <Left> :bprev<CR>
nmap <Right> :bnext<CR>

" vim-test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>S :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" configuration
nmap <leader>ev :e ~/.config/nvim/init.vim<CR>
nmap <leader>zv :source ~/.config/nvim/init.vim<CR>

vmap gs :sort<CR>

" nmap <leader>r <Plug>(coc-rename)
" nmap <silent> <leader>s <Plug>(coc-fix-current)
" nmap <silent> <leader>S <Plug>(coc-codeaction)
" " nmap <silent> <leader>S <Plug>(coc-fix-current)
" " nmap <silent> <leader>s <Plug>(coc-codeaction-line)
" xmap <silent> <leader>s <Plug>(coc-codeaction-selected)
" nmap <silent> <leader>a <Plug>(coc-diagnostic-next)
" nmap <silent> <leader>A <Plug>(coc-diagnostic-next-error)
" nmap <silent> <leader>d <Plug>(coc-definition)
" nmap <silent> <leader>D <Plug>(coc-type-definition)
" nmap <silent> <leader>g :call CocAction('doHover')<CR>
" nmap <silent> <leader>G <Plug>(coc-diagnostic-info)
" nmap <silent> <leader>i <Plug>(coc-implementation)
" nmap <silent> <leader>u <Plug>(coc-references)
" nmap <silent> <leader>f :call CocActionAsync('format')<CR>
" nmap <silent> <leader>. :CocList diagnostics<CR>
"
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
" if has('nvim')
"   inoremap <silent><expr> <c-space> coc#refresh()
" else
"   inoremap <silent><expr> <c-@> coc#refresh()
" endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>
"
" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   elseif (coc#rpc#ready())
"     call CocActionAsync('doHover')
"   else
"     execute '!' . &keywordprg . " " . expand('<cword>')
"   endif
" endfunction

" nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
" nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
" inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
" inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

au BufWritePre *.elm lua vim.lsp.buf.formatting_sync({}, 1000)


lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>zwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>zwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>zwl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>l', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting_sync({}, 10000)<CR>", opts)

  print("Attached!")
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
vim.lsp.set_log_level("debug")

nvim_lsp.rust_analyzer.setup {
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  }
}

    -- trace = {
    --   server = "verbose",
    -- },
    -- onlyUpdateDiagnosticsOnSave = true

nvim_lsp.elmls.setup {
  on_attach = on_attach,
  init_options = {
    elmReviewDiagnostics = "warning",
  },
  flags = {
    debounce_text_changes = 150,
  }
}

nvim_lsp.solargraph.setup {
  -- cmd = { "solargraph", "stdio" },
  -- filetypes = { "ruby" },
  flags = { debounce_text_changes = 400, },
  on_attach = on_attach,
  -- handlers = {
  --   ["textDocument/publishDiagnostics"] = vim.lsp.with(
  --     vim.lsp.diagnostic.on_publish_diagnostics, {
  --       -- Disable virtual_text on file load
  --       -- Show with vim.lsp.diagnostic.show_line_diagnostics()
  --       virtual_text = false
  --     }
  --   ),
  -- },
}

-- nvim_lsp.solargraph.setup {
--   on_attach = on_attach,
--   flags = {
--     debounce_text_changes = 150,
--   },
--   settings = {
--     solargraph = {
--       diagnostics = true,
--       formatting = true,
--     }
--   }
-- }

require'compe'.setup {
  enabled = true;
  autocomplete = false;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 300;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    -- vsnip = true;
    -- ultisnips = true;
    -- luasnip = true;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  -- elseif vim.fn['vsnip#available'](1) == 1 then
  --   return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  -- elseif vim.fn['vsnip#jumpable'](-1) == 1 then
  --   return t "<Plug>(vsnip-jump-prev)"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
EOF
