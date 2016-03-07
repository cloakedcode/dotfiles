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
NeoBundle 'vim-scripts/JSON.vim'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'PotatoesMaster/i3-vim-syntax'

NeoBundle 'godlygeek/tabular'

NeoBundle 'garbas/vim-snipmate'
NeoBundle 'scrooloose/syntastic'

NeoBundle 'honza/vim-snippets'
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'tomtom/tlib_vim'

NeoBundle 'kien/ctrlp.vim'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
