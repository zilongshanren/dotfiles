" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     2012-08-28.
" @Last Change: 2012-08-28.
" @Revision:    0.0.61

if !exists('g:checksyntax#defs#r#progname')
    let g:checksyntax#defs#r#progname = executable('Rterm') ? 'Rterm' : 'R'   "{{{2
endif


if !exists('g:checksyntax#defs#r#options')
    let g:checksyntax#defs#r#options = '--slave --no-save --vanilla -e "%s" --args'   "{{{2
endif


if !exists('g:checksyntax.r')
    " Syntax checkers for R:
    "
    "   lint::lint ... See http://cran.r-project.org/web/packages/lint/
    "   svTools::lint ... See http://cran.r-project.org/web/packages/svTools/
    " :read: let g:checksyntax['r'] = {...} "{{{2
    let g:checksyntax['r'] = {
                \ 'alternatives': [
                \   {
                \     'name': 'lint::lint',
                \     'cmd': g:checksyntax#defs#r#progname .' '.
                \         printf(g:checksyntax#defs#r#options, 'lint::lint(commandArgs(TRUE))'),
                \     'efm': 'Lint: %m,%E%f:%l:%c,%Z%\\s\\+%m',
                \     'process_list': 'checksyntax#defs#r#LintLint'
                \   },
                \   {
                \     'name': 'svTools::lint',
                \     'cmd': g:checksyntax#defs#r#progname .' '.
                \         printf(g:checksyntax#defs#r#options, 'svTools::lint(commandArgs(TRUE),type=''flat'')'),
                \     'efm': '%t%\\w%\\++++%l+++%c+++%m',
                \   }
                \ ]
                \ }
endif


" :nodoc:
function! checksyntax#defs#r#LintLint(list) "{{{3
    " TLogVAR a:list
    let list = []
    for issue in a:list
        let text = get(issue, 'text', '')
        if text =~ ': found on lines \d\+'
            let message = matchstr(text, '^.\{-}\ze: found on lines \d\+')
            let lines = split(matchstr(text, 'found on lines \zs\d\+.*$'), ', ')
            for line in lines
                if line[0] =~ '^\d\+'
                    let issue1 = copy(issue)
                    let issue1.text = message
                    let issue1.lnum = str2nr(line)
                    call add(list, issue1)
                endif
            endfor
        else
            call add(list, issue)
        endif
    endfor
    " TLogVAR list
    return list
endf

