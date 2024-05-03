call plug#begin()
    Plug 'neoclide/coc.nvim' , {'branch': 'release'}
    Plug 'tmsvg/pear-tree'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'lervag/vimtex'
    Plug 'rebelot/kanagawa.nvim'
    Plug 'xiyaowong/transparent.nvim'
    Plug 'NLKNguyen/papercolor-theme'
call plug#end()

syntax enable
set number 	" line numbers
set showmatch 	" shows matching
set mouse=v	" middle click paste
set cursorline	" highlight current cursourline
syntax on	" syntax highlighting
set mouse=a	" enable mouse navigation
set autoindent	" insert newline at same indention
"set spell	" spellchecking
set ttyfast	" faster scrolling
set wildmenu
set wildmode=longest,list
set autoindent expandtab tabstop=4 shiftwidth=4
set noshowmode
colorscheme kanagawa-dragon
inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<C-g>u\<TAB>"

inoremap <c-b> <Esc>:NERDTreeToggle<cr>
nnoremap <c-b> <Esc>:NERDTreeToggle<cr>

let g:airline_theme='wombat'
let g:airline_powerline_fonts = 1
let g:vimtex_quickfix_enabled = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:vimtex_quickfix_ignore_filters = [
      \ 'Underfull',
      \ 'Overfull',
      \ 'Warning',
      \]
