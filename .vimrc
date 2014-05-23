execute pathogen#infect()
filetype plugin indent on

" Snippets variables
let g:snips_author='Alan Smith'
let g:author='Alan Smith'
let g:snips_email='a.smith@s2games.com'
let g:email='a.smith@s2games.com'
let g:syntastic_always_populate_loc_list = 1

syntax on
colorscheme solarized

set autoindent
set smartindent

set tabstop=4
set shiftwidth=4
set expandtab

set number

let mapleader=','
nmap <Leader>a> :Tab /=><CR>
vmap <Leader>a> :Tab /=><CR>
nmap <Leader>a= :Tab /=<CR>
vmap <Leader>a= :Tab /=<CR>
