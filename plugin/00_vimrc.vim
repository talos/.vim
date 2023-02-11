colorscheme default

" Pathogen https://github.com/tpope/vim-pathogen
""" Pathogen
"filetype off                " disable filetype, pathogen needs this
"call pathogen#runtime_append_all_bundles()
filetype on                 " enable filetype detection
filetype plugin on          " enable plugin loading
filetype plugin indent on   " enable indentation loading
call pathogen#infect() " For some reason, this doesn't work unless executed
                       " from .vimrc .  For that reason, this file should be
                       " symlinked there.

" 100% swiped from
" https://github.com/omab/dotfiles/blob/45115b917c01b993a7782416b5223f0111cce6cf/.vimrc
set nocompatible             " vi is quite old, ok?
set title                    " set term title
set modelines=2              " avoid some security issues
set ruler                    " show cursor position
set showmode                 " show current mode
set showcmd                  " show command in status line
set encoding=utf-8           " default encoding
set laststatus=2             " always show status line
set showmatch                " show matching brackets
set wildmenu                 " improved completion option showing
set wildmode=full            " display list of possible completions
set autowrite                " save before switching buffers
" set cryptmethod=blowfish     " crypt algorithm
set wrap                     " wrap text at the end
set textwidth=79             " default textwidth
set formatoptions=qrn1       " auto formating options see fo-table
set backupdir=$HOME/.vim/backups " set backup files here
set directory=$HOME/.vim/backups " set swap files here
set gdefault                 " global sustitution by default
set completeopt=menuone,longest,preview " completion menu style

" I <3 color
syntax on

" Civilized tabs
set softtabstop=2 shiftwidth=2 expandtab

" Tabs--
" Set some nice character listings, then activate list
" execute 'set listchars+=tab:\ ' . nr2char(187)
" execute 'set listchars+=eol:' . nr2char(183)
set list
set listchars=tab:>-

" 80 columns++, courtesy http://stackoverflow.com/questions/235439/vim-80-column-layout-concerns
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" Share clipboard with OSX
" set clipboard=unnamed

" emacs-like case sensitivity for searches
set ignorecase
set smartcase

" indentation
filetype plugin indent on

" Thanks to http://dancingpenguinsoflight.com/2009/02/python-and-vim-make-your-own-ide/
autocmd FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,(

" Trailing whitespace bad.
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" let g:syntastic_javascript_checkers = ['jsxhint']
" let g:syntastic_javascript_jsxhint_args = '--config ~/.vim/plugin/hintrc.js'
" let g:syntastic_python_checkers = ['pyflakes', 'pylint', 'pep8']
" let g:syntastic_bash_checkers = ['bash -n']
" let g:syntastic_java_javac_config_file_enabled = 1
" let g:syntastic_html_checkers = ['tidy']

" set iskeyword=48-57,192-255

" ctrl-a is used by tmux, have ctrl-i increment instead. ctrl-x still decrements
nnoremap <C-i> <C-a>

" typescript -- will need installed globally, `npm -g install typescript`
" let g:tsuquyomi_disable_quickfix = 1
" let g:syntastic_typescript_checkers = ['tsuquyomi', 'eslint'] " You shouldn't use 'tsc' checker.
" let g:syntastic_typescript_checkers = [] " You shouldn't use 'tsc' checker.
" let g:syntastic_typescriptreact_checkers = ['tsuquyomi', 'eslint'] " You shouldn't use 'tsc' checker.

" options for local vimrc (https://github.com/embear/vim-localvimrc)
let g:localvimrc_whitelist = ['/Users/[^/]*/proj/[^/]*/.*']
let g:localvimrc_sandbox = 0
let g:localvimrc_name = ['.lvimrc']

" capitalization shortcuts (http://vim.wikia.com/wiki/Capitalize_words_and_regions_easily)
if (&tildeop)
  nmap gcw guw~l
  nmap gcW guW~l
  nmap gciw guiw~l
  nmap gciW guiW~l
  nmap gcis guis~l
  nmap gc$ gu$~l
  nmap gcgc guu~l
  nmap gcc guu~l
  vmap gc gu~l
else
  nmap gcw guw~h
  nmap gcW guW~h
  nmap gciw guiw~h
  nmap gciW guiW~h
  nmap gcis guis~h
  nmap gc$ gu$~h
  nmap gcgc guu~h
  nmap gcc guu~h
  vmap gc gu~h
endif

" Left align CSV display (https://github.com/chrisbra/csv.vim)
let csv_table_leftalign=1
