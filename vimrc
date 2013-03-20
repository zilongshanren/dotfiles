" VIM Configuration File
" Author: guanghui qu 
"
" load plugins that ship with Vim {{{
set nocompatible
filetype on
runtime macros/matchit.vim
runtime ftplugin/man.vim
"}}}


"--vim-pathogen {{{
filetype plugin indent on
filetype plugin on
call pathogen#infect()
call pathogen#helptags()
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
set fileencodings=utf-8,chinese
set encoding=utf-8  "if not set, the powerline plugins won't work 
if has("win32") || has("win64")
    set fileencoding=chinese
endif
set autoindent
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab
set textwidth=300
set t_Co=256
set number
set hidden
set showmatch
set comments=sl:/*,mb:\ *,elx:\ */
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
set autoread
set title
set matchpairs+=<:>
set ruler
set backspace=indent,eol,start
map Y y$
set laststatus=2
set pastetoggle=<F2>
set nolist
syntax on
"}}}

"Tab-completion in command-line mode{{{
set wildmenu
set wildmode=longest:full
set wildignore=*.pdf
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
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
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



"plugins key maps" {{{
"--commentary plugin,comment a line
map <leader>/ \\\
"go back and forth from header file and source file
nmap <silent> <leader>f :A<cr>
"open a tag list ivew
nmap <silent> <leader>ta :TagbarToggle <CR>
"disable default buffergator keymaps"
let g:buffergator_suppress_keymaps = 1

"config for ZoomWin plugin map
nmap <silent>,o :ZoomWin <cr>

"config for BufferNavigator"
nmap <leader>bf :BufExplorer<cr>
"}}}

"nerdTree plugin config {{{
autocmd vimenter * NERDTree
nmap <silent> <leader>n :NERDTreeToggle <CR>
let NERDTreeShowHidden=1
" bufkill bd's: really do not mess with NERDTree buffer
nnoremap <silent> <backspace> :BD<cr>
nnoremap <silent> <s-backspace> :BD!<cr>

" Prevent :bd inside NERDTree buffer
au FileType nerdtree cnoreabbrev <buffer> bd <nop>
au FileType nerdtree cnoreabbrev <buffer> BD <nop>
"}}}

"better tag navigation from www.vimbits.com {{{
nnoremap <Return> <C-]>
nnoremap <leader>b <C-o>
"}}}


"automatically save foldings in vim{{{
" au BufWinLeave * silent! mkview
" au BufWinEnter * silent! loadview
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
colorscheme blackboard
"}}}

"config tagbar plugin {{{
let Tlist_Use_Right_Window = 1
"}}}


"solarized colorschema config{{{
let g:solarized_diffmode="low"
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
nmap <Leader>= :Tabularize /=<CR>
vmap <Leader>= :Tabularize /=<CR>
nmap <Leader>: :Tabularize /:<CR>
vmap <Leader>: :Tabularize /:<CR>
"}}}

"english spell check {{{
nmap <silent> <leader>s :set spell!<CR>
" Set region to British English
set spelllang=en_gb
"}}}

" map Gundo plugin toggle {{{
nnoremap <leader>U ::GundoToggle<CR>
"}}}


"command line editing key maps {{{
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%
" Prompt to open file with same name, different extension
map <leader>er :e <C-R>=expand("%:r")."."<CR>
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
        exec "r !g++ -I" . IncDir . " -L" . LibDir . " *.cpp " . Libs . " -o %< " 
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
" autocmd! bufenter *.* :cd %:p:h
" autocmd! bufread  *.* :cd %:p:h
"}}}



" add cpp11 syntax support {{{
let g:syntastic_cpp_compiler_options = ' -std=c++11'
"run cpp11 code"
if !has("win32")
nmap <leader>rr :<C-U>!clang++ -std=c++11 -stdlib=libc++ -nostdinc++ -I/usr/local/src/llvm/tools/libcxx/include -L/usr/local/src/llvm/tools/libcxx/lib -o %:r % && ./%:r <cr>
endif

if has("win32") || has("win64")
nmap <leader>rr :<C-U>!clang++ -std=c++11 -stdlib=libc++ -nostdinc++
            \ -IC:/MinGW/include
            \ -IC:/MinGW/lib
            \ -IC:/MinGW/lib/gcc/mingw32/4.6.2/include/c++
            \ -IC:/MinGW/lib/gcc/mingw32/4.6.2/include/c++/mingw32
            \ -o %:r % && %:r <cr>
endif

if has("win32") || has("win64")
    " fix cygwin shell redirection
    set shellredir=>\"%s\"\ 2>&1
endif    

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

"c/c++/javascript/java fold method
autocmd filetype c,cpp,javascript,java set foldmarker={,}

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

"auto reload vimrc configuration {{{
au BufWritePost .vimrc so ~/.vimrc
nmap <leader>vv :tabedit $MYVIMRC<CR>
"}}}


"config clang_complete library {{{
" g:clang_user_options set at vimprj section
au FileType cpp,objcpp set syntax=cpp11
au BufNewFile,BufRead *
\ if expand('%:e') =~ '^\(h\|hh\|hxx\|hpp\|ii\|ixx\|ipp\|inl\|txx\|tpp\|tpl\|cc\|cxx\|cpp\)$' |
\   if &ft != 'cpp'                                                                           |
\     set ft=cpp                                                                              |
\   endif                                                                                     |
\ endif   

let g:clang_use_library=1
let g:clang_complete_copen=1
let g:clang_complete_macros=1
let g:clang_complete_patterns=0
" Avoids lame path cache generation and other unknown sources for includes 
let g:clang_auto_user_options=''
let g:clang_memory_percent=70

if has("win32") || has("win64")
let g:clang_library_path="c:"
endif


set conceallevel=2
set concealcursor=vin
let g:clang_snippets=1
let g:clang_conceal_snippets=1
" The single one that works with clang_complete
let g:clang_snippets_engine='clang_complete'

" Complete options (disable preview scratch window, longest removed to aways
" show menu)
set completeopt=menu,menuone

" Limit popup menu height
set pumheight=20

" SuperTab completion fall-back 
let g:SuperTabDefaultCompletionType='<c-x><c-u><c-p>'
"}}}



"keymaps for c/c++ development{{{
" Reparse the current translation unit in background
command! Parse  call g:ClangBackgroundParse()  
" Reparse the current translation unit and check for errors
command! ClangCheck call g:ClangUpdateQuickFix()  

" Set the most common used run command
if has('win32') || has('win64') || has('os2')
    let g:common_run_command='$(FILE_TITLE)$'
else
    let g:common_run_command='./$(FILE_TITLE)$'
endif
 
" SingleCompile for C++ with Clang
function! s:LoadSingleCompileOptions()
    call SingleCompile#SetCompilerTemplate('c', 
                \'clang', 
                \'the Clang C and Objective-C compiler', 
                \'clang', 
                \'-o $(FILE_TITLE)$ ' . g:single_compile_options, 
                \g:common_run_command)
 
    call SingleCompile#ChooseCompiler('c', 'clang')
 
    call SingleCompile#SetCompilerTemplate('cpp', 
                \'clang', 
                \'the Clang C and Objective-C compiler', 
                \'clang++', 
                \'-o $(FILE_TITLE)$ ' . g:single_compile_options, 
                \g:common_run_command)
    call SingleCompile#ChooseCompiler('cpp', 'clang')
