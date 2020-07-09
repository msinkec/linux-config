set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" Use system clipboard
set clipboard+=unnamedplus

" Set vertical bar style (not part of Airline)
set fillchars+=vert:\│
hi VertSplit ctermfg=Black ctermbg=DarkGray

" Set Python path
let g:python3_host_prog = '/usr/bin/python3'

"""""""""""""""""""" PLUGINS (vim-plug)""""""""""""""""""""""""
" Install vim-plug if it's not found
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !sh -c 'curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync
endif

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

" Asynchronous completion framework for Nvim
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Python autocompletion
" Needs 'pip install pynvim jedi'
"Plug 'davidhalter/jedi-vim'
Plug 'deoplete-plugins/deoplete-jedi'

" Go deoplete autocompletion
" Requires 'gocode' completion engine to be in PATH
" go get -u github.com/nsf/gocode
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}

" Some dark colorscheme
"Plug 'msinkec/Apprentice'
Plug 'nanotech/jellybeans.vim'
let g:jellybeans_use_term_italics = 1

" Code formater
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Initialize plugin system
call plug#end()


"""""""""""""""""" PLUGIN CONFIGURATION """"""""""""""""""""""

" Use deoplete.
let g:deoplete#enable_at_startup = 1
" Enable deoplete when InsertEnter.
let g:deoplete#enable_at_startup = 0
autocmd InsertEnter * call deoplete#enable()

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
colorscheme jellybeans

" Set hotkey for GFiles command of fzf
nnoremap <C-p> :GFiles<CR>
