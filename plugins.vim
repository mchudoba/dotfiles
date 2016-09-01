"--------------------------------------------------
" vim-plug configuration
"--------------------------------------------------

call plug#begin('~/.vim/plugged')

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Git wrapper
Plug 'tpope/vim-fugitive'

" Git gutter diffs
Plug 'airblade/vim-gitgutter'

" File system navigator
Plug 'scrooloose/nerdtree'

" Indentation detector
Plug 'tpope/vim-sleuth'

" Automatically complete brackets, parentheses, etc.
Plug 'jiangmiao/auto-pairs'

" Navigate between vim and tmux panes easily
Plug 'christoomey/vim-tmux-navigator'

call plug#end()
