set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Colorscheme
Plugin 'altercation/vim-colors-solarized'

" Snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required

set number
set numberwidth=5

set ruler

" Whitespace
set tabstop=4 shiftwidth=4
set expandtab
set smartindent

syntax enable
filetype plugin indent on

let g:vim_markdown_folding_disabled=1

" solarized options 
colorscheme solarized
set background=dark

set tw=80

imap ;; <Esc>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
