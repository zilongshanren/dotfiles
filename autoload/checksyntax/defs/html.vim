" html.vim
" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     2012-07-02.
" @Last Change: 2012-07-02.
" @Revision:    1


if !exists('g:checksyntax.html')
    let g:checksyntax['html'] = {
                \ 'cmd': 'tidy -eq',
                \ 'efm': 'line %l column %c - %m'
                \ }
endif


