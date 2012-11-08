" tex.vim
" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     2012-07-02.
" @Last Change: 2012-07-02.
" @Revision:    1


if !exists('g:checksyntax.tex')
    if executable('chktex')
        let g:checksyntax['tex'] = {
                    \ 'cmd': 'chktex -q -v0',
                    \ 'efm': '%f:%l:%m',
                    \ }
    endif
endif


