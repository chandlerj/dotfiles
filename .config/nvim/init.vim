call plug#begin()

    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'tmsvg/pear-tree',

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
set tabstop=4
set shiftwidth=4
set expandtab	" spaces instead of tabs 

" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()


