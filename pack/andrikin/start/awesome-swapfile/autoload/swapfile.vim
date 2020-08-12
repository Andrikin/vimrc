let s:cpo_save = &cpo
set cpo&vim

function! swapfile#handle_swapfile(file) abort
	if s:detect_window(a:file)
		call s:switch_window(a:file)
		let v:swapchoice = 'q'
		" call swapfile#echo_message('Switched to existing session!')
	elseif getftime(v:swapname) < getftime(a:file)
		call delete(v:swapname)
		let v:swapchoice = 'e'
		" call swapfile#echo_message('Old swapfile detected and deleted!')
	else
		let v:swapchoice = 'o'
		" call swapfile#echo_message('Swapfile detected. Opening read-only!')
	endif
endfunction

" Return false (0) or true (1)
function! s:detect_window(file) abort
	let l:id = s:get_id_window(a:file)
	return l:id =~ '0x'
endfunction

function! s:switch_window(file) abort
	let l:id_window = s:get_id_window(a:file)
	call system('bspc node ' . l:id_window . ' --focus --activate')
endfunction

function! s:get_id_window(file) abort
	let l:id = system('for id in $(bspc query -N); do if xtitle "$id" | grep "' . fnamemodify(a:file,":t") . '.*VIM" > /dev/null 2>&1; then id_found="$id"; break; fi; done; printf "$id_found"')
	return l:id =~ '0x' ? l:id : ''
endfunction

" function! s:echo_message(message) abort
" 	autocmd BufWinEnter * ++once echohl ErrorMsg |
" 				\ echom a:message |
" 				\ echohl None
" endfunction

let &cpo = s:cpo_save
