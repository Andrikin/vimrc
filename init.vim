" $MYVIMRC --- NeoVim ---
" Autor: André Alexandre Aguiar
" Email: andrealexandreaguiar@gmail.com
" Dependences: ripgrep, traces.vim, [surround, comment, capslock, eunuch] tpope, emmet-vim, vim-cool, vim-hexokinase, vim-dirvish, undotree, vim-highlightedyank, vim-sxhkdrc
" TODO: Learn how to use vimdiff/diffing a file, learn :args and how to modify :args list, learn how to use :ls and change :buffer

" plugin -> verify $RUNTIMEPATH/ftplugin for files
" indent -> verify $RUNTIMEPATH/indent for files
filetype indent plugin on
syntax enable
colorscheme molokai

" --- Set Configurations ---

" Search recursively
set path+=**

" Indicadores - números nas linhas
set rnu 
set nu

" Tamanho da indentação
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Configurações para search
set incsearch
set ignorecase
set smartcase
set hlsearch

" Configurações gerais
set noautochdir
set scrolloff=999
set lazyredraw
set backspace=indent,eol,start
set splitbelow
set helpheight=40

" Using ripgrep ([cf]open; [cf]do {cmd} | update)
if executable('rg')
	set grepprg=rg\ --vimgrep\ --smart-case\ --follow
else
	set grepprg=grep\ -R
endif

" Problems that can occur in vim session can be avoid by this configuration
set sessionoptions-=options
set encoding=utf-8
set autoread
set tabpagemax=50
set wildmenu
set shell=/bin/bash
set shellpipe=2>&1\|\ tee
set complete-=t
set title
set hidden
" Use mouse to resize windows
set mouse=nvi

" Statusline
set laststatus=2 
set showtabline=2 
set noshowmode 

"  St tem um problema com o cursor. Ele não muda de acordo com as cores da fonte que ele está sobre.
"  Dessa forma, com o patch de Jules Maselbas (https://git.suckless.org/st/commit/5535c1f04c665c05faff2a65d5558246b7748d49.html), é possível obter o cursor com a cor do texto (com truecolor)
set termguicolors

" NeoVim
set guicursor=
set inccommand=

" --- Let Configurations ---

" --- lightline ---
let g:lightline = {
			\ 'colorscheme': 'molokai',
			\ 'separator': { 'left': '', 'right': '' },
			\ 'subseparator': { 'left': '', 'right': '' },
			\ 'tabline': {
			\	'left': [['tabs']],
			\ },
			\ 'active': {
			\	'left': [
			\		['mode', 'paste'],
			\		['readonly', 'filename'],
			\		],
			\	},
			\ 'component': {
			\	'close': '',
			\	'lineinfo': '%l/%L%<',
			\	},
			\ 'component_function': {
			\	'mode': 'LightlineMode',
			\	'readonly': 'LightlineReadonly',
			\	'filename': 'LightlineFilename',
			\	},
			\ 'tab': {
			\	'active': ['filename', 'modified'],
			\	'inactive': ['filename', 'modified'],
			\	},
			\ }

" --- Hexokinase ---
let g:Hexokinase_highlighters = ['backgroundfull']

" --- Emmet ---
let g:user_emmet_install_global = 0

" --- Traces ---
let g:traces_num_range_preview = 1

" --- UndoTree ---
let g:undotree_WindowLayout = 2
let g:undotree_ShortIndicators = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_DiffpanelHeight = 5

" --- Dirvish ---
let g:loaded_netrwPlugin = 1

" Set python3
let g:python3_host_prog = '/usr/local/bin/python3'

let mapleader = '\'

