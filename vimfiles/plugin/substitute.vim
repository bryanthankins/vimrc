""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" substitute.vim -- mappings for the s/// command
" 
" Author: Anders Thøgersen
" Last Change: 27-Sep-2005
" Version:     1.04
"
" Licence: This program is free software; you can redistribute it and/or modify
" it under the terms of the GNU General Public License. See
" http://www.gnu.org/copyleft/gpl.txt 
"
" Download From:
" http://www.vim.org/scripts/script.php?script_id=1167
" 
" Description:
" Visual and normal mode mappings for easy access to substitutions with the
" s/// command.
" 
" This script will make it easy to replace the word under the cursor, or the
" visually selected text across the whole file. If more than one line is
" selected the substitution will only occur on the selected lines.
" 
" History:
" 
" 1.04 - Added a separate helpfile and the possibility of customizing 
"        mappings and the register that the script uses.
" 
" 1.03 - Simplified the mapping a bit. Marking register ' was not needed.
" 
" 1.02 - Changed the meaning of the ;' mapping, and added <unique> to the map
"        definitions.  Added the Escape function so $ and ^ are only escaped when they
"        appear at the beginning, or at the end.  Also added cpoptions check and <SID>
"        stuff.
" 
" 1.01 - Removed unuseful mapcheck.
" 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists('loaded_substitute') || &cp
  finish
endif
let loaded_substitute = 1

let s:savedCpo = &cpoptions
set cpoptions&vim

" Configuration
if !exists("g:substitute_PromptMap")
	let g:substitute_PromptMap = ";'"
endif
if !exists("g:substitute_NoPromptMap")
	let g:substitute_NoPromptMap = ';;'
endif
if !exists("g:substitute_Register")
	let g:substitute_Register = '9'
endif

" define the mappings 
exe 'nnoremap <unique> '. g:substitute_NoPromptMap .' yiw:let @'. g:substitute_Register ."=':%'.<SID>SubstituteAltSubst(@\", 'g')<Cr>@". g:substitute_Register
exe 'nnoremap <unique> '. g:substitute_PromptMap   .' yiw:let @'. g:substitute_Register ."=':%'.<SID>SubstituteAltSubst(@\", 'gc')<Cr>@". g:substitute_Register
exe 'vnoremap <unique> '. g:substitute_NoPromptMap .' <ESC>gvy:let @'. g:substitute_Register ."=<SID>SubstituteVisualAltSubst(@\", 'g')<Cr>@". g:substitute_Register
exe 'vnoremap <unique> '. g:substitute_PromptMap   .' <ESC>gvy:let @'. g:substitute_Register ."=<SID>SubstituteVisualAltSubst(@\", 'gc')<Cr>@". g:substitute_Register
cnoremap <unique> <C-R><C-R> <C-R>"

" Remove the default key sequences
unlet g:substitute_Register
unlet g:substitute_PromptMap
unlet g:substitute_NoPromptMap

fun! <SID>SubstituteAltSubst(txt, flags)
	let d = s:GetSubstDelimiter(a:txt)
	let mv = '€kl€kl'
	if a:flags == 'gc'
		let mv = mv . '€kl' 
	endif
	if strlen(a:txt)==0
		let mv = mv . '€kl'
	endif
	let @" = s:Escape(a:txt) 
	return 's' .d . @" .d .d . a:flags . mv 
endfun

fun! <SID>SubstituteVisualAltSubst(txt, flags)
	let mv = '€kl€kl€kl'
	if a:flags == 'gc'
		let mv = mv . '€kl' 
	endif
	if line("'<")!=line("'>") || (line("'<")==line("'>") && col("'<")==1 && col("'>")==col("$"))
		let d = s:GetSubstDelimiter(a:txt)
		return ":'<,'>s" .d .d .d . a:flags . mv
	else
		return ':%' . <SID>SubstituteAltSubst(a:txt, a:flags)	
	endif
endfun

" feel free to add more :-)
fun! <SID>GetSubstDelimiter(txt)
	if stridx(a:txt, '/') == -1
		return '/'
	elseif stridx(a:txt, ':') == -1
		return ':'
	elseif stridx(a:txt, '#') == -1
		return '#'
	elseif stridx(a:txt, ';') == -1
		return ';'
	elseif stridx(a:txt, '!') == -1
		return '!'
	else 
		return '*'
	endif
endfun

" escape as little as possible
fun! <SID>Escape(txt)
	let esc = '\\.~[]'
	if stridx(a:txt, '$') == (strlen(a:txt) -1)
		let esc = esc . '$'
	endif
	if stridx(a:txt, '^') == 0
		let esc = esc . '^'
	endif
	if stridx(a:txt, '*') > 0
		let esc = esc . '*'
	endif
	return escape(a:txt, esc)
endfun

let &cpoptions = s:savedCpo

