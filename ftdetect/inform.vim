" File type detection for the Yaskawa Inform robot programming language.
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

au BufRead,BufNewFile *.JBI set filetype=inform
