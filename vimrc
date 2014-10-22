if filereadable(expand("~/.vim/bundles.vim"))
  source ~/.vim/bundles.vim
endif

" Snippets variables
let g:snips_author='Alan Smith'
let g:author='Alan Smith'
let g:snips_email='a.smith@s2games.com'
let g:email='a.smith@s2games.com'
let g:syntastic_always_populate_loc_list = 1

syntax on
colorscheme slate
set background=dark

set autoindent
set smartindent

set tabstop=4
set shiftwidth=4
set expandtab

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

autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
