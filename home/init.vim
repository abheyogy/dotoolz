" ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
" My nvimrc
" Note to my-self: Use vim even after you die!
" Well nvim is sorta vim.
" ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

" ============================================================================
"		               General Configuration
" ============================================================================

filetype off     " For Plug ... not sure if this is needed for nVim!
filetype plugin indent on

" ============================================================================
"                             Vim Plug Plugin Manager
" ============================================================================
"
" Install Vim Plug: If not installed!
if empty(glob('$HOME/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install/Update various vim/nvim plugins.
call plug#begin()

  " Plugins that I definatly need ...
  " Which are quite well reviewed, learnt & configured
    Plug 'itchyny/lightline.vim'
    Plug 'tpope/vim-surround'
    Plug 'preservim/nerdtree'
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    Plug 'abheyogy/vim-colors-solarized'
    Plug 'vim-syntastic/syntastic'

  " Language support
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

  " TODO(abheyogy): Customize usage and shortcuts
    Plug 'dense-analysis/ale'
    Plug 'ggreer/the_silver_searcher'
    Plug 'rust-lang/rust.vim'
    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'rainerborene/vim-timetap'
    Plug 'vim-scripts/StripWhiteSpaces'
    Plug 'alvan/closetag.vim'
    Plug 'reinh/vim-makegreen'
    Plug 'rking/ag.vim'
    Plug 'mileszs/ack.vim'
    Plug 'shougo/unite.vim'
    Plug 'myusuf3/numbers.vim'
    Plug 'davidhalter/jedi-vim'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'Rykka/riv.vim'
    Plug 'vim-scripts/bash-support.vim'
    Plug 'vim-scripts/autofold.vim'
    Plug 'Yggdroot/indentLine'

  " For Saltstack TODO(abheyogy): Review and update
    Plug 'saltstack/salt-vim'
    Plug 'stephpy/vim-yaml'
    Plug 'vim-scripts/jinja'
    Plug 'ctrlpvim/ctrlp.vim'

call plug#end()

" ============================================================================
"                     NeoVim Configuration & Customizations
" ============================================================================
"
" ----------------------------------------------------------------------------
"  General Configurations

syntax enable
set nocompatible
set background=light
set t_Co=256

" Load color theme if it exists.
  try
    colorscheme solarized
  catch
    colorscheme default
  endtry

filetype on
filetype plugin indent on

" Autoreload .vimrc/init.vim
  autocmd! bufwritepost init.vim source %

" Misc
  set timeoutlen=50
  set laststatus=2
  set showtabline=2
  set showmatch
  set backspace=indent,eol,start
  set noshowmode
  set showcmd
  set wildmenu
  set lazyredraw
  set spell
  set cursorline
  set foldlevelstart=10
  set foldlevel=5

" Undo stuff
  set history=7777
  set undolevels=555

" Formatting
  set nowrap            " Do not wrap long lines
  set autoindent        " Indent at the same level as previous line
  set expandtab         " Tabs are spaces not tabs
  set tabstop=4         " Indent every four columns
  set softtabstop=4     " Backspace deletes tabs
  set shiftwidth=2      " Shift by 2 spaces '>>/<<'
  set splitright	    " Vsplit defaults to right
  set splitbelow	    " Split defaults to bottom
  set pastetoggle=<F5>	" Toggle paste mode

" Searching
  set incsearch
  set hlsearch
  set ignorecase
  set smartcase
  set gdefault
  set incsearch
  set showmatch

" Buffers & Splits ...
" Fugitive, Gdiff, & more ... defaults to split vertically
set diffopt+=vertical

" Disable arrow keys
  nnoremap <up> <nop>
  nnoremap <down> <nop>
  nnoremap <left> <nop>
  nnoremap <right> <nop>
  nnoremap j gj
  nnoremap k gk

" Enable mouse
  set mouse=a           " Automatically enable mouse settings
  set mousehide         " Hide mouse cursor while typing

" Number Magik
" Ignore some numbers
  let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl', 'nerdtree']

" Ctags

  set tags=./tags;/,~/.vimtags

  " Make tags placed in .git/tags file available in all levels of a repository
  let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
  if gitroot != ''
    let &tags = &tags . ',' . gitroot . '/.git/tags'
  endif

" ----------------------------------------------------------------------------
"  Status Line Customizations

" Syntastic Related
"  set statusline+=%#warningmsg#
"  set statusline+=%{SyntasticStatuslineFlag()}
"  set statusline+=%*

" Gitgutter
"  function! GitStatus()
"    let [a,m,r] = GitGutterGetHunkSummary()
"    return printf('+%d ~%d -%d', a, m, r)
"  endfunction
"  set statusline+=%{GitStatus()}

" ============================================================================
" 				Plugin Customizations
" ============================================================================
"
" The Leader Key!
  let mapleader=','
  set timeoutlen=1500   " Default timeout is too short or at least was ...

" ----------------------------------------------------------------------------
" Customize Key bindings

  " Gitgutter toggle
    noremap <leader>gg :GitGutterToggle<CR>
    noremap <leader>GG :GitGutterLineHighlightsToggle<CR>

  " Misc
    map <C-n> :NERDTreeToggle<CR>	" NerdTree
    noremap <leader>e :quit<CR>   " Quit current window
    noremap <leader>E :qa<CR>    " Quit all windows
    noremap <leader>w :w<CR>      " Quick save
    noremap <leader>W :wq<CR>     " Save and quit

  " Code folding options
    nmap <leader>f0 :set foldlevel=0<CR>
    nmap <leader>f1 :set foldlevel=1<CR>
    nmap <leader>f2 :set foldlevel=2<CR>
    nmap <leader>f3 :set foldlevel=3<CR>
    nmap <leader>f4 :set foldlevel=4<CR>
    nmap <leader>f5 :set foldlevel=5<CR>
    nmap <leader>f6 :set foldlevel=6<CR>
    nmap <leader>f7 :set foldlevel=7<CR>
    nmap <leader>f8 :set foldlevel=8<CR>
    nmap <leader>f9 :set foldlevel=9<CR>

  " Space to open/close folds
    nnoremap <space> za

  " Find merge conflict markers
    map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

  " Shifting does not exit Visual Mode
    vnoremap < <gv
    vnoremap > >gv

  " Write in SUDO mode
    cmap w!! w !sudo tee % >/dev/null

  " Numbers magik
  " Set number mode keymapbindings
    set number
    nnoremap <Leader>n :NumbersToggle<CR>

  " CtrlP command to invoke
    let g:ctrlp_map = '<c-p>'

  " Fugitive ::::: Git O Vim
    nnoremap <silent> <leader>gs :Gstatus<CR>
    nnoremap <silent> <leader>gd :Gdiff<CR>
    nnoremap <silent> <leader>gc :Gcommit<CR>
    nnoremap <silent> <leader>gb :Gblame<CR>
    nnoremap <silent> <leader>gl :Glog<CR>
    nnoremap <silent> <leader>gp :Git push<CR>
    nnoremap <silent> <leader>gr :Gread<CR>
    nnoremap <silent> <leader>gw :Gwrite<CR>
    nnoremap <silent> <leader>ge :Gedit<CR>
    nnoremap <silent> <leader>gi :Git add -p%<CR>

" ----------------------------------------------------------------------------
" Customize plugin behaviour

" NerdTree
  let g:NERDTreeDirArrowExpandable = '▸'
  let g:NERDTreeDirArrowCollapsible = '▾'

" Settings for ctrlp
  let g:ctrlp_cmd = 'CtrlP'
  let g:ctrlp_max_height = 30

  " Exclude Files & Directories
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX
    set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
    set wildignore+=*.pyc
    set wildignore+=*_build/*
    set wildignore+=*/coverage/*

    let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
    let g:ctrlp_custom_ignore = {
        \ 'dir':  '\v[\/]\.(git|hg|svn)$',
        \ 'file': '\v\.(exe|so|dll)$',
        \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
        \ }

" Syntastic
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
  let g:syntastic_aggregate_errors = 1

" TODO(abheyogy): Add more languages
" Programming Languages
  let g:syntastic_python_checkers = ['pylint']
  let g:syntastic_sh_checkers = ['shfmt']
  let g:syntastic_zsh_checkers = ['zsh']

" Configuration Files
  let g:syntastic_haml_checkers = ['haml', 'haml_lint']
  let g:syntastic_json_checkers = ['jsonlint', 'jsonval']
  let g:syntastic_markdown_checkers = ['mdl', 'proselint', 'textlint']
  let g:syntastic_rst_checkers = ['proselint', 'rst2pseudoxml', 'rstcheck', 'sphinx']
  let g:syntastic_yaml_checkers = ['yamllint', 'yamlxs']

  let g:syntastic_aggregate_errors = 1
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 0
  let g:syntastic_check_on_wq = 1

" SaltStack
  let g:sls_use_jinja_syntax = 1

" LightLine
  set laststatus=2
  set noshowmode
  let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'fileformat': 'LightlineFileformat',
      \   'filetype': 'LightlineFiletype'
      \ },
      \ }

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

" GitGutter
  set foldtext=gitgutter#fold#foldtext()
  let g:gitgutter_realtime = 0              " Maybe Default ...
  let g:gitgutter_eager = 0
  let g:gitgutter_escape_grep = 1
  let g:gitgutter_enabled = 1
  let g:gitgutter_signs = 1
  let g:gitgutter_highlight_lines = 1
  let g:gitgutter_highlight_linenrs = 1

" =============================================================================
"                      ::::::: End of my VIMRC/NVIMRC :::::::
"
"                        Am I alive or dead I dont know,
"                              neither do I care,
"                          as long as I have vim ...
"                          and its running on linux!
"
"                               ~ Abheyogy
"  ============================================================================
