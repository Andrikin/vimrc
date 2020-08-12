" substitute.vim - %s///g in another way
" Autor: André Alexandre Aguiar
" Version: 0.1
" Dependences: traces.vim
" TODO: change file to andrikin folder, getline("'<", "'>"), getpos("'<"), '[ and '} get by using operatorfunc option with g@. WHO GET LIVE PREVIEW WHEN SUBSTITUING? MAKE IT WITHOUT LIVE PREVIEW!!!!!

if exists("g:loaded_awesome_substitute")
  finish
endif
let g:loaded_awesome_substitute = 1

let s:save_cpo = &cpo
set cpo&vim

function! s:save_curpos() abort
	return getcurpos()
endfunction

function! s:restore_curpos(cursorposition) abort
	call setpos('.', a:cursorposition) 
endfunction

function! s:get_input() abort
	return input('word: ')
endfunction

" Get word under cursor
function! s:n_substitute(mode, input) abort
	let tick = '`'
	if a:mode == 'line'
		let tick = "'"
	endif
	execute ":" . tick . "[," . tick . "]s:\\<" . expand("<cword>") . "\\>\\C:" . a:input . ":g"
endfunction

function! s:v_substitute(mode, input) abort
	let tick = '`'
	if a:mode !=# 'v' && a:mode !=# 'V'
		return
	elseif a:mode ==# 'V'
		let tick = "'"
	endif
	execute ":" . tick . "<," . tick . ">s:\\<" . expand("<cword>") . "\\>\\C:" . a:input . ":g"
endfunction

function! s:spreadtheword(mode) abort
	let curpos = s:save_curpos()
	let input = s:get_input()
	" treat mode
	if strlen(a:mode) > 1
		call s:n_substitute(a:mode, input)
	else
		call s:v_substitute(a:mode, input)
	endif
	" restore cursor position
	call s:restore_curpos(curpos)
endfunction

" maps
nnoremap <script> <buffer> <silent> <plug>AwesomeSubstitute :<c-u>set operatorfunc=<SID>spreadtheword<cr>g@
vnoremap <script> <buffer> <silent> <plug>VAwesomeSubstitute :<c-u>call <SID>spreadtheword(visualmode())<cr>

nmap s <plug>AwesomeSubstitute
vmap s <plug>VAwesomeSubstitute

let &cpo = s:save_cpo
