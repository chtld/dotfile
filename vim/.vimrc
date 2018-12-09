set nocompatible              " be iMproved, required
let $LANG = 'en'
set langmenu=en
filetype off                  " required

set encoding=utf-8
set termencoding=utf-8
" set fileencodings=utf-8,gbk,latin1
set fileencoding=utf-8

" set the runtime path to include Vundle and initialize：
" set rtp=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

Plugin 'VundleVim/Vundle.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'volca/markdown-preview'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'ervandew/supertab'
" Plugin 'Valloric/YouCompleteMe'  "<<<<ycm
"Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" Plugin 'akiomik/git-gutter-vim'
" Plugin 'Lokaltog/vim-powerline.git'
" Plugin 'kien/rainbow_parentheses.vim'
" Plugin 'tpope/vim-surround'
" Plugin 'bling/vim-airline'
Plugin 'vim-latex/vim-latex'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kien/ctrlp.vim'
" Plugin 'altercation/vim-colors-solarized'
Plugin 'majutsushi/tagbar'
"Plugin 'The-NERD-tree'
" Plugin 'taglist.vim'
Plugin 'vim-niji'
Plugin 'a.vim'
" Plugin 'LaTeX-Suite-aka-Vim-LaTeX'
Plugin 'molokai'
" Plugin 'vim-orgmode'
" Plugin 'vim-speeddating'
" Plugin 'vim-paredit'
" Plugin 'tslime'
" Plugin 'slimv.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax on
colors molokai

if has("win32")
    " au GUIEnter * simalt ~x
    set guifont=Consolas:h13:cANSI
elseif has("unix")
    set t_Co=256
endif

set cursorline
highlight CursorLine cterm=NONE ctermbg=235 guibg=#393939
set colorcolumn=80
highlight ColorColumn guibg=#292929 ctermbg=235
" let &colorcolumn=join(range(81,999),",")
" let &colorcolumn="80,".join(range(400,999),",")
highlight Comment guifg=#7E7E7E ctermfg=244
highlight Cursor guibg=white guifg=black
" highlight iCursor guifg=red guibg=yellow
" let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" let &t_EI = "\<Esc>]50;CursorShape=1\x7"
" set guicursor=n-v-c:block,o:block,i-ci:block,r-cr:block,sm:block

hi Visual term=reverse ctermbg=blue ctermfg=white guibg=#590959

highlight PmenuSel term=reverse ctermbg=235
highlight link YcmWarningSection YcmWarningLine
highlight link YcmErrorSection YcmErrorLine
"highlight YcmErrorSection guibg=#3f0000 ctermbg=red
"highlight YcmErrorLine guibg=#3f0000 ctermbg=232

set fileencodings=ucs-bom,utf-8,cp936,gb18030,default,latin1
set nofoldenable
set nu

set ruler
set modeline
set laststatus=2

set ts=4
set expandtab
set shiftwidth=4
set softtabstop=4
set backspace=indent,eol,start"

" set list
set noerrorbells
set t_vb=
set guioptions-=T
set guioptions-=e
" set guioptions-=r
" set guioptions-=m

set shortmess=atI
set mouse=a
if has("unix") && !has("win32unix")
    set mouse=
endif

let mapleader = ","

autocmd! BufWritePost $MYVIMRC source % 
autocmd BufNewFile,BufRead *.edp setf cpp
autocmd BufNewFile,BufRead *.cls set filetype=tex

" define a dummy sign and place it into the current buffer
" https://superuser.com/questions/558876
autocmd BufEnter * sign define dummy
autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

" au VimEnter * RainbowParenthesesToggle
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces

" for tex
if !has('win32')
  set shellslash
endif
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:tex_isk='48-57,a-z,A-Z,192-255,:'
let g:Tex_GotoError=0

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='molokai'
" let g:airline_powerline_fonts = 1

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" for YCM
" let g:ycm_show_diagnostics_ui = 0
set completeopt-=preview
if has("unix") && !has("win32unix")
    let g:ycm_global_ycm_extra_conf = "~/.vim/ycm_extra_conf.py"
endif
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"
" let g:syntastic_always_populate_loc_list = 0
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 1

if has('win32') || has('win64')
    set mouse=a
    set rtp^=~/.vim
    set rtp+=~/.vim/after
endif

" cscope
if has("cscope")
    set csprg=/bin/cscope
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb
endif
