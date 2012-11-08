" lua.vim
" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     2012-07-02.
" @Last Change: 2012-07-02.
" @Revision:    1


if !exists('g:checksyntax.lua')
    let g:checksyntax['lua'] = {
                \ 'auto': executable('luac') == 1,
                \ 'cmd': 'luac -p',
                \ 'efm': 'luac\:\ %f:%l:\ %m'
                \ }
    " efm: File:Line:Column:Warning number:Warning message
endif


