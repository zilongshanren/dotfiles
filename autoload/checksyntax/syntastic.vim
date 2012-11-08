" syntastic.vim
" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     2012-07-08.
" @Last Change: 2012-08-28.
" @Revision:    140


if !exists('g:checksyntax#syntastic#auto')
    " If true, mark syntastic syntax checkers as automatic checkers. See 
    " |g:checksyntax#auto_mode| and |g:checksyntax|.
    let g:checksyntax#syntastic#auto = 0   "{{{2
endif


if !exists('g:checksyntax#syntastic#filetype_rx')
    " Use syntastic's syntax checkers for filetypes that match this 
    " |regexp|. 
    " The value "." matches all filetypes.
    let g:checksyntax#syntastic#filetype_rx = '.'   "{{{2
endif


if !exists('g:checksyntax#syntastic#blacklist')
    " Don't load syntastic syntax checkers for these filetypes.
    let g:checksyntax#syntastic#blacklist = []   "{{{2
endif


if !exists('*SyntasticMake')
    " :nodoc:
    function SyntasticMake(options)
        " TLogVAR a:options
        let def = {
                    \ 'cmd': a:options.makeprg,
                    \ 'args': '',
                    \ 'efm': a:options.errorformat
                    \ }
        if has_key(a:options, 'name')
            let def.name = a:options.name
        endif
        " TLogVAR def
        return checksyntax#Make(def)
    endf
endif


if !exists('*SyntasticLoadChecker')
    " :nodoc:
    function SyntasticLoadChecker(checkers, ...)
        let filetype = a:0 >= 1 ? a:1 : &filetype
        let fn = 'SyntaxCheckers_'. filetype .'_GetLocList'
        for prg in a:checkers
            let name = filetype .'_'. prg
            " TLogVAR name
            if index(s:require_names, name) == -1 && executable(prg)
                call s:Load(filetype .'/'. prg)
                if exists('*'. fn)
                    " TLogVAR fn
                    let s:require_blacklist = 0
                    if checksyntax#RunAlternativesMode(g:checksyntax[filetype]) =~? '\<first\>'
                        call s:ProcessChecker(prg, filetype, filetype)
                        break
                    else
                        call s:ProcessChecker(prg, name, filetype)
                    endif
                endif
            endif
        endfor
    endf
endif


if !exists('*SyntasticHighlightErrors')
    " :nodoc:
    function! SyntasticHighlightErrors(errors, termfunc, ...)
        " dummy
    endf
endif


" :nodoc:
function! checksyntax#syntastic#Require(filetype) "{{{3
    " TLogVAR a:filetype
    if checksyntax#RunAlternativesMode(get(g:checksyntax, a:filetype, {})) =~? '\<first\>'
        return
    endif
    if a:filetype =~ g:checksyntax#syntastic#filetype_rx && index(g:checksyntax#syntastic#blacklist, a:filetype) == -1
        let alternatives = has_key(g:checksyntax, a:filetype) ? get(g:checksyntax[a:filetype], 'alternatives', []) : []
        " TLogVAR g:checksyntax, alternatives
        if empty(alternatives)
            if has_key(g:checksyntax, a:filetype)
                let s:require_names = [checksyntax#Name(g:checksyntax[a:filetype])]
            else
                let s:require_names = []
            endif
        else
            let s:require_names = map(copy(alternatives), 'checksyntax#Name(v:val)')
        endif
        let s:require_names = filter(s:require_names, '!empty(v:val)')
        let s:require_names += map(copy(s:require_names), 'a:filetype ."_". v:val')
        " echom "DBG checksyntax#syntastic#Require s:require_names=" string(s:require_names)
        let s:require_blacklist = 1
        call s:Load(a:filetype)
        " TLogVAR a:filetype, exists('g:syntastic_'. a:filetype .'_checker')
        if exists('g:syntastic_'. a:filetype .'_checker')
            let prg = g:syntastic_{a:filetype}_checker
            let name = a:filetype .'_'. prg
        else
            let prg  = ''
            let name = a:filetype
        endif
        " TLogVAR name
        call s:ProcessChecker(prg, name, a:filetype)
    endif
endf


function! s:ProcessChecker(prg, name, filetype) "{{{3
    " TLogVAR a:prg, a:name, a:filetype
    " echom "DBG ProcessChecker require_names" string(s:require_names)
    let fn = 'SyntaxCheckers_'. a:filetype .'_GetLocList'
    if exists('*'. fn) && index(s:require_names, a:name) == -1
        if a:name != a:filetype
            let oldfn = fn
            let fn = 'SyntaxCheckers_'. a:name .'_GetLocList'
            call checksyntax#CopyFunction(oldfn, fn)
            exec 'delfunction' oldfn
        endif
        let def = {
                    \ 'auto': g:checksyntax#syntastic#auto,
                    \ 'listtype': 'loc',
                    \ 'syntastic': fn
                    \ }
        if !empty(a:prg)
            let def.name = a:prg
        endif
        " TLogVAR def
        call checksyntax#Alternative(a:filetype, def)
    elseif s:require_blacklist
        call add(g:checksyntax#syntastic#blacklist, a:filetype)
    endif
endf


function! s:Load(path) "{{{3
    if stridx(&rtp, g:checksyntax#syntastic_dir) >= 0
        exec 'runtime! syntax_checkers/'. a:path
    else
        let syntax_checker = g:checksyntax#syntastic_dir
        if syntax_checker !~ '[\/]syntax_checkers$'
            let syntax_checker .= '/syntax_checkers'
        endif
        let syntax_checker .= '/'. a:path .'.vim'
        " TLogVAR syntax_checker, filereadable(syntax_checker)
        if filereadable(syntax_checker)
            exec 'source' fnameescape(syntax_checker)
        endif
    endif
endf

