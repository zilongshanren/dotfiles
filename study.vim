" copy all this into a vim buffer, save it, then...
" source the file by typing :so %
" Now the vim buffer acts like a specialized application for mastering vim

" There are two queues, Study and Known.  Depending how confident you feel
" about the item you are currently learning, you can move it down several
" positions, all the way to the end of the Study queue, or to the Known
" queue.

" type ,, (that's comma comma)
" You know the command pretty well, but not enough to move it to 'Known'.
" ,, moves the current command to the bottom of the 'Study' queue.
nmap ,, ^v/^$<cr>dma/^= Known<cr>P'azt<c-y><c-l>

" type ,c (that's comma c)
" You don't really know the command at all and want to see it again soon.
" ,c moves the current command down a several positions in the 'Study' queue
" so you'll see it again soon.
nmap ,c ^v/^$<cr>dma/^$<cr>/^$<cr>/^$<cr>/^$<cr>jP'azt<c-y><c-l>:noh<cr>

" type ,k (that's comma k)
" You have the command down cold.  Move it to the 'Known' queue.
" ,k moves the current command into the 'Known' queue.
nmap ,k ^v/^$<cr>dma/^= Known<cr>jjP'azt<c-y><c-l>

" Ok, it's time to get this party started.  Move to the top of the study queue
" and go for it!
/^= Study
normal jztj
nohls

" This line keeps the rest of the file from being treated as vimscript
finish

-----------------------------------------------------------------------------

= Study

-
in normal mode, how do you move to the first non-whitespace character of the previous line

+
in normal mode, how do you move to the first non-whitespace character of the next line

