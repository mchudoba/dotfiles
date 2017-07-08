"--------------------------------------------------
" vim-plug configuration
"--------------------------------------------------

call plug#begin('~/.vim/plugged')


" Git wrapper
Plug 'tpope/vim-fugitive'

" Git gutter diffs
Plug 'airblade/vim-gitgutter'

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

" Comment functions
Plug 'scrooloose/nerdcommenter'

" Emmet integration
Plug 'mattn/emmet-vim'

" Status line customization
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" HTML tag matcher (use % to navigate)
Plug 'tmhedberg/matchit'

call plug#end()
