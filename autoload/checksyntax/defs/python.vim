" python.vim
" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     2012-07-02.
" @Last Change: 2012-08-23.
" @Revision:    11


if !exists('g:checksyntax.python')
    let g:checksyntax['python'] = {
                \ 'alternatives': [
                \   {
                \     'cmd': 'pyflakes',
                \     'efm': '%f:%l: %m',
                \   },
                \   {
                \     'cmd': 'pylint -r n -f parseable',
                \     'efm': '%f:%l: [%t] %m',
                \   }
                \ ]
                \ }
endif

