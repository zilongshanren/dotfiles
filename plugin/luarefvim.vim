" luarefvim plugin
" This is somewhat based on CRefVim
" Maintainer: Luis Carvalho <lexcarvalho@gmail.com>
" Last Change: Jun, 3, 2005
" Version: 0.2

" initial setup: avoid loading more than once
if exists("loaded_luarefvim")
	finish
endif
let loaded_luarefvim = 1

" mappings:
vmap <silent> <unique> <Leader>lr y:call <SID>LookUp('<c-r>"')<CR>
nmap <silent> <unique> <Leader>lr  :call <SID>LookUp(expand("<cword>"))<CR>
map <silent> <unique> <Leader>lc :help luaref<CR>

function <SID>LookUp(str)
	if a:str == "--" "comment?
		silent! execute ":help lrv-comment"
	elseif a:str == ""
		silent! execute ":help luaref"
	else
		silent! execute ":help lrv-" . a:str
		if v:errmsg != ""
			echo "luarefvim: \`" . a:str . "\' not found"
		endif
	endif
endfunction

