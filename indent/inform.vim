" Vim filetype plugin file for the Yaskawa Inform robot programming language.
" Language:     inform
" Maintainer:   Maarten de Vries <maarten@de-vri.es>
" License:      GPLv3
" Copyright:    2017 - Maarten de Vries <maarten@de-vri.es>
"
" This program is free software: you can redistribute it and/or modify
" it under the terms of the GNU General Public License as published by
" the Free Software Foundation, either version 3 of the License, or
" (at your option) any later version.

" This program is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
" GNU General Public License for more details.

" You should have received a copy of the GNU General Public License
" along with this program.  If not, see <http://www.gnu.org/licenses/>.

if exists("b:did_indent") | finish | endif
let b:did_indent = 1

setlocal nolisp
setlocal indentexpr=GetInformIndent(v:lnum)
setlocal indentkeys=:0$,o,O,=else,=elif,=end
setlocal nosmartindent

if exists("*GetInformIndent")
	finish
endif

let s:keepcpo= &cpo
set cpo&vim

function GetInformIndent(lnum)
	" Search backwards for the previous non-empty line that is not a program label.
	let prev_lnum = a:lnum
	while prev_lnum >= a:lnum - 50 && prev_lnum >= 0
		let prev_lnum = prevnonblank(prev_lnum - 1)
		let prev_line = getline(prev_lnum)
		if prev_line !~ '^\$'
			break
		endif
	endwhile

	let prev_indent = indent(prev_lnum)
	let line        = getline(a:lnum)

	" Program labels may not be indented.
	if line =~ '^\s*\$'
		return 0
	endif

	" If this is the first line, use 0 indent.
	if prev_lnum == 0
		return 0
	endif

	" Extra indent to add.
	let add_indent = 0

	" Indent after control flow statements.
	if prev_line =~ '^\s*\(IFTHEN\|\IFTHENEXP\|WHILE\|WHILEEXP\|ELSE\|ELSEIF\|ELSEIFEXP\)\>'
		let add_indent = add_indent + shiftwidth()
	endif

	" Unindent elif/else/end.
	if line =~ '^\s*\(ELSE\|ELSEIF\|ELSEIFEXP\|ENDIF\|ENDWHILE\)\>'
		let add_indent = add_indent - shiftwidth()
	endif

	return prev_indent + add_indent
endfunction

let &cpo = s:keepcpo
unlet s:keepcpo
