" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
NeoBundle 'tpope/vim-sensible'
NeoBundle 'bling/vim-airline'

NeoBundle 'rodjek/vim-puppet'

NeoBundle 'godlygeek/tabular'

NeoBundle 'garbas/vim-snipmate'
NeoBundle 'scrooloose/syntastic'

NeoBundle 'honza/vim-snippets'
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'tomtom/tlib_vim'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

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
