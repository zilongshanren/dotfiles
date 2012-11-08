" checksyntax.vim
" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @Website:     http://www.vim.org/account/profile.php?user_id=4037
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     2010-01-03.
" @Last Change: 2012-10-17.
" @Revision:    671


if !exists('g:checksyntax#auto_mode')
    " If 1, enable automatically running syntax checkers when saving a 
    " file if the syntax checker definitions has 'auto' == 1 (see 
    " |g:checksyntax|).
    " If 2, enforces automatic syntax checks for all known filetypes.
    " If 0, disable automatic syntax checks.
    let g:checksyntax#auto_mode = 1   "{{{2
endif

if !exists('g:checksyntax#debug')
    let g:checksyntax#debug = 0
endif


let s:top_level_fields = ['modified', 'auto', 'run_alternatives', 'alternatives']

if !exists('g:checksyntax')
    " A dictionary {name/filetype => definition} of syntax checkers, where 
    " definition is a dictionary with the following fields:
    " 
    " Mandatory (either one of the following):
    "   cmd ... A shell command used as 'makeprg' to check the file.
    "   exec ... A vim command used to check the file.
    "   compiler ... A vim compiler that is used to check the file.
    " 
    " Optional:
    "   auto* ... Run automatically when saving a file.
    "   efm  ... An 'errorformat' string.
    "   prepare ... An ex command that is run before doing anything.
    "   ignore_nr ... A list of error numbers that should be ignored.
    "   listtype ... Either loc (default) or qfl
    "   include ... Include another definition
    "   process_list ... Process a list of issues
    "   if ... An expression to test *once* whether a syntax checker 
    "            should be used.
    "   if_executable ... Test whether an application is executable.
    "   modified* ... If the buffer was modified, use an alternative 
    "            checker
    "   alternatives* ... A list of syntax checker definitions (the first 
    "            one with a valid executable is used. If used, no other 
    "            elements are allowed. This list is checked only once.
    "   run_alternatives* ... A string that defines how to run 
    "            alternatives (overrides |g:checksyntax#run_alternatives|).
    "
    " The keys marked with "*" can be used only on the top level of a 
    " syntax checker definition.
    "
    " Pre-defined syntax checkers (the respective syntax checker has to 
    " be installed):
    "
    "   c, cpp       ... Requires splint
    "   html         ... Requires tidy
    "   java         ... Requires jlint or checkstyle
    "   javascript   ... Syntax check; requires jslint, jshint, gjslint, or jsl
    "   lua          ... Requires luac
    "   php          ... Syntax check; requires php
    "   python       ... Requires pyflakes or pylint
    "   r            ... Requires lint::lint or svTools::lint
    "   ruby         ... Requires ruby
    "   tex, latex   ... Requires chktex
    "   viki         ... Requires deplate
    "   xhtml        ... Requires tidy
    "   xml, docbk   ... Requires xmllint
    "
    " Syntax checker definitions are kept in:
    " autoload/checksyntax/defs/{&filetype}.vim
    "
    " If |g:checksyntax#syntastic_dir| is set, syntastic's syntax 
    " checkers can be used too.
    " :read: let g:checksyntax = {...}   "{{{2
    let g:checksyntax = {}
endif


if !exists('g:checksyntax#syntastic_dir')
    " The directory where the syntastic plugin (see 
    " https://github.com/scrooloose/syntastic/) is installed.
    " If non-empty, use syntastic syntax checkers if available and if 
    " checksyntax does not have one defined for the current filetype.
    "
    " The syntastic directory does not have to be included in 
    " 'runtimepath'. Actually, using both, the syntastic and checksyntax 
    " plugin, simultaneously could cause conflicts.
    "
    " The value must not include a trailing (back)slash.
    " Optinally, the value may also point directly to the 
    " 'syntax_checkers' subdirectory.
    "
    " NOTE: Not all syntastic syntax checkers definitions are guaranteed 
    " to work with checksyntax.
    let g:checksyntax#syntastic_dir = ''   "{{{2
endif


if !exists('g:checksyntax#preferred')
    " A dictionary of 'filetype' => |regexp|.
    " If only one alternative should be run (see 
    " |g:checksyntax#run_alternatives|), check only those syntax 
    " checkers whose names matches |regexp|.
    let g:checksyntax#preferred = {}   "{{{2
endif

if !exists('g:checksyntax#run_alternatives')
    " How to handle alternatives. Possible values:
    "     first ... Use the first valid entry
    "     all   ... Run all valid alternatives one after another
    let g:checksyntax#run_alternatives = 'first'   "{{{2
endif


if !exists('*CheckSyntaxSucceed')
    " This function is called when no syntax errors were found.
    function! CheckSyntaxSucceed(type, manually)
        call g:checksyntax#prototypes[a:type].Close()
        if a:manually
            echo
            echo 'Syntax ok.'
        endif
    endf
endif


if !exists('*CheckSyntaxFail')
    " This function is called when a syntax error was found.
    function! CheckSyntaxFail(type, manually, bg)
        " TLogVAR a:type, a:manually, a:bg
        call g:checksyntax#prototypes[a:type].Open(a:bg)
    endf
endif


if !exists('g:checksyntax#prototypes')
    " Contains prototype definitions for syntax checkers that use the 
    " |location-list| ("loc") or the |quixfix|-list.
    let g:checksyntax#prototypes = {'loc': {}, 'qfl': {}} "{{{2
endif

if empty(g:checksyntax#prototypes.loc)
    function! g:checksyntax#prototypes.loc.Close() dict "{{{3
        lclose
    endf

    function! g:checksyntax#prototypes.loc.Open(bg) dict "{{{3
        " TLogVAR a:bg
        lopen
        if a:bg
            wincmd p
        endif
    endf

    function! g:checksyntax#prototypes.loc.Make(args) dict "{{{3
        exec 'silent lmake!' a:args
    endf

    function! g:checksyntax#prototypes.loc.Get() dict "{{{3
        return copy(getloclist(0))
    endf

    function! g:checksyntax#prototypes.loc.Set(list) dict "{{{3
        call setloclist(0, a:list)
    endf
endif

if empty(g:checksyntax#prototypes.qfl)
    function! g:checksyntax#prototypes.qfl.Close() dict "{{{3
        cclose
    endf

    function! g:checksyntax#prototypes.qfl.Open(bg) dict "{{{3
        copen
        if a:bg
            wincmd p
        endif
    endf

    function! g:checksyntax#prototypes.qfl.Make(args) dict "{{{3
        exec 'silent make!' a:args
    endf

    function! g:checksyntax#prototypes.qfl.Get() dict "{{{3
        return copy(getqflist())
    endf

    function! g:checksyntax#prototypes.qfl.Set(list) dict "{{{3
        call setqflist(a:list)
    endf
endif


function! s:Make(filetype, def)
    let bufnr = bufnr('%')
    let pos = getpos('.')
    let type = get(a:def, 'listtype', 'loc')
    try
        if has_key(a:def, 'compiler')

            if exists('g:current_compiler')
                let cc = g:current_compiler
            else
                let cc = ''
            endif
            try
                exec 'compiler '. a:def.compiler
                call g:checksyntax#prototypes[type].Make('')
                return 1
            finally
                if cc != ''
                    let g:current_compiler = cc
                    exec 'compiler '. cc
                endif
            endtry

        elseif has_key(a:def, 'syntastic')

            " TLogVAR a:def
            try
                call call(a:def.syntastic, [])
                return 1
            catch /^Vim\%((\a\+)\)\=:E117/
                call remove(a:def, 'syntastic')
                echom "CheckSytnax: Syntastic not supported for this filetype. Please add" a:filetype "to g:checksyntax#syntastic#blacklist (and report to the author of checksyntax.vim)"
                call add(g:checksyntax#syntastic#blacklist, a:filetype)
            endtry

        else

            return checksyntax#Make(a:def)

        endif
    catch
        echohl Error
        echom "Exception" v:exception "from" v:throwpoint
        echom v:errmsg
        echohl NONE
    finally
        " TLogVAR pos, bufnr
        if bufnr != bufnr('%')
            exec bufnr 'buffer'
        endif
        call setpos('.', pos)
    endtry
    return 0
endf


" :nodoc:
" Run |:make| based on a syntax checker definition.
function! checksyntax#Make(def) "{{{3
    " TLogVAR a:def
    let type = get(a:def, 'listtype', 'loc')
    let makeprg = &makeprg
    let shellpipe = &shellpipe
    let errorformat = &errorformat
    if has_key(a:def, 'shellpipe')
        let &l:shellpipe = get(a:def, 'shellpipe')
        " TLogVAR &l:shellpipe
    endif
    if has_key(a:def, 'efm')
        let &l:errorformat = get(a:def, 'efm')
        " TLogVAR &l:errorformat
    endif
    try
        if has_key(a:def, 'cmd')
            let &l:makeprg = a:def.cmd
            " TLogVAR &l:makeprg
            call g:checksyntax#prototypes[type].Make(get(a:def, 'args', '%'))
            return 1
        elseif has_key(a:def, 'exec')
            exec a:def.exec
            return 1
        endif
    finally
        if &l:makeprg != makeprg
            let &l:makeprg = makeprg
        endif
        if &l:shellpipe != shellpipe
            let &l:shellpipe = shellpipe
        endif
        if &l:errorformat != errorformat
            let &l:errorformat = errorformat
        endif
    endtry
endf


let s:loaded_checkers = {}

" :nodoc:
function! checksyntax#Require(filetype) "{{{3
    if empty(a:filetype)
        return 0
    else
        if !has_key(s:loaded_checkers, a:filetype)
            exec 'runtime! autoload/checksyntax/defs/'. a:filetype .'.vim'
            let s:loaded_checkers[a:filetype] = 1
            if !has_key(g:checksyntax, a:filetype) || checksyntax#RunAlternativesMode(g:checksyntax[a:filetype]) !~? '\<first\>'
                if !empty(g:checksyntax#syntastic_dir)
                    call checksyntax#syntastic#Require(a:filetype)
                endif
            endif
        endif
        return has_key(g:checksyntax, a:filetype)
    endif
endf


" :nodoc:
function! s:Cmd(def) "{{{3
    if has_key(a:def, 'cmd')
        let cmd = matchstr(a:def.cmd, '^\(\\\s\|\S\+\|"\([^"]\|\\"\)\+"\)\+')
        let cmd = fnamemodify(cmd, ':t')
    else
        let cmd = ''
    endif
    return cmd
endf


" :nodoc:
function! checksyntax#Name(def) "{{{3
    let name = get(a:def, 'name', '')
    if empty(name)
        let name = get(a:def, 'compiler', '')
    endif
    if empty(name)
        let name = s:Cmd(a:def)
    endif
    return name
endf


let s:executables = {}

function! s:Executable(cmd) "{{{3
    if !has_key(s:executables, a:cmd)
        let s:executables[a:cmd] = executable(a:cmd) != 0
    endif
    return s:executables[a:cmd]
endf


function! s:ValidAlternative(def) "{{{3
    if has_key(a:def, 'if')
        return eval(a:def.if)
    elseif has_key(a:def, 'if_executable')
        return s:Executable(a:def.if_executable)
    else
        return 1
    endif
endf


function! s:GetValidAlternatives(filetype, run_alternatives, alternatives) "{{{3
    let valid = []
    for alternative in a:alternatives
        " TLogVAR alternative
        if s:ValidAlternative(alternative)
            if has_key(alternative, 'cmd')
                let cmd = s:Cmd(alternative)
                " TLogVAR cmd
                if !empty(cmd) && !s:Executable(cmd)
                    continue
                endif
            endif
            call add(valid, alternative)
            if a:run_alternatives =~? '\<first\>'
                break
            endif
        endif
    endfor
    return valid
endf


let s:run_alternatives_all = 0

" :nodoc:
function! checksyntax#RunAlternativesMode(def) "{{{3
    let rv = s:run_alternatives_all ? 'all' : get(a:def, 'run_alternatives', g:checksyntax#run_alternatives)
    " TLogVAR a:def, rv
    return rv
endf


function! s:GetDef(filetype) "{{{3
    " TLogVAR a:filetype
    if exists('b:checksyntax') && has_key(b:checksyntax, a:filetype)
        let dict = b:checksyntax
        let rv = b:checksyntax[a:filetype]
    elseif has_key(g:checksyntax, a:filetype)
        let dict = g:checksyntax
        let rv = g:checksyntax[a:filetype]
    else
        let dict = {}
        let rv = {}
    endif
    if !empty(dict)
        let alternatives = get(rv, 'alternatives', [])
        " TLogVAR alternatives
        if !empty(alternatives)
            let alternatives = s:GetValidAlternatives(a:filetype, checksyntax#RunAlternativesMode(rv), alternatives)
            " TLogVAR alternatives
            if len(alternatives) == 0
                let rv = {}
            else
                let rv = copy(rv)
                let rv.alternatives = alternatives
            endif
        endif
    endif
    return rv
endf


" :def: function! checksyntax#Check(manually, ?bang='', ?filetype=&ft, ?background=1)
" Perform a syntax check.
" If bang is not empty, run all alternatives (see 
" |g:checksyntax#run_alternatives|).
" If filetype is empty, the current buffer's 'filetype' will be used.
" If background is true, display the list of issues in the background, 
" i.e. the active window will keep the focus.
function! checksyntax#Check(manually, ...)
    let bang = a:0 >= 1 ? !empty(a:1) : 0
    let filetype   = a:0 >= 2 && a:2 != '' ? a:2 : &filetype
    let bg   = a:0 >= 3 && a:3 != '' ? a:3 : 0
    " TLogVAR a:manually, bang, filetype, bg
    let s:run_alternatives_all = bang
    try
        call checksyntax#Require(filetype)
        let def = a:manually ? {} : s:GetDef(filetype .',auto')
        if empty(def)
            let def = s:GetDef(filetype)
        endif
        if &modified
            if has_key(def, 'modified')
                let def = s:GetDef(def.modified)
            else
                echohl WarningMsg
                echom "Buffer was modified. Please save it before calling :CheckSyntax."
                echohl NONE
                return
            endif
        endif
        " TLogVAR def
        if empty(def)
            return
        endif
        if g:checksyntax#auto_mode == 0
            let auto = 0
        elseif g:checksyntax#auto_mode == 1
            let auto = get(def, 'auto', 0)
        elseif g:checksyntax#auto_mode == 2
            let auto = 1
        endif
        " TLogVAR auto
        if !(a:manually || auto)
            return
        endif
        if !exists('b:checksyntax_runs')
            let b:checksyntax_runs = 1
        else
            let b:checksyntax_runs += 1
        endif
        " TLogVAR &makeprg, &l:makeprg, &g:makeprg, &errorformat
        let defs = get(def, 'alternatives', [def])
        let run_alternatives = checksyntax#RunAlternativesMode(def)
        if run_alternatives =~? '\<first\>' && has_key(g:checksyntax#preferred, filetype)
            let preferred_rx = g:checksyntax#preferred[filetype]
            let defs = filter(defs, 'checksyntax#Name(v:val) =~ preferred_rx')
        endif
        let use_qfl = 0
        let all_issues = []
        for make_def in defs
            " TLogVAR make_def
            let name = checksyntax#Name(make_def)
            if run_alternatives =~? '\<async\>'   " TODO: support asynchronous execution
                throw "CheckSyntax: Not supported yet: run_alternatives = ". string(run_alternatives)
            else
                let use_qfl += s:Run_sync(all_issues, name, filetype, make_def)
            endif
        endfor
        " echom "DBG 1" string(list)
        let type = use_qfl > 0 ? 'qfl' : 'loc'
        if empty(all_issues)
            call g:checksyntax#prototypes[type].Set(all_issues)
            call CheckSyntaxSucceed(type, a:manually)
        else
            " TLogVAR all_issues
            call sort(all_issues, 's:CompareIssues')
            " TLogVAR all_issues
            call g:checksyntax#prototypes[type].Set(all_issues)
            " TLogVAR type
            " TLogVAR a:manually
            " TLogVAR bg
            call CheckSyntaxFail(type, a:manually, bg)
        endif
    finally
        let s:run_alternatives_all = 0
    endtry
    redraw!
endf


function! s:CompareIssues(i1, i2) "{{{3
    let l1 = get(a:i1, 'lnum', 0)
    let l2 = get(a:i2, 'lnum', 0)
    " TLogVAR l1, l2, type(l1), type(l2)
    return l1 == l2 ? 0 : l1 > l2 ? 1 : -1
endf


function! s:Run_sync(all_issues, name, filetype, def) "{{{3
    " TLogVAR a:name, a:filetype, a:def
    let use_qfl = 0
    let def = a:def
    if has_key(def, 'include')
        let include = s:GetDef(def.include)
        if !empty(include)
            let def = extend(copy(def), include, 'keep')
        endif
    endif
    exec get(def, 'prepare', '')
    if s:Make(a:filetype, def)
        let type = get(def, 'listtype', 'loc')
        if type != 'loc'
            let use_qfl = 1
        endif
        let list = g:checksyntax#prototypes[type].Get()
        " TLogVAR type, list
        " TLogVAR 1, len(list)
        if !empty(list)
            if has_key(def, 'process_list')
                let list = call(def.process_list, [list])
            endif
            " TLogVAR 2, len(list)
            " TLogVAR type, list
            if !empty(list)
                let list = filter(list, 's:FilterItem(def, v:val)')
                " TLogVAR 3, len(list)
                " TLogVAR type, list
                if !empty(list)
                    let list = map(list, 's:CompleteItem(a:name, def, v:val)')
                    " TLogVAR type, list
                    call extend(a:all_issues, list)
                endif
            endif
        endif
    endif
    return use_qfl
endf


function! s:CompleteItem(name, def, val) "{{{3
    " TLogVAR a:name, a:def, a:val
    if get(a:val, 'bufnr', 0) == 0
        let a:val.bufnr = bufnr('%')
    endif
    let text = get(a:val, 'text', '')
    let a:val.text = substitute(text, '^\s\+\|\s\+$', '', 'g')
    let type = get(a:val, 'type', '')
    if !empty(type)
        let a:val.text = printf('[%s] %s', type, a:val.text)
    endif
    if !empty(a:name)
        let text = get(a:val, 'text', '')
        if !empty(text)
            let a:val.text = a:name .': '. text
        endif
    endif
    " TLogVAR a:val
    return a:val
endf


function! s:FilterItem(def, val) "{{{3
    if a:val.lnum == 0 && a:val.pattern == ''
        return 0
    elseif has_key(a:val, 'nr') && has_key(a:def, 'ignore_nr') && index(a:def.ignore_nr, a:val.nr) != -1
        return 0
    endif
    return 1
endf


" :nodoc:
" :display: checksyntax#CopyFunction(old, new, overwrite=0)
function! checksyntax#CopyFunction(old, new, ...) "{{{3
    let overwrite = a:0 >= 1 ? a:1 : 0
    redir => oldfn
    exec 'silent function' a:old
    redir END
    if exists('*'. a:new)
        if overwrite > 0
            exec 'delfunction' a:new
        elseif overwrite < 0
            throw 'checksyntax#CopyFunction: Function already exists: '. a:old .' -> '. a:new
        else
            return
        endif
    endif
    let fn = split(oldfn, '\n')
    let fn = map(fn, 'substitute(v:val, ''^\d\+'', "", "")')
    let fn[0] = substitute(fn[0], '\V\^\s\*fu\%[nction]!\?\s\+\zs'. a:old, a:new, '')
    let t = @t
    try
        let @t = join(fn, "\n")
        redir => out
        @t
        redir END
    finally
        let @t = t
    endtry
endf


" :nodoc:
" Define a syntax checker definition for a given filetype.
function! checksyntax#Alternative(filetype, alternative) "{{{3
    if has_key(g:checksyntax, a:filetype)
        if !has_key(g:checksyntax[a:filetype], 'alternatives')
            let odef = g:checksyntax[a:filetype]
            let g:checksyntax[a:filetype] = {'alternatives': [odef]}
            for key in s:top_level_fields
                if has_key(odef, key)
                    let g:checksyntax[a:filetype][key] = odef[key]
                endif
            endfor
        endif
        call add(g:checksyntax[a:filetype].alternatives, a:alternative)
    else
        let g:checksyntax[a:filetype] = a:alternative
    endif
endf

