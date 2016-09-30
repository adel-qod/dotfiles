" I am actually overriding the vimrc file that's supplied by default with vim
" that's installed in Ubuntu :) Enjoy!
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below. If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed. It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

"
"" Strip trailing whitespace.
"
autocmd BufWritePre * :%s/\s\+$//e

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'. Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.

" Search-related:
set showmatch	" Shortly jumps to matching bracket when you type one.
set hlsearch	" I've inserted this one to highlight search
set incsearch	" Incremental search (search right when I type)

" Look & bars related:
set title " Shows the file title in the terminal screen
set showcmd	" Show (partial) command in status line.

" Indentation & tabs related:
set smartindent	" Auto indents!! Awesome stuff!
set tabstop=2	" Pressing tab causes 4 spaces not 8
"Without expandtab, tabs will APPEAR as 4 spaces in vim but in reality they're
"normal tabs so .. not good; we want things to appear exactly as they truly are
set expandtab	" Insert spaces whenever tab button is pressed
set shiftwidth=2	" Number of spaces used in auto indent

" Screen width related:
set textwidth=79 " Set the text width to 79 at max
set formatoptions+=t " Add the text width to the format options for text
set formatoptions+=c " and for comment lines
set nowrap " Disables wrapping long lines
set ignorecase " Ignore case when searching
set smartcase " Ignore case when searching if input is all small

" Backups & swap files related:
set nobackup " Don't allow vim to auto backup (git ftw;) )
set noswapfile " Don't allow vim to create .swp (another git ftw ;) )

" Programmer's convenience related:
" Map ; to : so I can enter enter the command-line mode without pressing shift
noremap ; :
" you need +xterm_clipboard to show with vim --version for the next one to work
set clipboard=unnamedplus " Use the system clipboard (for copy/cut/paste)
" Allows multiple moves of selected text using the < and > keys
" The > and < moves are exactly like the tab
vnoremap < <gv
vnoremap > >gv

" Folding
set foldmethod=manual " allows for manual text folding and unfolding
set autowrite	" Auto save before commands like :next and :make
autocmd BufWinLeave *.* mkview! " auto save folds
autocmd BufWinEnter *.* silent loadview " auto load folds
" Not used by me:

"set hidden " Hide buffers when they are abandoned
"set mouse=a " Enable mouse usage (all modes)

" Let vim wrap cursor movement:
set whichwrap+=<,>,h,l,[,]

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
