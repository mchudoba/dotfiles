"--------------------------------------------------
" vim-plug configuration
"--------------------------------------------------

call plug#begin('~/.vim/plugged')

" File explorer
Plug 'scrooloose/nerdtree'

" Comment functions
Plug 'scrooloose/nerdcommenter'

" Git wrapper
Plug 'tpope/vim-fugitive'

" Git gutter diffs
Plug 'airblade/vim-gitgutter'

" Indentation detector
Plug 'tpope/vim-sleuth'

" Automatically complete brackets, parentheses, etc.
Plug 'jiangmiao/auto-pairs'

" Status line customization
Plug 'itchyny/lightline.vim'

call plug#end()
