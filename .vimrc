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

" Tab, Shift+Tab for buffer switching
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR><Paste>

" Change omni-completion popup colors
highlight Pmenu ctermbg=darkgray guibg=darkgray ctermfg=white guifg=white
highlight PmenuSel ctermbg=darkblue guibg=darkblue ctermfg=white guifg=white
highlight PmenuSbar ctermbg=blue guibg=blue
highlight PmenuThumb ctermbg=gray guibg=gray
