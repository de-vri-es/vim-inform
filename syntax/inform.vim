" Vim syntax file for the Yaskawa Inform robot programming language.
" Language:    inform
" Maintainer:  Maarten de Vries <maarten@de-vri.es>
" License:     GPLv3
" Copyright:   2017 - Maarten de Vries <maarten@de-vri.es>
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


if exists("b:current_syntax")
  finish
endif

" Comment
syn match informComments "'.*" contains=informTodo

" Todo
syn keyword informTodo TODO contained

" Identifiers.
syn match informIdentifier "\<[a-zA-Z_][a-zA-Z0-9_]*\>" contained

" Keywords.
syn keyword informKeywords NOP END
syn keyword informKeywords IFTHEN IFTHENEXP ENDIF
syn keyword informKeywords WHILE WHILEEXP ENDWHILE
syn keyword informKeywords CALL JUMP RET
syn keyword informKeywords PAUSE ABORT JUMP

syn keyword informIdentifier SET GETS GETARG GETE SETE
syn keyword informIdentifier INC DEC ADD SUB
syn keyword informIdentifier MULMAT CNVRT
syn keyword informIdentifier MSG
syn keyword informIdentifier WAIT
syn keyword informIdentifier MOVJ MOVL MOVC MOVS MOVI

" Operators
syn keyword informOperators > = >= <= <>

" Program labels.
syn match  informLabel "^\s*[*].*"

" Integer with - + or nothing in front.
syn match informNumber '\<\d\+'
syn match informNumber '\<[-+]\d\+'

" Floating point number with decimal no E or e (+,-).
syn match informNumber '\<\d\+\.\d*'
syn match informNumber '\<[-+]\d\+\.\d*'

" Floating point like number with E and no decimal point (+,-).
syn match informNumber '\<[-+]\=\d[[:digit:]]*[eE][\-+]\=\d\+'
syn match informNumber '\<\d[[:digit:]]*[eE][\-+]\=\d\+'

" Floating point like number with E and decimal point (+,-).
syn match informNumber '\<[-+]\=\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+'
syn match informNumber '\<\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+'

syn region informtring start="\"" skip="\\" end="\""

" Link inform groups to default groups.
hi def link informComments    Comment
hi def link informTodo        Todo
hi def link informKeywords    Keyword
hi def link informOperators   Operator
hi def link informIdentifier  Identifier

hi def link informLabel       PreProc

hi def link informString      String
hi def link informBool        Constant
hi def link informNumber      Number

let b:current_syntax = "inform"