g`"
how do you nondestructively move back to the last position when the buffer was closed

:help shell<TAB>
how can you see what *all* the commands starting with 'shell' when considering getting help

:!mkdir -p %:h
if you have a file that you can't save because its directory doesn't exist, how can you create that directory from the path component of the file?

:set textwidth=78
how do you make vim hard wrap at 78 chars?

:s/\v([a-z])([A-Z])/\1_\L\2/g
turn camelCase into snake_case

:s/\%V\v([a-z])([A-Z])/\1_\L\2/g
turn camelCase into snake_case (in only the visually selected part of the line)

:s/\v_([a-z])/\u\1/g
turn snake_case into camelCase

:s/\%V\v_([a-z])/\u\1/g
turn snake_case into camelCase (in only the visually selected part of line)

:'<,'>normal @q
run the macro recorded into the q register on all selected lines (the '<,'> is automatically added)

:let @q="2dw"
easily fill the q register with a macro that deletes two words

norm
what's a good shorthand for "normal" on the #vim_command_line

:argdo norm @q
run your last macro against all files in the args

:.,. w !sh
execute the contents of the current line in the current file in sh

<c-]>
if you have ctags working correctly, how do you jump to the definition of a function?

<c-t>
if you've made a ctag jump, how can you jump back other than <c-o>?

gi
if you left insert mode to go look at something elsewhere in the file, how can you get back to where you were and also back into insert mode?

:tag save
if you want to look up the definition of save using ctags

:w !sh
run the visually selected lines in the shell (not run as a filter)

g?(some movement)
rot13 the text selected by some movement

:all
open in window for each file in the arguments list

:args
display the argument list

:reg<enter>
show the contents of all registers

:tj<enter>
jump to tag on top of tag stack

:reg a<enter>
show the contents of register a

:10,30!wc<enter>
filter lines 10-30 through an external command (in this case wc)

<c-v>8
insert the character represented by the ASCII value 8

:43,45d<enter>
delete lines 43-45 (can specify any range before the d)

H
go to the top of the screen

"a20yy
add the next 20 lines to the 'a' register

g~(some movement)
switch case for movement command

o
in visual mode, exchange cursor position with the start/end of highlighting

!10jwc<enter>
filter the next 10 lines through an external command (in this case wc)

20!!wc<enter>
filter the next 20 lines through an external command (in this case wc)

20H
go to the line that is 20 lines below the line that is currently the top of the window

M
go to the middle of the window

L
go to the bottom of the window

10L
go to the tenth line from the bottom of the window

20%
go to the line that is 20% of the way down in the file

`a
go to the exact position of mark a (not just the beginning of the line like 'a)

<c-d>
Go down half a screen

<c-u>
Go up half a screen

0
move to the start of the line (before whitespace)

<c-g>
see location in file and file status

:set ignorecase (or :set ic)
ignore case when searching

R
enter replace mode to repeatedly replace the character under the cursor

:w filename
write the visually selected text to a file

e
Go to end of (next) word

ge
Go to end of previous word

U
restore last changed line

:set relativenumber
show the line numbers relative to the current cursor position

g*
Forward find word under cursor (fuzzy)

g#
Backward find word under cursor (fuzzy)

#
Backward find word under cursor

some_command | vim -R -
when in the shell, you can use vim as a pager by piping STDIN to it and putting it in readonly mode

:set cursorline
highlight the entire line the cursor is on

Q
when in normal mode, how do you enter into Ex mode (to do extended work in the #vim_command_line)

/usr/share/vim
in Ubuntu, which folder has the default, system-wide vim files

:map ,, :w\|:!ruby %
how would you map ,, to writing the current buffer, then running it with ruby

:!!
repeat the last :! command

:set colorcolumn=78
in vim 703 and above, how do you specify that you'd like column 78 to be colored, so that you can see whether you are passing an ideal width

text objects
what do you call the higher level contexts than editing character by character?

readline vi mode (tagged as #readline_vi_mode)
what's it called when you use vim as your line editor in the shell?

v
how do you open an editor while the shell is in #readline_vi_mode

g_
move to the last non-whitespace character on a line

bindkey -v
in zsh, how can you use #readline_vi_mode?

ciw
change a word without necessarily being selected on the first letter of the word

daw
change the phrase "foo hello" to just "hello" (with cursor located at f*oo hello)

<esc>v
if you're using vim as your line editor, how can you turn it in to a full vim session

yy@"
execute the vim code in the current line.  To execute it in the shell, type :! at the beginning of the line

mA
mark: set a mark in the 'A' register (globally)

gu
make the selected text lower case

gU
make the selected text upper case

<c-r>"
paste yanked text into the #vim_command_line

'A
mark: return to a globally set mark, even if in another buffer

<c-x><c-l>
line completion

<c-i>
move forward in the jump list

<c-o>
move backward in the jump list

gf
open file under the cursor

:%s/\r//g
remove all those nasty ^M characters from the end of each line in a file

=
autoindent lines already selected in visual mode

==
autoindent current line

<c-o>
in insert mode switch to normal mode for one command

gqap
format the current paragraph

:jumps
list your movements

:history
list your recent commands

guu
lower case the whole line

gUU
upper case the whole line

display hex and ASCII value of character under cursor
ga

g8
display hex value of utf-8 character under cursor

ggg?G
rot13 whole file

'.
jumps to last modified line

`.
jumps to exact position of last modification

:h slash<c-d>
list all help topics containing the word "slash"

g;
go backward in the change list in a file

g,
go forward in the change list in a file

"ayy
yank the current line into register "a"

:set fdm=syntax
fold: make folding use syntax

:set nofoldenable
fold: turn off folding

:set foldenable
fold: turn on folding (if it has been turned off)

zj
fold: moves the cursor to the next fold

zk
fold: moves the cursor to the previous fold

[z
fold: move to start of current open fold

]z
fold: Move to end of current open fold

:map <f6>
show what is currently mapped to <f6>

:map
show all the mappings

:reg
show the content of all registers

:43,45 ce 80<enter>
center the lines from 43 to 45 within an 80 char width

zr
fold: decrease the fold level by one

aw
in visual mode, select a whole word

as
in visual mode, select a whole sentence

zm
fold: increase the fold level by one

<c-6>
toggle between last two buffers

gm
go to the center of the screen on the current line

]p
Paste below the current line, adjusting indentation to match current line

gP
paste register above current line, leaving cursor after new text

gp
paste register below current line, leaving cursor after new text

<c-r>a
insert the content of register a while in insert mode

[p
Paste above the current line, adjusting indentation to match current line

:%norm @x
Execute the macro recorded in register x on all lines of the current file

:norm @x
Execute the macro recorded in register x on a visually selected set of lines

<c-r>=5*5
in the #vim_command_line and in insert mode, insert the result of a 5*5 calculation

gk
move cursor one *screen* line up, regardless of line wrapping

gj
move cursor one *screen* line down, regardless of line wrapping

qQ ... added commands ... q
append more commands to a pre-existing @q register macro

:Rextract _partial_name.erb
rails.vim: extract some functionality into a partial

:Rintegrationtest
open the cucumber feature with that name [tag:setup_specific:gem]

<c-p>
(while searching or ex mode) do previous search or command

<c-n>
(while searching or ex mode) do next search or command

<c-f>
(while searching or ex mode) see previous searches or commands

:%s/forward//gn
count the number of occurrences of "forward" in a file

q:
see previous commands in a "command-line window"

q/
see previous searches

{
back a paragraph

}
forward a paragraph

(
back a sentence

)
forward a sentence

%
find matching parenthesis

J
join two lines

gq
reformat the selected text

xp
transpose two letters (delete and paste, technically)

e
move to the end of the word

ea
append at end of word

w
move the cursor forward by a word

b
move the cursor backward by a word

<c-v>
in insert or the #vim_command_line this turns the next thing typed into a literal

:set spell
Switch on spell checking

<c-x><c-s>
in insert mode correct the spelling of the current word

<c-v>jjjI//<esc>
block comment the next three JavaScript lines

"+y
copy the current selection to a clipboard where other programs can use it

ci"
change all the words in between two quotes

/<c-r><c-w>
switch to search command mode, then copy in the word under the cursor

:cn
Go to the next item in the quickfix list

:cp
Go to the previous item in the quickfix list

i<c-r>:
insert last #vim_command_line command

i<c-r>/
insert last search command

:10,30w foo.txt
write lines 10-30 to a file named foo.txt

:10,30w>>foo.txt
append lines 10-30 to a file named foo.txt

:r !ls
insert results of ls external command below cursor

:r file
insert content of file below cursor

&
repeat last substitution

:bm
go to next modified buffer

:w !sudo tee %
save the current file as root (in case you opened it up without sudo accidentally and made changes to it)

<c-r>:
in Ex mode, insert the last command

<c-y>
In insert mode, insert the character right above the cursor

<c-u>
In insert mode, delete the current line from the cursor position to the beginning of the line

<c-a>
In insert mode, re-insert the text inserted in the previous insert session

<c-r>/
in Ex mode, insert the last search

<c-f>
When typing something into the #vim_command_line, switch to the editable command-line mode where the command line becomes a fully vim-compatible text area

o
when in a visual selection, which key will toggle to the other end of the selection?

:h i_CTRL-R
get help for how control r is used in insert mode

:h c_CTRL-R
get help for how control r is used in command mode

:s/\%V //g
remove all the spaces from the current visual selection, which is only a partial line, not a full line

:retab
if expandtab is set, this will change all the tabs to spaces, expanding them as appropriate

<c-w>_
maximize size of window split

I
insert at the beginning of the line

gv
remark area that was just marked

ZZ
same as :wq

<c-l>
redraw the screen

<c-x><c-f>
completes using filenames from the current directory.

<c-v>
block selection (column editing)

zo
fold: open a fold at the cursor

D
delete to the end of the line

C
change to the end of the line

:so $MYVIMRC
reload the vimrc file (or ":so %" if you happen to be editing the file)

A
append at the end of the line

<c-x>
decrement a number on the same line when in normal mode (can be used with n before it)

<c-a>
increment a number on the same line when in normal mode (can be used with n before it)

m
NERDTree: opens the filesystem menu for a file, allowing you to remove, rename, etc

ma
mark: set a mark in the 'a' register in the current buffer

`a
mark: return to the 'a' mark in the current buffer

<c-i>
next

<c-o>
old

~
uppercase or lowercase the character under the cursor

.
repeat the last command

<c-w><c-w>
switch between windows

[I
show lines containing the word under the cursor

redir @a
redirect the output of an Ex command into buffer a

g?
reverse the characters in a visual selection

:gui
switch to the gui version

:g/foo/p
list all the matches with prepended line numbers in ex command output

<c-a>
insert previously inserted text (in insert mode)

<c-w>
delete word before cursor in insert mode

<c-u>
delete all inserted text on the line (in insert mode)

:echo line('.')
in the #vim_command_line, echo the current line number

va(
visually select *around* a set of parentheses.  Try it by moving the cursor (somewhere in here) and trying it

redir @a | :g/someregex/
Capture the lines that match a certain regex into the @a register for pasting

rm /tmp/clip.txt ; vim -c "normal \"+p" -c "wq" /tmp/clip.txt
Save the contents of the clipboard to a file by opening, pasting into, and closing vim.

gD
go to the first occurrence in the file of the word under the cursor

gj
go to next visual line, even if text wrapped

%s/\v(.*\n){5}/&\r
insert a blank line every 5 lines

''
go to the position before the latest jump

Fx
move the cursor backward to the previous occurrence of the character x on the current line.

<c-b>
scroll back one page

:undolist
list the leaves in the tree of the undo changes

g+
go to a newer text state (like <c-r>, but will move forward through all text states on multiple undo branches)

g-
go to an older text state (like <c-r>, but will move backwards through all text states on multiple undo branches)

fx
move the cursor forward to the next occurrence of the character x on the current line

Tx
move the cursor backward to right before the previous occurrence of the character x on the current line.

<c-w>x
exchange the window with the next window (like if you split a new buffer into the wrong window location)

M
move the cursor to the middle of the screen

zt
scroll current line to top of page

tx
same as fx, but moves the cursor to right before the character, not all the way to it.

<c-f>
scroll forward one page

zz
move current line to middle of page

;
repeat the last f/F/t/T command you gave

<c-e>
scroll one line up

<c-y>
scroll one line down

]m
forward to start of next method

[m
backward to start of previous method

zh
scroll one character to the right

zl
scroll one character to the left

zH
scroll half a screen to the right

zL
scroll half a screen to the left

zb
scroll current line to bottom of page

set -o vi
in a the bash shell, how can you use #readline_vi_mode?

<c-t>
return from tag jump.  For example, in help, if you've followed a link, how do you go back?

<c-]>
jump to tag under cursort (for example, following a link in help)

K
look up the word under the cursor in man

tabularize
What's the name of a plugin that will help you align stuff

VG:norm @x
replay a vim macro recorded into register x on all lines between the current line and the bottom of the buffer

%g/foo/s/bar/xxx/g
On every line containing foo *anywhere* in the line (before or after the bar), replace every occurrence of bar with xxx

:'<,'>!uniq | sort
With some lines selected, how can I run them through external commands, substituting the result?

:put =@%
insert the file directory/filename for the current file into the buffer

"Ayy
Append the yank of the current line into the 'a' buffer

%v/bar/m$
move every line that *does not* contain bar to the end of the file

:verb set ballooneval?
how can you check who last set ballooneval

%s/\v("[a-z_]+"): /\1 => /g
replace "foo": with "foo" => (to turn JSON into acceptable Ruby)

%s/\v +$//g 
remove trailing spaces from all lines

cs"'
how would you change the text "foo hello there" to 'foo hello there' using vim-surround?

:cold
show the older error list in the quickfix window (error lists are referred to as being in the quickfix stack)

:cnew
show the newer error list in the quickfix window (error lists are referred to as being in the quickfix stack)

@:
repeat the last command-line

"_dd ("_ is the black hole buffer)
delete a line without overriding the buffer

<c-w><enter>
open the file listed in quickfix in a horizontal split

:g/^/m0
reverse the vertical order of all the lines

:only
if you have a bunch of windows open, close all the other windows, making the current window the only window

vim +NERDTree
From the shell command line (not vim's command line) how can you easily run a vim command?

:AS
with rails.vim, how do you open the rspec tests when you are in a model?

&
repeat last substitution

ds"
if you have the surround plugin, how would you remove the double quotes from "hello" when inside it?

vim filename -c 'execute "normal \<C-x>"'
how can you decrement the first number on the first line of the file? (how would you property escape the <c-x>?)

/\cruby
do a case-insensitive search for ruby (the \c can be anywhere, including at the end)

= Known

:wq
write the file and quit.  This is basically here just so that there's something in the "Known" queue.
