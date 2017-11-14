"""""""
"
" a1ur0n vim general config
"
"""""""

"""""
" Plugin manager -- Vundle
"-----------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

"!!! PLUGINS CALL
call vundle#begin()
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"""
" FUNCTIONAL PLUGINS
" NerdTree
Plugin 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" YouCompleteMe
Plugin 'Valloric/YouCompleteMe'

" AutoPairs
Plugin 'jiangmiao/auto-pairs'

" Airline
Plugin 'vim-airline/vim-airline'
Plugin 'itchyny/lightline.vim'

"""
" COLORSHCEMES
" GitHub
Plugin 'endel/vim-github-colorscheme'

" OneDark
Plugin 'joshdick/onedark.vim'

" Obsidian
Plugin 'abra/vim-obsidian'

" Xcode
Plugin 'cohlin/vim-colorschemes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
"!!!

filetype plugin indent on    " required
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"----------------------------

"""""
" Set colorscheme
colorscheme onedark
"----------------------------

"""""
" Set airline colorscheme
let g:airline_theme='onedark'
"let g:airline_theme="edocx"
"----------------------------

"""""
" Line numbers
set number "set line number
"----------------------------

"""""
" Tabs
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set smarttab
"----------------------------

"""""
" Title
set title
"----------------------------

"""""
" YouCompleteMe options
" Config file
let g:ycm_global_ycm_extra_conf = '/home/a1ur0n/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"----------------------------

"""""
" Clipboard options
set clipboard=unnamedplus,unnamed
"----------------------------

"""""
" Encoding settings
" Encoding by default
set encoding=utf-8
set termencoding=utf-8

" File format by default
set fileformat=unix

" Формат файла, который влияет на окончания строк — будет перебирать в указанном порядке
set ffs=unix,dos,mac

" Список кодировок файлов для авто-определения
set fileencodings=utf-8,cp1251
"----------------------------

"""""
" HZ cho
set showcmd
set autoindent
set ruler
"----------------------------

"""""
" Set syntax hightlighting
syntax on
"----------------------------

"""""
" Auto search local settings
set exrc
set secure
"----------------------------

"""""
" Key bindings
"""
" Window control (using function MinMove)
map <silent> <C-h> :call WinMove('h')<CR>
map <silent> <C-j> :call WinMove('j')<CR>
map <silent> <C-k> :call WinMove('k')<CR>
map <silent> <C-l> :call WinMove('l')<CR>
map <silent> <C-q> :call WinMove('q')<CR>
"-------------
"""""
" NerdTree
map <C-n> :NERDTreeToggle<CR>
"-------------
"""""
" Russin control keys
" TODO
" ------------
"----------------------------

"""""
" Functions
"""
" Window control function
set cursorline
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key, '[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction
"-------------
"""
" For colorschemes in terminal
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
"-------------
"----------------------------

"""""
" 
