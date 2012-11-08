" docbk.vim
" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     2012-07-02.
" @Last Change: 2012-07-02.
" @Revision:    1

call checksyntax#Require('xml')

if !exists('g:checksyntax.docbk')
    let g:checksyntax['docbk'] = copy(g:checksyntax.xml)
endif


