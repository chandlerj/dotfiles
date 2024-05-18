call plug#begin()

    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'tmsvg/pear-tree',
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'preservim/nerdtree'
    Plug 'lervag/vimtex'
    Plug 'pangloss/vim-javascript'
    Plug 'rebelot/kanagawa.nvim'
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
set tabstop=4
set shiftwidth=4
set expandtab	" spaces instead of tabs 
set noshowmode
colorscheme default
inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<C-g>u\<TAB>"
inoremap <c-b> <Esc>:NERDTreeToggle<cr>
nnoremap <c-b> <Esc>:NERDTreeToggle<cr>
let g:airline_powerline_fonts = 0
let g:airline_theme = 'wombat'
let g:vimtex_quickfix_enabled = 1
let g:vimtex_quickfix_ignore_filters = [
            \ 'Underfull',
            \ 'Overfull',
            \ 'Warning',
            \]


" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

