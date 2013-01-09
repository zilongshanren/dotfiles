" VIM Configuration File
" Author: guanghui qu 
"
" load plugins that ship with Vim {{{
set nocompatible
runtime macros/matchit.vim
runtime ftplugin/man.vim
"}}}

"auto reload vimrc configuration {{{
au BufWritePost .vimrc so ~/.vimrc
nmap <leader>vv :tabedit $MYVIMRC<CR>
"}}}

"--vim-pathogen {{{
filetype plugin indent on
filetype plugin on
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
call pathogen#infect()
syntax on
"}}}

" Disable swapfile and backup {{{
set nobackup
set noswapfile
"}}}

"remap leader key{{{
let mapleader=','
"}}}

"some common configs {{{
"map visual mode vertical selectoin"
nmap <leader>v <c-v>
set fenc=utf-8
set termencoding=utf-8
set autoindent
set smartindent
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces
set textwidth=120
set t_Co=256
set number
set hidden
set showmatch
set comments=sl:/*,mb:\ *,elx:\ */
set wildmode=longest:full
set wildmenu
set autoread
set title
set matchpairs+=<:>
set ruler
set backspace=indent,eol,start
map Y y$
set laststatus=2
set pastetoggle=<F2>
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
" Toggle show/hide invisible chars
nnoremap <leader>i :set list! <cr>
set fileformats="unix,dos,mac"
set formatoptions+=1            " When wrapping paragraphs, don't end lines
                                "    with 1-letter words (looks stupid)
"}}}

