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

" Automatically end certain structures (add end after if in Ruby, for example)
Plug 'tpope/vim-endwise'

" Navigate between vim and tmux panes easily
Plug 'christoomey/vim-tmux-navigator'

" Ruby support
Plug 'vim-ruby/vim-ruby'

" Ruby on Rails plugin
Plug 'tpope/vim-rails'

" Ruby bundler support
Plug 'tpope/vim-bundler'

" Tag file manager with automatic generation
Plug 'ludovicchabant/vim-gutentags'

" Syntax checking
Plug 'scrooloose/syntastic'

call plug#end()
