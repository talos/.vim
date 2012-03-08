" Pathogen https://github.com/tpope/vim-pathogen
call pathogen#infect() " For some reason, this doesn't work unless executed
                       " from .vimrc .  For that reason, this file should be
                       " symlinked there.

" I <3 color
syntax on

" Trailing whitespace bad.
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Civilized tabs
set softtabstop=4 shiftwidth=4 expandtab

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
set clipboard=unnamed

" emacs-like case sensitivity for searches
set ignorecase
set smartcase

" indentation
filetype plugin indent on

" Thanks to http://dancingpenguinsoflight.com/2009/02/python-and-vim-make-your-own-ide/
autocmd FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,(

colorscheme ron 
