""""""""""""""""""""""""""""""""" DEFAULT `vimrc` FILE """""""""""""""""""""""""""""""""""
" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
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
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
filetype plugin indent on

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
""""""""""""""""""""""""""""""""" DEFAULT `vimrc` FILE """""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""" MY ADDITIONS """""""""""""""""""""""""""""""""""""""""""
""""pathogen package manager"""
execute pathogen#infect()

"enable spell check (type `zg/zug'over selected work to add/remove from
"dictionary, type `z=' to see suggested words
set spell
set spelllang=en_us

"""VIMTEX"""
"This is necessary for VimTeX to load properly
filetype plugin indent on

"""pattern search set to incremental search that highlights all matches"""
set is hls

"""ultisnips"""
let g:UltiSnipsExpandTrigger       = '<Tab>'    " use Tab to expand snippets
let g:UltiSnipsJumpForwardTrigger  = '<Tab>'    " use Tab to move forward through tabstops
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'  " use Shift-Tab to move backward through tabstops
let g:UltiSnipsSnippetDirectories=[$HOME."/.vim/UltiSnips"] " add UltiSnips to vim runtime path 

" Add Julia filetype detection if it's not working automatically
au BufRead,BufNewFile *.jl set filetype=julia
runtime macros/matchit.vim

"YAML indentation"
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

"c++ indentation"
autocmd FileType cpp,hpp setlocal ts=2 sts=2 sw=2

"relative line number"
set relativenumber

"absolute line number"
"set number
