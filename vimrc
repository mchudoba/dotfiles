"--------------------------------------------------
" Configuration
"--------------------------------------------------

" Installs vim-plug if missing
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Not compatible with vi
set nocompatible
filetype plugin indent on

" vim-plug plugin setup
source ~/dev/dotfiles/plugins.vim

" Set text encoding
set encoding=utf-8

" Redraws vim faster
set ttyfast

" Time (in ms) that vim refreshes swapfile (also helps plugin refreshing)
set updatetime=250

" Open new split pnaes to the right
set splitbelow
set splitright

" Change directory to currently active buffer
set autochdir

"--------------------------------------------------
" Visual options
"--------------------------------------------------

" Display line numbers on the left
set number

" Uncomment to default relative numbers
" set relativenumber

" Calls function to toggle relative numbers (Ctrl+n)
nnoremap <C-n> :set relativenumber!<CR>

" Toggles relative numbers on insert
" autocmd InsertEnter * :set norelativenumber
" autocmd InsertLeave * :set relativenumber

" Use syntax highlighting.
syntax on

" Set colorscheme (~/.vim/colors/)
colorscheme lena

" Fix GitGutter
highlight GitGutterAdd            ctermbg=NONE ctermfg=2
highlight GitGutterChange         ctermbg=NONE ctermfg=3
highlight GitGutterDelete         ctermbg=NONE ctermfg=1
highlight GitGutterChangeDelete   ctermbg=NONE ctermfg=3

" Highlight searches (use <C-L> to temporarily turn off highlighting)
set hlsearch

" Search as characters are entered
set incsearch

" Always display the status line, even if only one window is displayed.
set laststatus=2

" Show extra white space characters
set list listchars=tab:»·,trail:·,nbsp:·

" Highlight matching parantheses, brackets, etc.
set showmatch

" Highlight currnet line.
set cursorline

" Highlight trailing spaces in annoying red
highlight ExtraWhitespace ctermbg=1 guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

"--------------------------------------------------
" Usability options
"--------------------------------------------------

" Allows re-use of the same window and switch from an unsaved
" buffer without saving it first
set hidden

" Better command-line completion
set wildmenu

" Use the system clipboard
set clipboard=unnamed

" Show partial commands in the last line of the screen
set showcmd

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" When opening a new line and no filetype-specific indenting is
" enabled, keep the same indent as the line you're currently on.
set autoindent

" Stop certain movements from always going to the first character
" of a line.
set nostartofline

" Display the cursor position on the last line of the screen or in
" the status line of a window.
set ruler

" Instead of failing a command because of unsaved changes, raise a
" dialogue asking if you wish to save changed files.
set confirm

" Disable visual bell
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of
" having to 'press <Enter> to confinue'
set cmdheight=2

" Quickly time out on keycodes, but never time out on mappings.
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

" Move backup and swap files to a directory.
set backup
set backupdir=~/.vim/backup//
set directory=~/.vim/backup//

" Detect when a file is changed (not automatic; any command must be run)
set autoread

" Always leave this amount of space between cursor and bottom/top of screen
set scrolloff=5

" HTML bracket matching (with %)
set matchpairs+=<:>

" Automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Backspace options
set backspace=indent,eol,start

"--------------------------------------------------
" Key mappings
"--------------------------------------------------

" Map <space> to leader key (this way the leader shows in the corner)
map <SPACE> <Leader>

" Moving up and down when lines are wrapped
nnoremap <silent> j gj
nnoremap <silent> k gk

" Save file
nnoremap <Leader>w :w<CR>

" Toggle NERDTree
nmap <silent> <Leader>n :NERDTreeToggle<CR>

" Unmap F1 help
nmap <F1> <nop>
imap <F1> <nop>

" Stop highlight after search
nnoremap <silent> <Leader>, :noh<CR>

" Perform a fuzzy file search using FZF
nnoremap <Leader>s :FZF<CR>

" Map enter key to insert new lines without entering insert mode
nnoremap <CR> o<Esc>
" Fixes issues with above mapping
autocmd CmdwinEnter * nnoremap <CR> <CR>
autocmd BufReadPost quickfix nnoremap <CR> <CR>

" List buffers and prepare buffer switch command
nnoremap <Leader>B :ls<CR>:b<Space>

" Switch between last two buffers
nnoremap <Leader>b <C-^>

"--------------------------------------------------
" Indentation options
"--------------------------------------------------

" Indentation settings for using 2 spaces instead of tabs.
set smarttab
set expandtab
set tabstop=8
set shiftwidth=4
set softtabstop=4

"--------------------------------------------------
" Plugin options
"--------------------------------------------------

" NERDTree

" Open NERDTree when vim is opened
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" NERDCommenter

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Lightline

let g:lightline = {
      \ 'colorscheme': 'lena',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
