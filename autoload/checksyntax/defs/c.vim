" c.vim
" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     2012-07-02.
" @Last Change: 2012-07-02.
" @Revision:    1


if !exists('g:checksyntax.c')
    if executable('splint')
        let g:checksyntax['c'] = {
                    \ 'compiler': 'splint',
                    \ }
    endif
endif


