" ruby.vim
" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     2012-07-02.
" @Last Change: 2012-08-24.
" @Revision:    8


if !exists('g:checksyntax#defs#ruby#interpreter')
    let g:checksyntax#defs#ruby#interpreter = system('ruby --version')   "{{{2
endif


if !exists('g:checksyntax.ruby')
    let g:checksyntax['ruby'] = {
                \ 'prepare': 'compiler ruby',
                \ 'cmd': 'ruby -c',
                \ }
    if g:checksyntax#defs#ruby#interpreter =~ '\<jruby'
        let g:checksyntax['ruby'].efm = 'SyntaxError in %f:%l:%m'
    endif
endif


