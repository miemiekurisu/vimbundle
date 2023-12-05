"set runtimepath+=~/vimfiles/bundle
if has("unix")
runtime! debian.vim
endif

if has("win32")||has("win64")

endif

let g:jedi#force_py_version=3
let g:pymode_python='python'

"if win use vimtweak
if has('gui') && has("gui_win32") || has("gui_win64")
"set runtimepath+=%USERPROFILE%/vimfiles/bundle
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
let g:tweakAlpha = 200
"modify it when needed
let g:MyVimLib = expand("~/.vim/vimtweak.dll")
"let g:MyVimLib = expand("~/.vim/bundle/vimtweak/vimtweak64.dll")
"let g:MyVimLib=expand('~/.vim/vimtweak.dll')
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
nnoremap <silent> <C-F10> :call SetAlpha(5)<CR>
nnoremap  <silent> <F10> :call SetAlpha(-5)<CR>
autocmd VimEnter * call libcallnr(g:MyVimLib, "SetAlpha", g:tweakAlpha)
unmap <C-V>
endif

set guifont=Monaco:h12
"set guifont=Lucida_Console:h14
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,cp936,latin1
set termencoding=utf-8
language messages zh_CN.utf-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

colorscheme elflordc
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
Plugin 'jistr/vim-nerdtree-tabs'
if has("gui_win32") || has("gui_win64")
Plugin 'mattn/vimtweak'
Plugin 'davidhalter/jedi-vim'
endif
call vundle#end()

filetype plugin indent on
syntax on
set foldlevel=99
"au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
let g:pydiction_location = expand('~/.vim/bundle/pydiction/complete-dict')
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
set autochdir
let g:Powerline_colorscheme='solarized256'
"NERDTree
let NERDTreeWinPos="left"
let NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let NERDTreeWinSize=38
let NERDTreeIgnore = ['\.DAT$', '\.LOG1$', '\.LOG1']
nnoremap <silent> <F12> :NERDTreeTabsToggle<CR>
nnoremap <silent> <C-F12> :NERDTreeFromBookmark workplace<CR>
" Start NERDTree
autocmd VimEnter * NERDTree
" Jump to the main window.
autocmd VimEnter * wincmd p

set splitbelow
nnoremap <silent> <F11> :terminal ++rows=8<CR>
if has("gui")
"set window
set lines=35 columns=160
endif

set fileformat=unix
set encoding=utf8

set omnifunc=jedi#completions
