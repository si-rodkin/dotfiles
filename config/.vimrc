" a1ur0n vim config
""" Set Plugins!
" Установка плагинов по PlugInstall!
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Valloric/YouCompleteMe'
Plug 'jiangmiao/auto-pairs'
Plug 'tomasr/molokai'
Plug 'endel/vim-github-colorscheme'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'itchyny/lightline.vim'

Plug 'fidian/hexmode'

call plug#end()
"""
" Airline colorscheme
let g:airline_theme='onedark'

""" map list
" NerdTree
map <C-n> :NERDTreeToggle<CR> 

" Window control
map <silent> <C-h> :call WinMove('h')<CR>
map <silent> <C-j> :call WinMove('j')<CR>
map <silent> <C-k> :call WinMove('k')<CR>
map <silent> <C-l> :call WinMove('l')<CR>
map <silent> <C-q> :call WinMove('q')<CR>
"""

""" Colorschemes
" White colorscheme
"colorscheme github

" Dark colorscheme
colorscheme onedark
"""
set number "set line number

set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set smarttab

set hlsearch
set incsearch

""" GUI options
"hide tool bar
set guioptions-=T 
"hide menu bar
set guioptions-=m 
" hide scrollbars
set guioptions-=r
set guioptions-=L
set guioptions-=R
set guioptions-=l
" GUI font
set gfn=Consolas
" Window Geometry
"if has('Gvim')
"    win 85 80
"endif

"""

set title

" YouCompleteMe options
let g:ycm_global_ycm_extra_conf = '/home/a1ur0n/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" clipboard
set clipboard=unnamedplus,unnamed

" Кодировка по умолчанию
set encoding=utf-8
set termencoding=utf-8
" Формат файла по умолчанию
set fileformat=unix
" Формат файла, который влияет на окончания строк — будет перебирать в указанном порядке
set ffs=unix,dos,mac
" Список кодировок файлов для авто-определения
set fileencodings=utf-8,cp1251

" ...
set showcmd
set autoindent
set ruler

" set syntax
filetype plugin indent on
syntax on

" search local settings
set exrc
set secure

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
