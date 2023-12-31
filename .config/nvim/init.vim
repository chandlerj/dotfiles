call plug#begin()
    Plug 'neoclide/coc.nvim' , {'branch': 'release'}
    Plug 'tmsvg/pear-tree'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'preservim/nerdtree'
    Plug 'lervag/vimtex'
call plug#end()

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


" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <c-b> <Esc>:NERDTreeToggle<cr>
nnoremap <c-b> <Esc>:NERDTreeToggle<cr>


syntax enable

" Note: You must define the dictionary first before setting values.
" Also, it's a good idea to check whether it exists as to avoid
" accidentally overwriting its contents.

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'
let g:airline_theme = 'ayu_dark'


" If you only see boxes here it may be because your system doesn't have
" the correct fonts. Try it in vim first and if that fails see the help
" pages for vim-airline :help airline-troubleshooting