endfunction

noremap  <silent> <F7> :Parse<cr>
noremap  <silent> <F8> :ClangCheck<cr>
noremap  <silent> <F9> :SCCompile<cr>
noremap  <silent> <F10> :SCCompileRun<cr>
noremap! <silent> <F7> <c-o>:Parse<cr>
noremap! <silent> <F8> <c-o>:ClangCheck<cr>
noremap! <silent> <F9> <c-o>:SCCompile<cr>
noremap! <silent> <F10> <c-o>:SCCompileRun<cr>
"}}}

"Config for SimpleCompile plugin {{{
" SingleCompile for C++ with Clang
" vimprj configuration
au BufNewFile,BufRead *.vimprj set ft=vim

 
" Initialize vimprj plugin
call vimprj#init()
 
" vimprj hooks
 
" Called BEFORE sourcing .vimprj and when not sourcing
function! g:vimprj#dHooks['SetDefaultOptions']['main_options'](dParams)
    let g:vimprj_dir = substitute(a:dParams['sVimprjDirName'], '[/\\]\.vimprj$', '', '')
    if &ft == 'c' || &ft == 'cpp'  
        let g:clang_user_options = ''
        if &ft == 'cpp'
            let g:clang_user_options = '-std=c++11 -stdlib=libc++ '
        endif
        let g:single_compile_options = '-O3 ' . g:clang_user_options
    endif
endfunction
 
" Called AFTER sourcing .vimprj and when not sourcing
function! g:vimprj#dHooks['OnAfterSourcingVimprj']['main_options'](dParams)
    unlet g:vimprj_dir
    if &ft == 'c' || &ft == 'cpp'  
      call g:ClangBackgroundParse()
      call s:LoadSingleCompileOptions()
    endif                          
endfunction
"}}}


"config for neocomplcache{{{
" use neocomplcache & clang_complete

" add neocomplcache option
let g:neocomplcache_force_overwrite_completefunc=1

" add clang_complete option
let g:clang_complete_auto=1
" Disable AutoComplPop. Comment out this line if AutoComplPop is not installed.
let g:acp_enableAtStartup = 0
" Launches neocomplcache automatically on vim startup.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underscore completion.
let g:neocomplcache_enable_underbar_completion = 1
" Sets minimum char length of syntax keyword.
let g:neocomplcache_min_syntax_length = 3
"}}}

"some abbreviates for myself {{{
abbreviate zl zilongshanren
"}}}

" tab navigation like firefox{{{
nnoremap <leader><tab> :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <leader><tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc> :tabnew<CR>
"}}}

"configs for vimwiki"{{{
nmap <leader>5 :VimwikiAll2HTML<cr>
let g:vimwiki_list = [{'path': '/Users/andyque/workspace/myblog/octopress/source/vimwiki/',  
  \ 'path_html': '/Users/andyque/workspace/myblog/octopress/source/vimwiki_html/'}]
"}}}

"keymaping for HardMode plugin {{{
" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
nnoremap <leader>ha <Esc>:call ToggleHardMode()<CR>
"}}}

"emacs keymaping for insert mode cursor movement{{{
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A
inoremap <c-f> <right>
inoremap <c-b> <left>
inoremap <C-d> <Esc>lxi
"}}}

"delimitMate mappings{{{
let delimitMate_matchpairs = "(:),[:],{:},<:>"
au FileType cpp let b:delimitMate_matchpairs = "(:),[:],{:}"
"}}}

"mappings for latex-box plugin{{{
map <silent> <Leader>ls :silent !/Applications/Skim.app/Contents/SharedSupport/displayline
            \ <C-R>=line('.')<CR> "<C-R>=LatexBox_GetOutputFile()<CR>" "%:p" <CR>
autocmd filetype tex nnoremap F10 :!latexmk -pdf % 
"}}}

