" projtags.vim
" Brief: Set tags file for per project
" Version: 0.42
" Date: Jul. 18, 2010
" Author: Yuxuan 'fishy' Wang <fishywang@gmail.com>
"
" Installation: put this file under your ~/.vim/plugins/
"
" Usage:
"
" Set your projects path into g:ProjTags as a list, for example:
"
" let g:ProjTags = [ "~/work/proj1" ]
" 
" In this case for all file match the pattern "~/work/proj1/*", the tag file
" "~/work/proj1/tags" will be used.
"
" You can also specify a tags file other than the default one or more tags
" files for one directory by a list:
"
" let g:ProjTags += [[ "~/work/proj2", "~/work/proj2/tags",
" "~/work/common.tags" ]]
" 
" In this case for all files match the pattern "~/work/proj2/*", the tag files
" "~/work/proj2/tags" and "~/work/common.tags" will be used.
"
" If one of the items in the list begins with ":", it will be treated as a
" command (other than tag file):
"
" let g:ProjTags += [[ "~/work/proj3", "~/work/proj3/tags",
" ":set shiftwidth=4" ]]
"
" In this case for all files match the pattern "~/work/proj3/*", the tag file
" "~/work/proj3/tags" will be used, and "shiftwidth=4" will be set.
"
" Please note that if you use "set" in the command, we will actually use
" "setlocal" instead, to avoid polluting the whole vim environment.
"
" You can add the above codes into your vimrc file
"
" Revisions:
"
" 0.42, Jul. 18, 2010:
"  + added missing "let" thanks to Adam!
"
" 0.41, Nov. 10, 2010:
"  * a serious bug regarding the return value of match() fixed thanks to ramp!
"
" 0.4, Mar. 2, 2010:
"  + can handle directories end with "/" now
"
" 0.3, Jul. 31, 2009:
"  + can add commands now
"
" 0.2, Apr. 25, 2007:
"  + more tags file for one directory support (contributed by Joseph Barker)
"  + check for g:ProjTags before use it
"
" 0.1, Apr. 24, 2007:
"  * initial version
"

function! SetProjTags()
	if exists("g:ProjTags")
		for item in g:ProjTags
			try
				let [filepattern; tagfiles] = item
				if match(filepattern, "\/$") == -1
					let filepattern .= "/"
				endif
				let filepattern .= "*"
			catch /.*List.*/ " item is not a list
				if match(item, "\/$") == -1
					let item .= "/"
				endif
				let filepattern = item . "*"
				let tagfiles = [item . "tags"]
			endtry
			for tagfile in tagfiles
				if match(tagfile, "^:") != -1
					let cmd = substitute(tagfile, "^:set ", ":setlocal ", "")
					execute 'autocmd BufEnter ' . filepattern . ' ' . cmd 
				else
					execute 'autocmd BufEnter ' . filepattern . ' :setlocal tags+=' . tagfile 
				endif
			endfor
			unlet item
		endfor
	endif
endfunc

call SetProjTags()

