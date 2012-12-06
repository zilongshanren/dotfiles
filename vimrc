" VIM Configuration File
" Description: Optimized for C/C++ development, but useful also for other things.
" Author: guanghui qu 
"
" load plugins that ship with Vim"
runtime macros/matchit.vim
runtime ftplugin/man.vim

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Disable swapfile and backup {{{2
set nobackup
set noswapfile
" }}}
"let mapleader=','

set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set nocompatible
set autoindent
set smartindent
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces
set textwidth=120
set t_Co=256
syntax on
set number
set showmatch
set comments=sl:/*,mb:\ *,elx:\ */
set wildmode=longest:full
set wildmenu
set title
set matchpairs+=<:>
set ruler

set laststatus=2
" Add git branch to statusline.
if exists("*fugitive#statusline")
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
endif

" Install OmniCppComplete like described on http://vim.wikia.com/wiki/C++_code_completion
" This offers intelligent C++ completion when typing '.' '->' or <C-o>
" Load standard tag files
set tags+=./tags
set tags+=~/.vim/tags/cpp
" let g:ProjTags = [ "~/workspace" ]
let g:ProjTags = [["~/workspace/cocos2d-html5", "~/.vim/tags/cocos2d-html5/cocos2d/tags", "~/.vim/tags/cocos2d-html5/chipmunk/tags","~/.vim/tags/cocos2d-html5/box2d/tags","~/.vim/tags/cocos2d-html5/CocosDenshion/tags","~/.vim/tags/cocos2d-html5/extensions/tags"]]
let g:ProjTags += [["~/workspace/cocos2d-x","~/.vim/tags/cocos2d-x/cocos2dx/tags","~/.vim/tags/cocos2d-x/chipmunk/tags","~/.vim/tags/cocos2d-x/Box2d/tags","~/.vim/tags/cocos2d-x/CocosDenshion/tags","~/.vim/tags/cocos2d-x/extensions/tags"]]

" set tags+=~/vimTags/cocos2dx/tags
" set tags+=~/.vim/tags/cocoDensionTags
" set tags+=~/.vim/tags/b2dTags
" set tags+=~/.vim/c2dxexTags
" set tags+=~/.vim/c2dhtml5
" set tags+=~/.vim/jsbox2d
" set tags+=~/.vim/jscocoaDenshion

" Install DoxygenToolkit from http://www.vim.org/scripts/script.php?script_id=987
let g:DoxygenToolkit_briefTag_pre="@brief "
let g:DoxygenToolkit_paramTag_pre="@param "
let g:DoxygenToolkit_returnTag="@Returns "
let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
let g:DoxygenToolkit_authorName="guanghui.qu <guanghui8827@126.com>"
let g:DoxygenToolkit_licenseTag="MIT License"
"create doxygen comment
map <leader>d :Dox<CR>
map <leader>da :DoxAuthor<Cr>
map <leader>dl :DoxLic<cr>


"--- OmniCppComplete ---
" -- required --
set nocp " non vi compatible mode
filetype plugin on " enable plugins
" -- optional --
" auto close options when exiting insert mode
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" set completeopt=menu,menuone
" -- configs --
let OmniCpp_MayCompleteDot = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
let OmniCpp_SelectFirstItem = 0 " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype (i.e. parameters) in popup window
" -- ctags --

"--vim-pathogen
call pathogen#infect()
syntax on
filetype plugin indent on

autocmd vimenter * NERDTree
"--tcomment plugin,comment a line
map <leader>c <c-_><c-_>

"---a.vim plugin
nmap <buffer> <silent> <leader> ,PP

"go back and forth from header file and source file
nmap <silent> <leader>h :FSHere<cr>

"open a tree view
nmap <silent> <leader>n :NERDTreeToggle <CR>

"open a tag list ivew
nmap <silent> <leader>t :TagbarToggle <CR>

"generate ctags at current directory
nmap <silent> <leader>gg  :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ./ <CR>

"go to function definition
map  ,f <c-]>

"go back to prev function
map ,b <c-t>

"indent back
nmap <S-Tab> <<

"automatically save foldings in vim
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

"map markdown to html
nmap <leader>md :%!/usr/local/bin/Markdown.pl --html4tags <cr>


" :hi CursorLine   cterm=NONE ctermbg=lightyellow ctermfg=black guibg=lightyellow guifg=black
" :hi CursorColumn cterm=NONE ctermbg=yellow ctermfg=black guibg=yellow guifg=black
:nnoremap <Leader>1 :set cursorline! cursorcolumn!<CR>

"set javascript auto completion
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

"map windows command
nmap ,j <c-w>j
nmap ,k <c-w>k
nmap ,h <c-w>h
nmap ,l <c-w>l
" nmap ,o <c-w>o
nmap ,c <c-w>c
nmap ,<tab> <c-w><c-w>
nmap ,a <c-A>
nmap ,x <c-X>

"config syntastic check syntax when file open
let g:syntastic_check_on_open=1

"windows down
nmap ,d <c-D>
nmap ,u <c-U>

"disable navigation throgh arrow key
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

nmap ,p :CtrlP <cr>

"set colorscheme
syntax enable
if has('gui_running')

    set background=dark
    colorscheme solarized
else
    colorscheme wombat256 
endif

"disable default buffergator keymaps"
let g:buffergator_suppress_keymaps = 1

"config for ZoomWin plugin map
nmap <silent>,o :ZoomWin <cr>

"config for BufferNavigator"
nmap <leader>bb :BuffergatorToggle<cr>

"map sparkup, make html programming like zend coding
imap <leader>e <c-e>

"map visual mode vertical selectoin"
nmap ,v <c-v>

"config taglist window to the right most"
let Tlist_Use_Right_Window = 1

"map fold method"
nnoremap <space> za
nnoremap ,z zMzv

"set git diff color schema"
let g:solarized_diffmode="high"

" Ctlr-P {{{2
let g:ctrlp_jump_to_buffer = 0
let g:ctrlp_working_path_mode = 0

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO


augroup ft_c
    au!
    au FileType javascript,c,cpp,java setlocal foldmethod=marker foldmarker={,}
augroup END

"Configuration for tabular plugin"
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:<CR>
  vmap <Leader>a: :Tabularize /:<CR>
endif

"english spell check"
nmap <silent> <leader>s :set spell!<CR>
 
" Set region to British English
set spelllang=en_gb

