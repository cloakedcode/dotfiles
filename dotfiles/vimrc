if filereadable(expand("~/.vim/bundles.vim"))
  source ~/.vim/bundles.vim
endif

" Snippets variables
let g:snips_author='Alan Smith'
let g:author='Alan Smith'
let g:snips_email='alan@airpost.net'
let g:email='alan@airpost.net'
let g:syntastic_always_populate_loc_list = 1

syntax on
set background=dark
"colorscheme solarized
"set background=light

set autoindent
set smartindent

set tabstop=4
set shiftwidth=4
set expandtab

set wrap linebreak nolist
set textwidth=0
set wrapmargin=0

set colorcolumn=80

set number

set wh=50
set wiw=110

set noswapfile

let mapleader=','
nmap <Leader>a> :Tab /=><CR>
vmap <Leader>a> :Tab /=><CR>
nmap <Leader>a= :Tab /=<CR>
vmap <Leader>a= :Tab /=<CR>

autocmd BufNewFile,BufRead Gemfile set filetype=ruby
autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby
autocmd BufNewFile,BufRead Berksfile set filetype=ruby
autocmd BufNewFile,BufRead *.verb set filetype=ruby
autocmd BufRead,BufNewFile /tmp/item* set filetype=verdad_apple

autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType markdown setlocal spell spelllang=en_us
