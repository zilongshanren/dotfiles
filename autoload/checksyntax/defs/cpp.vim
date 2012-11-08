" cpp.vim
" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     2012-07-02.
" @Last Change: 2012-07-02.
" @Revision:    2


call checksyntax#Require('c')

if !exists('g:checksyntax.cpp') && exists('g:checksyntax.c')
    let g:checksyntax['cpp'] = copy(g:checksyntax.c)
endif


