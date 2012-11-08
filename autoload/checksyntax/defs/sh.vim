" sh.vim
" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     2012-08-23.
" @Last Change: 2012-08-23.
" @Revision:    4

if !exists('g:checksyntax.sh') && &shell =~ '\<bash\>'
    let g:checksyntax['sh'] = {
                \ 'cmd': 'bash -n',
                \ 'auto': 1,
                \ 'efm': '%f: %\\w%\\+ %l: %m',
                \ }
endif

