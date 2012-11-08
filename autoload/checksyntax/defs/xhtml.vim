" xhtml.vim
" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     2012-07-02.
" @Last Change: 2012-07-02.
" @Revision:    1

call checksyntax#Require('html')

if !exists('g:checksyntax.xhtml')
    let g:checksyntax['xhtml'] = copy(g:checksyntax.html)
endif


