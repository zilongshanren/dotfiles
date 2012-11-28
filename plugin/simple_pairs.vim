if !has('python')
    s:ErrMsg( "Error: Required vim compiled with +python" )
    finish
endif

python << endpython
import vim
pairs = {'(': ')', '[': ']', '{': '}', '"': '"', "'": "'"}
def getNextChar():
    'returns next char or None, for end of line'
    (row, col) = vim.current.window.cursor
    line = vim.current.buffer[row-1]
    if len(line) == col:
        return None
    return line[col]

def getPrevChar():
    'returns prev char or None, for start of line'
    (row, col) = vim.current.window.cursor
    line = vim.current.buffer[row-1]
    if col == 0:
        return None
    return line[col - 1]

def isEmptyPair():
    'returns true if the cursor is inside an empty pair'
    prev, next = getPrevChar(), getNextChar()
    if None in (prev, next): return False
    return pairs.get(prev, None) == next

endpython
function! s:InsertPair(c)
python << endpython

c = vim.eval("a:c")
matchingPair = pairs[c]
nextChar = getNextChar()
if nextChar == None:
    insertPair = True
else:
    insertPair = (nextChar == matchingPair # to nest pairs
                  or nextChar in " ,:.")
if insertPair:
    result = "%s%s" % (c, matchingPair)
else:
    result = c
vim.command("let l:result = %r" % result) 
vim.command("let l:pair = %d" % (insertPair and 1 or 0))

endpython

    if l:pair == 1
        let l:result .= "\<Left>"
    endif
    return l:result
endfunction

function! s:ClosePair(c)
python << endpython

c = vim.eval("a:c")
stepOver = getNextChar() == c 
vim.command("let l:stepOver = %d" % (stepOver and 1 or 0))

endpython

if l:stepOver == 1
    let l:result = "\<Right>"
else
    let l:result = a:c
endif
return l:result
endfunction

function! s:Backspace()
python << endpython
vim.command("let l:inside = %d" % (isEmptyPair() and 1 or 0))
endpython

if l:inside == 1
    return "\<BS>\<Del>"
endif    
return "\<BS>"
endfunction

python << endpython
for open, close in pairs.items():
    vim.command("inoremap <silent> %s <C-R>=<SID>ClosePair(%r)<CR>" % (close, close))
    vim.command("inoremap <silent> %s <C-R>=<SID>InsertPair(%r)<CR>" % (open, open))
endpython
inoremap <silent> <BS> <C-R>=<SID>Backspace()<CR>

