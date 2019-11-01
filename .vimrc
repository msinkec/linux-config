" Source file with custom functions
source $HOME/.vimfunc

" filetype plugin indent on

" Display line numbers
set nu

" Show existing tab with 4 spaces width
set tabstop=4
" When indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" Disable yanking again, if pasting
xnoremap p pgvy

" Syntax highlighting
syn on

" Enable hidden buffers, to avoid writing on bufer swap
set hidden

" Tab, Shift+Tab for buffer switching
nnoremap  <silent>   <tab>  :bn<CR>
nnoremap  <silent> <s-tab>  :bp<CR>

" Change omni-completion popup colors
highlight Pmenu ctermbg=darkgray guibg=darkgray ctermfg=white guifg=white
highlight PmenuSel ctermbg=darkblue guibg=darkblue ctermfg=white guifg=white
highlight PmenuSbar ctermbg=blue guibg=blue
highlight PmenuThumb ctermbg=gray guibg=gray
