" A system vimrc (macOS ships one) may set skip_defaults_vim, which makes
" defaults.vim bail out on its first line. Clear it before sourcing.
unlet! skip_defaults_vim
runtime defaults.vim

silent! packadd! comment                       " gc / gcc / gC, plus ic / ac

if exists('+termguicolors') && $COLORTERM =~# 'truecolor\|24bit'
  set termguicolors
endif
silent! colorscheme habamax

set hlsearch hidden autoread autoindent
set number cursorline
set ignorecase smartcase
set clipboard=unnamed
set splitbelow splitright
set list listchars=tab:»·,trail:·,nbsp:␣
set laststatus=2

" Filetype plugins set indent per language; this is only the fallback.
set expandtab shiftwidth=4 softtabstop=4

" Vim writes undo files next to the edited file unless undodir is set, and it
" will not create the directory itself.
set undofile undodir=~/.vim/undo
call mkdir(expand('~/.vim/undo'), 'p')

let mapleader = " "
nnoremap <Leader>w :w<CR>
nnoremap <Leader>, :nohlsearch<CR>
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
