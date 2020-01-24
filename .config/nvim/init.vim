set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" Use system clipboard
set clipboard+=unnamedplus

" Set vertical bar style (not part of Airline)
set fillchars+=vert:\│
hi VertSplit ctermfg=Black ctermbg=DarkGray


"""""""""""""""""""" PLUGINS (vim-plug)""""""""""""""""""""""""

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Airline (custom status line and stuff)
Plug 'vim-airline/vim-airline'
" Airline themes
Plug 'vim-airline/vim-airline-themes'

" Fugitive Git wrapper
Plug 'tpope/vim-fugitive'

" Nerdtree file explorer
Plug 'scrooloose/nerdtree'

" Asynchronous completion framework for Nvim
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Python autocompletion
" Needs 'pip install pynvim jedi'
"Plug 'davidhalter/jedi-vim'
Plug 'deoplete-plugins/deoplete-jedi'

" Go deoplete autocompletion
" Requires 'gocode' completion engine to be in PATH
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}

" Some dark colorscheme
Plug 'msinkec/Apprentice'

" Code formater
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'

" Initialize plugin system
call plug#end()


"""""""""""""""""" PLUGIN CONFIGURATION """"""""""""""""""""""

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" Enable Airline buffer numbering
let g:airline#extensions#tabline#buffer_nr_show = 1

" Enable Airline tablines and define options
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
" Just show the filename (no path) in the tab
let g:airline#extensions#tabline#fnamemod = ':t'

" Set Airline theme
let g:airline_theme='term'

" Jedi automatically starts the completion if you type a dot, e.g. str.
" Disable it using this:
let g:jedi#popup_on_dot = 0

" Enable colorscheme
colorscheme apprentice
