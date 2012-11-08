" java.vim
" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     2012-07-02.
" @Last Change: 2012-08-23.
" @Revision:    8


if !exists('g:checksyntax.java')

    " :nodoc:
    function! checksyntax#defs#java#Jlint() "{{{3
        let filename = expand('%:r') .'.class'
        " TLogVAR filename
        " echom '! jlint -done '. shellescape(filename)
        exec '! jlint -done '. shellescape(filename)
    endf

    call checksyntax#Alternative('java', {
                \ 'name': 'jlint',
                \ 'if_executable': 'jlint',
                \ 'exec': 'call checksyntax#defs#java#Jlint()'
                \ })

    call checksyntax#Alternative('java', {
                \ 'if_executable': 'checkstyle',
                \ 'compiler': 'checkstyle'
                \ })

endif

