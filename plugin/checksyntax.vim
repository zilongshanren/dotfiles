" checksyntax.vim -- Check syntax when saving a file (php, ruby, tex ...)
" @Author:      Tom Link (micathom AT gmail com)
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     04-Mai-2005.
" @Last Change: 2012-08-28.
" GetLatestVimScripts: 1431 0 :AutoInstall: checksyntax.vim
" @Revision:    421

if exists('g:loaded_checksyntax')
    finish
endif
let g:loaded_checksyntax = 201


if !exists('g:checksyntax')
    let g:checksyntax = {}
endif


" :display: CheckSyntax[!] [NAME]
" Check the current buffer's syntax (type defaults to &filetype).
" Or use NAME instead of &filetype.
"
" With the bang !, run all alternatives (see 
" |g:checksyntax#run_alternatives|).
command! -bang -nargs=? CheckSyntax call checksyntax#Check(1, "<bang>", <f-args>)


" @TPluginInclude
if !exists('g:checksyntax_key_single')
    " Map for running the preferred syntax checkers on the current 
    " buffer.
    let g:checksyntax_key_single = '<F5>'   "{{{2
endif


" @TPluginInclude
if !exists('g:checksyntax_key_all')
    " Map for running all suitable syntax checkers on the current 
    " buffer.
    let g:checksyntax_key_all = '<C-F5>'   "{{{2
endif


if !exists('g:checksyntax_auto')
    " If 1, enable automatic syntax checks after saving a file.
    " If 2, enable automatic syntax checks when saving and loading a 
    " file.
    " NOTE: This variable must be customized in vimrc before loading 
    " this plugin.
    let g:checksyntax_auto = 1   "{{{2
endif


augroup CheckSyntax
    autocmd!
    if g:checksyntax_auto >= 1
        autocmd CheckSyntax BufWritePost * call checksyntax#Check(0)
    endif
    if g:checksyntax_auto >= 2
        autocmd CheckSyntax BufEnter * if !exists('b:checksyntax_runs')
                    \ | call checksyntax#Check(0, 0, &ft, 1)
                    \ | endif
    endif
augroup END


" @TPluginInclude
if !hasmapto(':CheckSyntax')
    if empty(maparg(g:checksyntax_key_single, 'n'))
        exec 'noremap' g:checksyntax_key_single ':CheckSyntax<cr>'
    endif
    if empty(maparg(g:checksyntax_key_single, 'i'))
        exec 'inoremap' g:checksyntax_key_single '<c-o>:CheckSyntax<cr>'
    endif
    if empty(maparg(g:checksyntax_key_all, 'n'))
        exec 'noremap' g:checksyntax_key_all ':CheckSyntax!<cr>'
    endif
    if empty(maparg(g:checksyntax_key_all, 'i'))
        exec 'inoremap' g:checksyntax_key_all '<c-o>:CheckSyntax!<cr>'
    endif
endif