"search" {{{
set incsearch
set hls
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
nnoremap <silent> <C-c> :%s///gn<cr>
vnoremap < <gv
vnoremap > >gv
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz
"}}}

"better command line editing {{{
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
"}}}


" config ctags file locations {{{
set tags+=./tags
set tags+=~/.vim/tags/cpp
" let g:ProjTags = [ "~/workspace" ]
let g:ProjTags = [["~/workspace/cocos2d-html5", "~/.vim/tags/cocos2d-html5/cocos2d/tags", "~/.vim/tags/cocos2d-html5/chipmunk/tags","~/.vim/tags/cocos2d-html5/box2d/tags","~/.vim/tags/cocos2d-html5/CocosDenshion/tags","~/.vim/tags/cocos2d-html5/extensions/tags"]]
let g:ProjTags += [["~/workspace/cocos2d-x","~/.vim/tags/cocos2d-x/cocos2dx/tags","~/.vim/tags/cocos2d-x/chipmunk/tags","~/.vim/tags/cocos2d-x/Box2d/tags","~/.vim/tags/cocos2d-x/CocosDenshion/tags","~/.vim/tags/cocos2d-x/extensions/tags"]]
let g:ProjTags += [[ "~/workspace/opencv","~/.vim/tags/opencv/tags" ]]
"}}}

" configure for DoxygenToolkit plugin {{{
let g:DoxygenToolkit_briefTag_pre="@brief "
let g:DoxygenToolkit_paramTag_pre="@param "
let g:DoxygenToolkit_returnTag="@Returns "
let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
let g:DoxygenToolkit_authorName="guanghui.qu <guanghui8827@126.com>"
let g:DoxygenToolkit_licenseTag="MIT License"
"create doxygen comment
map <leader>dd :Dox<CR>
map <leader>da :DoxAuthor<Cr>
map <leader>dl :DoxLic<cr>
"}}}

"--- OmniCppComplete ---{{{
filetype on
set nocp
filetype plugin on
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
"}}}


"plugins key maps" {{{
"--commentary plugin,comment a line
map <leader>/ \\\
"go back and forth from header file and source file
nmap <silent> <leader>f :FSHere<cr>
"open a tag list ivew
nmap <silent> <leader>t :TagbarToggle <CR>
"disable default buffergator keymaps"
let g:buffergator_suppress_keymaps = 1

"config for ZoomWin plugin map
nmap <silent>,o :ZoomWin <cr>

"config for BufferNavigator"
nmap <leader>bf :BuffergatorToggle<cr>
"}}}

"nerdTree plugin config {{{
autocmd vimenter * NERDTree
nmap <silent> <leader>n :NERDTreeToggle <CR>
"}}}

"better tag navigation from www.vimbits.com {{{
nnoremap <Return> <C-]>
nnoremap <leader>b <C-o>
"}}}


"automatically save foldings in vim{{{
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview
"}}}

"map markdown to html {{{
nmap <leader>md :%!/usr/local/bin/Markdown.pl --html4tags <cr>
"}}}

"map leader 1 for display cursorline {{{
:nnoremap <Leader>1 :set cursorline! cursorcolumn!<CR>
"}}}


"map windows command {{{
nmap ,j <c-w>j
nmap ,k <c-w>k
nmap ,h <c-w>h
nmap ,l <c-w>l
nmap ,c <c-w>c
nmap ,<tab> <c-w><c-w>
nnoremap j gj
nnoremap k gk
nmap <leader>d <c-D>
nmap <leader>u <c-U>
"}}}

"config syntastic {{{
let g:syntastic_check_on_open=1
"}}}


"set colorscheme {{{
syntax enable
if has('gui_running')

    set background=dark
    colorscheme solarized
else
    colorscheme wombat256 
endif
"}}}

"config tagbar plugin {{{
let Tlist_Use_Right_Window = 1
"}}}


"solarized colorschema config{{{
let g:solarized_diffmode="high"
"}}}

" Ctlr-P {{{
nmap <leader>p :CtrlP <cr>
let g:ctrlp_jump_to_buffer    = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_height        = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*
set wildignore+=*.o
"}}}


"Configuration for tabular plugin {{{
if exists(":Tabularize")
  nmap <Leader>= :Tabularize /=<CR>
  vmap <Leader>= :Tabularize /=<CR>
  nmap <Leader>; :Tabularize /:<CR>
  vmap <Leader>; :Tabularize /:<CR>
endif
"}}}

"english spell check {{{
nmap <silent> <leader>s :set spell!<CR>
" Set region to British English
set spelllang=en_gb
"}}}

" map Gundo plugin toggle {{{
nnoremap <leader>U ::GundoToggle<CR>
"}}}

"buffer navigations {{{
nnoremap <silent> <leader>bp : bprevious<cr>
nnoremap <silent> <leader>bn : bnext<cr>
"}}}

"tab navigations {{{
map <Leader>tn <esc>:tabprevious<CR>
map <Leader>tp <esc>:tabnext<CR>
"}}}


"command line editing key maps {{{
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
"}}}

"config cocos2d snippets for snipmate {{{
autocmd FileType cpp set ft=cpp.cocos2dxcpp
autocmd FileType javascript set ft=javascript.cocos2dhtml5
autocmd FileType lua set ft=lua.cocos2dxlua
"}}}

"configure for running opencv {{{
if !has("win32")
    " add command to complie opencv program"
    nnoremap <silent><leader>2 : call Compilerunopencv()<cr>

    function! Compilerunopencv()
        let IncDir = "/usr/local/include"
        let LibDir = "/usr/local/lib"
        let Libs   = "-lopencv_core -lopencv_highgui -lopencv_imgproc"
        exec "w"
        exec "lcd %:p:h"
        exec "r !g++ -I" . IncDir . " -L" . LibDir . " % " . Libs . " -o %< " 
        echo "compile finished!"
        exec "!./%<"
    endfunction
endif
"}}}



" Generate tags on save. Note that this regenerates tags for all files in current folder {{{
function! GenerateTagsFile()
    exec ":!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."
endfunction

function! GenerateJsTags()
    exec ":!jsctags ."
endfunction

nnoremap <leader>8   :call GenerateTagsFile() <cr>
nnoremap <leader>9   :call GenerateJsTags() <cr>
"}}}

" Always change to directory of the buffer currently in focus {{{
autocmd! bufenter *.* :cd %:p:h
autocmd! bufread  *.* :cd %:p:h
"}}}



" add cpp11 syntax support {{{
au BufNewFile,BufRead *.cpp set syntax=cpp11
let g:syntastic_cpp_compiler_options = ' -std=c++11'
"run cpp11 code"
nmap <leader>rr :<C-U>!clang++ -std=c++11 -stdlib=libc++ -o %:r % && ./%:r <cr>
"}}}

"add octrpress publish blog key mappings {{{
nmap ,3 :!rake generate <cr>
nmap ,4 :!rake deploy <cr>
"}}}

" Better navigating through omnicomplete option list {{{
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>
"}}}

" Settings for python-mode {{{
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
map <Leader>g :call RopeGotoDefinition()<CR>
let ropevim_enable_shortcuts = 1
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0
" map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>
"}}}

" Folding rules {{{
set foldenable                  " enable folding
set foldcolumn=2                " add a fold column
set foldmethod=marker           " detect triple-{ style fold markers
set foldlevelstart=99           " start out with everything folded
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
                                " which commands trigger auto-unfold
function! MyFoldText()
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - 4
    return line . ' …' . repeat(" ",fillcharcount) . foldedlinecount . ' '
endfunction
set foldtext=MyFoldText()

nnoremap zO zCzO
nnoremap <Space> za
vnoremap <Space> za
nnoremap ,z zMzv
"}}}

"configure for UltiSnips plugin {{{ 
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"}}}

