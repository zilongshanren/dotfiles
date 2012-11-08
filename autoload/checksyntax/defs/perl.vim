" perl.vim
" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     2012-07-02.
" @Last Change: 2012-08-29.
" @Revision:    11


if !exists('g:checksyntax.perl')
    let g:checksyntax['perl'] = {
                \ 'alternatives': [
                \   {
                \     'cmd': 'perl -Wc %',
                \     'efm': '%-G%.%#had compilation errors.,%-G%.%#syntax OK,%m at %f line %l.,%+A%.%# at %f line %l\,%.%#,%+C%.%#',
                \   },
                \ ]
                \ }
endif
