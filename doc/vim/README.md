


#Vim (very) quickstart

Open this file with `vim README.md`, read the explanations and play around with the commands you learn.

# Exit Vim?
To exit Vim, press `:qa` (or just press C-c and vim will remind you of this).
`:q`: close file (buffer) without saving
`:w`: write changes (save)
`:wq`: write changes and exit
`:q!`: exit (and ignore changes)


# Ctrl Z
`u`: undo previous change
`C-r`: redo change

# Motions: moving the cursor around

## "Arrow" motions

`h/l`: move left/right by one character
`j/k`: move down/up by one character

this is also used to move around in some menus

## "Word" motions

`w/b`: beginning of (w)ord forward/backward
`W/B`: beginning of camelCasw or snake_case (w)ord forward/backward
`e`: (e)nd of word

## "Search" motions

`t/T<character>`: move forward/backward un(t)il character (mnemo: until)
`f/F<character>`: move forward/backward to character (mnemo: find)
`*`: jump to next occurence of word under cursor

## Line motions
`0`: move to beginning of the line
`$`: move to end of the line
<number>G: move to line number <number>

## Factor
Most motions can easily be repeated simply writing a number before it. A few examples:
`4j`: move 4 lines down
`5l`: move 5 characters left
`12b`: move 12 words backward
`3W`: move 3 camel/snake_case words forward
`2fx`: move to 2nd occurence of character x

# Modes

## Normal
This is the default mode that you'll use for what you spend most of your time: moving around code/text.
From any mode, use `Escape` or `C-[` to come back to normal mode; from insert mode, pressing `jk` fast also comes back to normal mode

## Insert

mode for writing text normally

`i`: enter insert mode at current cursor location (insert)
`a`: enter insert mode after current cursor location (append)
`I`: enter insert mode at the beginning of the line
`A`: enter insert mode at the end of the line

## Visual

mode for visually selecting text (as you do with the mouse)
in visual mode, move around with normal mode motions
`v`: enter visual mode
`V`: enter visual mode and select current line

# Actions/verbs
`d`: delete (and store to register: think of mouse "cut")
`y`: copy (yank) text to register
`p`: paste text from register
`c`: delete and enter insert mode (change)

`x`: delete character under cursor
`r`: replace character under cursor

# Talking Vim
The whole concept of Vim is to combine actions and motions to talk with Vim. A few examples:
`d4w`: *d*elete *4* *w*ords (forward)
`y2ts`: *y*ank *un*t*il 2*nd occurence of *s* *w*ords (forward)
`cf,`: change (delete and enter insert mode) text from cursor to next occurence of *,* (useful for e.g. changing )

# Completion
To use the auto complete menu you see below the cursor:
`C-n`: next item (same as arrow down)
`C-p`: previous item (same as arrow up)
<enter>: accept completion


# Time Travel
Every you make the cursor jump somewhere, this location is stored in a jump list.
`C-o`: previous cursor location in jump list
`C-i`: next cursor location in jump list

# Move around buffers/tabs
Very simple: you remember the Vim motions hjkl? Press Control and those keys to move around buffers,
and it has Tmux integration to seamlessly navigate Tmux and vim panes.
`C-h`: buffer left
`C-j`: buffer down
`C-k`: buffer up
`C-l`: buffer right

# Be code smart
## Navigation
`<space>gd`: go to current variable/function definition
`<space>gd`: go to current variable/function definition

# File navigation
`<F2>`: toggle file explorer
`<space>ff`: open a popup menu to search files by name
`<space>fb`: open a popup menu to search opened files
`C-f`: open live search in all files by word

# Buffer navigation
`J`: previous buffer (left in the tab list)
`K`: next buffer (left in the tab list)

# Git
TODO

# Extra
## Change case of text
Select text with (v)isual mode
Press `u`/`U` to change selected text case to lower/upper case

# On your own
## Getting help
Vim documentation is pretty extensive, and very easily accessible.
Type `:help <whatever>` to open the documentation.
Google is obviously always your friend.

There is much more to Vim than this short introduction. If you're interested:
- learn the very basics by running `vimtutor` in a terminal
- learn the main features and tricks to get faster with `:help user-manual`
