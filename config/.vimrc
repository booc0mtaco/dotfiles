" More settings at http://vimdoc.sourceforge.net/htmldoc/options.html
syntax on

" Line numbers
set number

" Set mouse in all modes
set mouse=a

" highlight dynamically as search pattern is typed
set incsearch

" when navigating searches, wrap to beginning or end of file 
set wrapscan

" ignore case in searches (except when using capital letters)
set ignorecase
set smartcase

" add cues for errors
set errorbells
set visualbell

" add indentation intelligently (preserve indent when file type unrecognized)
set autoindent
set smartindent

" highlight current line & cursor
set cursorline
set ruler

" always show status line (?)
set laststatus=2

" Show the filename in the titlebar
set title

" indentation rules (use four spaces)
set expandtab
set softtabstop=4
set shiftwidth=4
set smarttab

" don't wrap line (show that line is long using '+++'
set nowrap
set showbreak=+++

" maximum line width of input (0 to disable)
set textwidth=100

" briefly match bracket if visible on screen
set showmatch

" maximum number of changes that can be undone
set undolevels=1000

" Set when backspacing can collapse things
set backspace=indent,eol,start

" Set directory for vim to use (backup, locks, etc.)
set dir=~/.cache/vim