" --- Key maps ---

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" Revert with ":iunmap <C-U>". -> from defaults.vim
inoremap <c-u> <c-g>u<c-u>
nnoremap <backspace> X
nnoremap ' `
" Yank to end of line
nnoremap Y yg$
" Disable <c-z> (:stop)
nnoremap <c-z> <nop>
" :terminal mappings
tnoremap <m-[> <c-\><c-n>

" " Fast esc
" inoremap <m-[> <esc>
" vnoremap <m-[> <esc>

" Using gk and gj (screen cursor up/down)
nnoremap <expr> k v:count == 0 ? 'gk' : 'k'
nnoremap <expr> j v:count == 0 ? 'gj' : 'j'

" Fast pair
inoremap "" ""<left>
inoremap '' ''<left>
inoremap (( ()<left>
inoremap {{ {}<left>
inoremap [[ []<left>

" Half PageUp/PageDown
nnoremap K <c-u>
vnoremap K <c-u>
nnoremap J <c-d>
vnoremap J <c-d>

" Move to first/last character in screen line
nnoremap H g^
vnoremap H g^
nnoremap L g$
vnoremap L g$

" " :bnext / :bprevious
" nnoremap <silent> gb :bnext<cr>
" nnoremap <silent> gB :bprevious<cr>

" Vim-capslock in command line
cmap <c-l> <plug>CapsLockToggle

" --- Mapleader Commands ---
"  Be aware that '\' is used as mapleader character, so conflits can occur in Insert Mode maps

" $MYVIMRC
nnoremap <silent> <leader>r :edit $MYVIMRC<cr>
nnoremap <silent> <leader>so :source $MYVIMRC<cr>

" :mksession
nnoremap <silent> <leader>ss :call <SID>save_session()<cr>

" Copy and paste from clipboard (* -> selection register/+ -> primary register)
nnoremap <leader>p "+P
vnoremap <leader>y "+y

" --- Quickfix window ---
" NeoVim excells about terminal jobs
nnoremap <silent> <leader>k :make %:S<cr>

" Toggle quickfix window
nnoremap <silent> <expr> <leader>c <SID>toggle_list('c')
nnoremap <silent> <expr> <leader>l <SID>toggle_list('l')
nnoremap <silent> <expr> <leader>q <SID>quit_list()

" Undotree plugin
nnoremap <silent> <leader>u :UndotreeToggle<cr>

nnoremap <silent> <expr> <leader>t <SID>toggle_terminal()

" cnoremap <expr> <cr> <SID>cmd_enter()

" --- Command's ---

" Like ':g/', but with results in local quickfix window
command! -nargs=1 -bar Pattern lgetexpr <SID>g_bar_search(<f-args>)

" Dirvish modes
command! -nargs=? -complete=dir Sirvish belowright split | silent Dirvish <args>
command! -nargs=? -complete=dir Virvish leftabove vsplit | silent Dirvish <args>
command! -nargs=? -complete=dir Tirvish tabedit | silent Dirvish <args>

" --- Abbreviations ---

" --- Plug's ---

" --- Functions ---

function! s:quit_list() abort
	let qf = s:qf_stats()
	let cmd = ''
	if qf[0]
		let cmd = qf[1] ? ":lclose\<cr>" : ":cclose\<cr>"
	endif
	return cmd
endfunction

function! s:move_in_list(move) abort
	let qf = s:qf_stats()
	let cmd = ":" . v:count1
	let go_back_to_qf = ":call win_gotoid(" . qf[2] . ")\<cr>"
	if a:move == 'l'
		let cmd .= qf[1] ? "lnewer\<cr>" : "cnewer\<cr>"
	elseif a:move == 'h'
		let cmd .= qf[1] ? "lolder\<cr>" : "colder\<cr>"
	elseif a:move == 'j'
		let cmd .= (qf[1] ? "lnext\<bar>" : "cnext\<bar>") . go_back_to_qf
	elseif a:move == 'k'
		let cmd .= (qf[1] ? "lprevious\<bar>" : "cprevious\<bar>") . go_back_to_qf
	endif
	" FIXME: Try not working
	" try
	" 	return cmd
	" catch /^Vim\%((\a\+)\)\=:E/
	" 	echomsg 'Limite da lista alcançado!'
	" 	return ''
	" endtry
	return cmd
endfunction

function! s:toggle_list(type) abort
	let qf = s:qf_stats()
	let cmd = ''
	if a:type == 'c'
		if qf[0]
			let cmd = qf[1] ? ":lclose\<bar>:copen\<cr>" : ":cclose\<cr>"
		else
			let cmd = ":copen\<cr>"
		endif
	elseif a:type == 'l'
		if qf[0]
			let cmd = qf[1] ? ":lclose\<cr>" : ":cclose\<bar>:lopen\<cr>"
		else
			let cmd = ":lopen\<cr>"
		endif
	endif
	return cmd
endfunction

" Toggle :terminal. Use 'i' to enter Terminal Mode. 'ctrl-\ctrl-n' to exit
function! s:toggle_terminal() abort
	let stats = s:t_stats()
	if stats[0]
		return join([':'] + [stats[1]] + [" windo normal ZQ\<cr>"], '')
	endif
	return ":10split +terminal\<cr>"
endfunction

function! s:t_stats() abort
	for window in gettabinfo(tabpagenr())[0].windows
		if getwininfo(window)[0].terminal
			return [1, win_id2win(window)]
		endif
	endfor
	return [0, 0]
endfunction

" INFO: It don't look for situations when there is two quickfix windows open, but I think that it handles those situations
function! s:qf_stats() abort
	for window in gettabinfo(tabpagenr())[0].windows
		if getwininfo(window)[0].quickfix
			return [1, getwininfo(window)[0].loclist, window]
		endif
	endfor
	" is_qf_on, is_qf_loc, win_id
	return [0, 0, 0]
endfunction

function! s:set_qf_win_height() abort
	let stats = s:qf_stats()
	let lnum = stats[0] ? len(stats[1] ? getloclist(0) : getqflist()) : 0
	execute "resize " min([10, max([1, lnum])])
endfunction

function! s:g_bar_search(...) abort
	return system(join([&grepprg] + [shellescape(expand(join(a:000, ' ')))] + [shellescape(expand("%"))], ' '))
endfunction

" Run C, Java code
" TODO: Make it better
function! s:run_code() abort
	let file = shellescape(expand("%:e"))
	if file ==? "java"
		execute join('!java ' . shellescape(expand("%:t:r")))
	elseif file ==? "c"
		execute join('!tcc -run ' . shellescape(expand("%:t")))
	endif
endfunction

" function! s:cmd_enter() abort
" 	let cmd_line = getcmdline()
" 	if cmd_line =~ '^\l\/\w*$'
" 		return "\<cr>:p\<left>"
" 	else
" 		return "\<cr>"
" 	endif
" endfunction

" function! s:clear_bufs() abort
" 	for id in range(1, bufnr("$")) 
" 		if bufloaded(id) == 0 && buflisted(id)
" 			execute "silent bdelete " . id 
" 		endif
" 	endfor
" endfunction

 " --- Lightline Funcions --- 
 function! LightlineMode() abort
 	return lightline#mode() . ' ' . CapsLockStatusline()
 endfunction

function! LightlineReadonly() abort
	return &readonly ? '' : ''
endfunction

function! LightlineFilename() abort
	let filename = expand("%:t") !=# '' ? expand("%:t") : '[No Name]'
	let modified = &modified ? ' +' : ''
	return filename . modified 
endfunction

" --- Autocommands ---
"  for map's use <buffer>, for set's use setlocal

augroup goosebumps
	autocmd!
augroup END

" Atalhos para arquivos específicos
autocmd goosebumps FileType python inoremap <buffer> ; :
autocmd goosebumps FileType java,c nnoremap <buffer> <a-k> :call <SID>run_code()<cr>
autocmd goosebumps FileType html,vim inoremap <buffer> << <><left>

" Quickfix maps
autocmd goosebumps FileType qf nnoremap <expr> <silent> <buffer> l <SID>move_in_list('l')
autocmd goosebumps FileType qf nnoremap <expr> <silent> <buffer> h <SID>move_in_list('h')
autocmd goosebumps FileType qf nnoremap <expr> <silent> <buffer> j <SID>move_in_list('j')
autocmd goosebumps FileType qf nnoremap <expr> <silent> <buffer> k <SID>move_in_list('k')

autocmd goosebumps FileType * setlocal textwidth=0

" Match pair for $MYVIMRC
autocmd goosebumps FileType html,vim setlocal mps+=<:>

" Comentary.vim
autocmd goosebumps FileType sh,bash setlocal commentstring=#\ %s
autocmd goosebumps FileType c setlocal commentstring=/*\ %s\ */
autocmd goosebumps FileType java setlocal commentstring=//\ %s
autocmd goosebumps FileType vim setlocal commentstring=\"\ %s

" Compilar Suckless config - utilizar escape sequence para pipeline nos comandos passados pelo VIM
autocmd goosebumps BufWritePost config.h :!sudo make clean install

" When enter/exit Insert Mode, change line background color
autocmd goosebumps InsertEnter * setlocal cursorline
autocmd goosebumps InsertLeave * setlocal nocursorline

" Refresh Command mode statusline
autocmd goosebumps CmdlineChanged * redraws

" Enable Emmet plugin just for html, css files
autocmd goosebumps FileType html,css EmmetInstall

" Setlocal :compiler to use with :make and quickfix commands
autocmd goosebumps FileType python compiler python
autocmd goosebumps FileType java compiler java
autocmd goosebumps FileType css compiler csslint
" autocmd goosebumps FileType javascript compiler

" Open quickfix window automaticaly
autocmd goosebumps QuickFixCmdPost [^l]* ++nested cwindow
autocmd goosebumps QuickFixCmdPost l* ++nested lwindow
autocmd goosebumps FileType qf call <SID>set_qf_win_height()

" Remove map 'K' from :Man plugin
autocmd goosebumps FileType man nnoremap <buffer> K <c-u>

" " Start :terminal in Insert Mode
" autocmd goosebumps TermOpen * startinsert
