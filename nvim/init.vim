call plug#begin('~/.local/share/nvim/plugged')
	Plug 'chrisbra/matchit'
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
	Plug 'sawdog/matchit'
	Plug 'sheerun/vim-polyglot'
	Plug 'w0rp/ale'
call plug#end()

set rtp+=/Users/fespiau/homebrew/opt/fzf

" Display line number at beginning of lines
set number

" 'tabstop' tab column width
" 'shiftwidth' column width for << and >> 
" 'smarttab' use 'shiftwidth' for beginning of line, otherwise 'tabstop'
set tabstop=2 shiftwidth=2 smarttab

" 'autoindent' apply current line indent to next
" 'smartindent' adapts to current code
set autoindent smartindent

" Set the max allowed width of a line
set textwidth=0

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

set ruler	" show the cursor position all the time
set showcmd	" display incomplete commands

" Search
set incsearch " incremental search
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

set nrformats-=octal " don't recognize octal for <C-A> and <C-X>

set synmaxcol=500 " improve performance with long lines

set laststatus=2	" always display status line
set ruler	" enable ruler (status bar) all the time

" autocompletion
set wildmenu " Enable menu at bottom of vim
set wildmode=longest:full,full " autocomplete longest command, then everything
set complete-=i	" Look for completions in current buffer, other windows buffers, other loader buffers, unloaded buffers and tags
set wildcharm=<C-z>	" activate completion with <C-z>
set wildignorecase

"" mouse
set mouse=a

"" Cursor
set scrolloff=5	" show 5 lines above or below cursor
set sidescrolloff=5

"" Last line
set display+=lastline

"" Trailing chars
set list
set listchars=tab:→\ ,trail:•,extends:⟩,precedes:⟨,nbsp:␣

set autoread " detect changes in file outside vim

" keep data between sessions
set viminfo^=!

" don't save options between sessions and view
set sessionoptions-=options
set viewoptions-=options

" mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Undo sequence: everything done between entering Insert mode and exiting it
" In insert mode, <C-U> deletes from cursor to beginning of line
" In insert mode, <C-G>u breaks the Undo sequence (starts a new one)
"
" This allows you to undo <C-U> without impacting the previous Undos
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <C-W> <C-G>u<C-W>	" prevent accidental <C-W>
inoremap <C-U> <C-G>u<C-U>	" prevent accidental <C-U>

map Q gq " disable Ex mode

augroup vimStartup
	au!

	" When editing a file, always jump to the last known cursor position.
	" Don't do it when the position is invalid, when inside an event handler
	" (happens when dropping a file on gvim) and for a commit message (it's
	" likely a different one than last time).
	autocmd BufReadPost *
		\ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
		\ |   exe "normal! g`\""
		\ | endif

augroup END
