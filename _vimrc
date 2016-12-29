if has("unix")
runtime! debian.vim
endif

"if win32 use vimtweak
if has("gui_win32") || has("gui_win64")
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
let g:tweakAlpha = 185
let g:MyVimLib = $HOME."/.vim/bundle/vimtweak/vimtweak64.dll"
function! SetAlpha(alpha)
        let g:tweakAlpha=g:tweakAlpha+a:alpha
        if g:tweakAlpha < 150
                let g:tweakAlpha=150
        endif
        if g:tweakAlpha > 255
                let g:tweakAlpha=255
        endif
        call libcallnr(g:MyVimLib, "SetAlpha", g:tweakAlpha)
endfunction

behave mswin
unmap <C-V>
set guifont=Monaco:h12
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,cp936,latin1
set termencoding=utf-8
language messages zh_CN.utf-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
nmap <a-+> <esc>:call SetAlpha(5)<cr>
nmap <a-_> <esc>:call SetAlpha(-5)<cr>
colorscheme elflordc
endif
if has("unix")
set ff=unix
endif
set number

set rtp+=~/.vim/bundle/Vundle.vim
set nocompatible
filetype off

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/Conque-Shell'
Plugin 'mattn/vimtweak'
Plugin 'mattn/transparency-windows-vim'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'severin-lemaignan/vim-minimap'
call vundle#end()

filetype plugin indent on
syntax on
set foldlevel=99
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'
set tabstop=8
set softtabstop=4
set expandtab
map <leader>td <Plug>TaskList
set completeopt=menuone,longest,preview
"map <leader>dt :set makeprg=python\ manage.py\ test\|:call MakeGreen()<CR>
set autoindent
set foldmethod=manual
set showtabline=2
"autocmd BufWritePost $MYVIMRC source $MYVIMRC
set incsearch
set ignorecase
set wildmenu
set laststatus=2
let g:Powerline_colorscheme='solarized256'
"NERDTree
let NERDTreeWinPos="left"
let NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let NERDTreeWinSize=38
nnoremap <silent> <F12> :NERDTreeTabsToggle<CR>
if has("gui")
"set window
set lines=35 columns=160
endif

"minimap"
nnoremap <silent> <F11> :MinimapToggle <CR>
"must behind the nerdtree
if has("gui_win32") || has("gui_win64")
call SetAlpha(0)
endif