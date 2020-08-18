" $MYVIMRC
" Autor: André Alexandre Aguiar
" Email: andrealexandreaguiar@gmail.com
" Dependences: ripgrep, traces.vim, [surround, comment, capslock, eunuch] tpope, emmet-vim, vim-cool, vim-hexokinase, vim-dirvish, undotree

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
set helpheight=60

" Using ripgrep (copen; cfdo {cmd} | update)
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

" Statusline
set laststatus=2 
set showtabline=2 
set noshowmode 

" --- True Colors ---
"  St tem um problema com o cursor. Ele não muda de acordo com as cores da fonte que ele está sobre.
"  Dessa forma, com o patch de Jules Maselbas (https://git.suckless.org/st/commit/5535c1f04c665c05faff2a65d5558246b7748d49.html), é possível obter o cursor com a cor do texto (com truecolor) 
set termguicolors

" NeoVim
if v:progname == 'nvim'
	set guicursor=
endif

" --- Let Configurations ---

let &t_8f = "\033[38;2;%lu;%lu;%lum"
let &t_8b = "\033[48;2;%lu;%lu;%lum"

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

" --- Dirvish ---
let g:loaded_netrwPlugin = 1

let mapleader = '\'

" --- Key maps ---

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" Revert with ":iunmap <C-U>". -> from defaults.vim
inoremap <c-u> <c-g>u<c-u>

" " Use sane regexes.
" nnoremap / /\v
" vnoremap / /\v

" Using gk and gj (screen cursor up/down)
nnoremap <expr> k v:count == 0 ? 'gk' : 'k'
nnoremap <expr> j v:count == 0 ? 'gj' : 'j'

" Fix CTRL-arrow keys - st 
imap <esc>[1;5D <c-left>
imap <esc>[1;5C <c-right>
cmap <esc>[1;5D <c-left>
cmap <esc>[1;5C <c-right>

nnoremap <backspace> X
nnoremap ' `

" matchit plugin
nmap <space> <plug>(MatchitNormalForward)
xmap <space> <plug>(MatchitVisualForward)

" Esc rápido no Insert/Visual Mode
inoremap jj <esc>
vnoremap vv <esc>

" Setting <c-z> for something different than :stop
nnoremap <c-z> ,

" Configuração para digitação rápida
inoremap "" ""<left>
inoremap '' ''<left>
inoremap (( ()<left>
inoremap {{ {}<left>
inoremap [[ []<left>

" Yank to end of line
nnoremap Y yg_

" Half PageUp/PageDown
nnoremap K <c-u>
vnoremap K <c-u>
nnoremap J <c-d>
vnoremap J <c-d>
" Move to first/last character
nnoremap H ^
vnoremap H ^
nnoremap L g_
vnoremap L g_

" Vim-capslock in command line
cmap <c-l> <plug>CapsLockToggle

" --- Mapleader Commands ---
"  Be aware that '\' is used as mapleader character, so conflits can occur in Insert Mode maps

" $MYVIMRC
if v:progname == 'vim'
	nnoremap <silent> <leader>r :tabedit $MYVIMRC<cr>
	nnoremap <silent> <leader>so :source $MYVIMRC<cr>
else
	nnoremap <silent> <leader>r :tabedit /home/andre/.vim/vimrc<cr>
	nnoremap <silent> <leader>so :source /home/andre/.vim/vimrc<cr>
endif

" :mksession
nnoremap <silent> <leader>ss :call <SID>save_session()<cr>

" Copy and paste from clipboard (* -> selection register/+ -> primary register)
nnoremap <leader>p "+P
vnoremap <leader>y "+y

" --- Quickfix window ---
nnoremap <silent> <leader>k :Make %:S<cr>

" Toggle quickfix window
nnoremap <silent> <expr> <leader>c <SID>qf_stats()[0] ? 
			\ (<SID>is_qf_loc() ? ":lclose\<bar>:copen\<cr>" : ":cclose\<cr>") : ":copen\<cr>"
nnoremap <silent> <expr> <leader>l <SID>qf_stats()[0] ? 
			\ (<SID>is_qf_loc() ? ":lclose\<cr>" : ":cclose\<bar>:lopen\<cr>") : ":lopen\<cr>"
nnoremap <silent> <expr> <leader>q <SID>qf_stats()[0] ? (<SID>is_qf_loc() ? ":lclose\<cr>" : ":cclose\<cr>") : ''

" Undotree plugin
nnoremap <silent> <leader>u :UndotreeToggle<cr>

" cnoremap <expr> <cr> <SID>cmd_enter()

" --- Command's ---

" grep and make without I/O terminal screen
command! -nargs=+ -complete=file_in_path -bar Grep cgetexpr <SID>custom_grep(<f-args>)
command! -nargs=+ -complete=file_in_path -bar LGrep lgetexpr <SID>custom_grep(<f-args>)
command! -nargs=+ -complete=file_in_path -bar Make call <SID>custom_make('c', <f-args>) 
command! -nargs=+ -complete=file_in_path -bar LMake call <SID>custom_make('l', <f-args>)

" Like ':g/', but with results in local quickfix window
command! -nargs=1 -bar Gbar lgetexpr <SID>g_bar_search(<f-args>)

" Dirvish modes
command! -nargs=? -complete=dir Sirvish belowright split | silent Dirvish <args>
command! -nargs=? -complete=dir Virvish leftabove vsplit | silent Dirvish <args>
command! -nargs=? -complete=dir Tirvish tabedit | silent Dirvish <args>

" --- Abbreviations ---

cnoreabbrev <expr> grep  (getcmdtype() ==# ':' && getcmdline() ==# 'grep')  ? 'Grep'  : 'grep'
cnoreabbrev <expr> lgrep (getcmdtype() ==# ':' && getcmdline() ==# 'lgrep') ? 'LGrep' : 'lgrep'
cnoreabbrev <expr> make  (getcmdtype() ==# ':' && getcmdline() ==# 'make')  ? 'Make'  : 'make'
cnoreabbrev <expr> lmake (getcmdtype() ==# ':' && getcmdline() ==# 'lmake') ? 'LMake' : 'lmake'

" --- Plug's ---

" --- Functions ---

" TODO: It don't look for situations when there is two quickfix windows open, but I think that it handles those situations
function! s:qf_stats() abort
	for window in gettabinfo(tabpagenr())[0].windows
		if getwininfo(window)[0].quickfix
			return [1, getwininfo(window)[0].loclist]
		endif
	endfor
	" is_qf_on, is_qf_loc
	return [0, 0]
endfunction

function! s:is_qf_loc() abort
	return s:qf_stats()[1]
endfunction

function! s:set_qf_win_height() abort
	let stats = s:qf_stats()
	let lnum = stats[0] ? len(stats[1] ? getloclist(0) : getqflist()) : 0
	execute "resize " min([10, max([1, lnum])])
endfunction

function! s:g_bar_search(...) abort
	if v:progname == 'vim'
		return system(join([&grepprg] + [expandcmd(join(a:000, ' '))] + [expandcmd('%')], ' '))
	else
		return system(join([&grepprg] + [expand(join(a:000, ' '))] + [expand('%')], ' '))
	endif
endfunction

function! s:custom_grep(...) abort
	if v:progname == 'vim'
		return system(join([&grepprg] + [expandcmd(join(a:000, ' '))], ' '))
	else
		return system(join([&grepprg] + [expand(join(a:000, ' '))], ' '))
	endif
endfunction

" [lc]getexpr pass the result of system() through [global] 'errorformat'
" :make recive more args
function! s:custom_make(mode, ...) abort
	let sav_errorformat = &l:errorformat
	let &g:errorformat = &l:errorformat
	if a:mode ==# 'c'
		if v:progname == 'vim'
			cgetexpr system(join([&makeprg] + [expandcmd(join(a:000, ' '))], ' '))
		else
			cgetexpr system(join([&makeprg] + [expand(join(a:000, ' '))], ' '))
		endif
	elseif a:mode ==# 'l'
		if v:progname == 'vim'
			lgetexpr system(join([&makeprg] + [expandcmd(join(a:000, ' '))], ' '))
		else
			lgetexpr system(join([&makeprg] + [expand(join(a:000, ' '))], ' '))
		endif
	else
		return ''
	endif
	setglobal errorformat&
	let &l:errorformat = sav_errorformat
endfunction

" function! s:cmd_enter() abort
" 	let cmd_line = getcmdline()
" 	if cmd_line =~ '^\l\/\w*$'
" 		return "\<cr>:p\<left>"
" 	else
" 		return "\<cr>"
" 	endif
" endfunction

function! s:clear_bufs() abort
	for id in range(1, bufnr('$')) 
		if bufloaded(id) == 0 && buflisted(id)
			execute "silent bdelete " . id 
		endif
	endfor
endfunction

" Run C, Java code
" TODO: Make it better
function! s:run_code() abort
	if v:progname == 'vim'
		let file = expandcmd("%:e")
	else
		let file = expand("%:e")
	endif
	if file ==? "java"
		if v:progname == 'vim'
			lgetexpr system('java ' . expandcmd('%:t:r'))
		else
			lgetexpr system('java ' . expand('%:t:r'))
		endif
	elseif file ==? "c"
		if v:progname == 'vim'
			lgetexpr system('tcc -run ' . expandcmd('%:t'))
		else
			lgetexpr system('tcc -run ' . expand('%:t'))
		endif
	endif
endfunction

 " --- Lightline Funcions --- 
 function! LightlineMode() abort
 	return lightline#mode() . ' ' . CapsLockStatusline()
 endfunction

function! LightlineReadonly() abort
	return &readonly ? '' : ''
endfunction

function! LightlineFilename() abort
	if v:progname == 'vim'
		let filename = expandcmd('%:t') !=# '' ? expandcmd('%:t') : '[No Name]'
	else
		let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
	endif
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
autocmd goosebumps FileType java,c nnoremap <buffer> <leader><C-k> :call <SID>run_code()<cr>
autocmd goosebumps FileType html,vim inoremap <buffer> << <><left>
autocmd goosebumps FileType qf nnoremap <expr> <silent> <buffer> l ":" . v:count . (<SID>is_qf_loc() ? "lnewer\<cr>" : "cnewer\<cr>")
autocmd goosebumps FileType qf nnoremap <expr> <silent> <buffer> h ":" . v:count . (<SID>is_qf_loc() ? "lolder\<cr>" : "colder\<cr>")

autocmd goosebumps FileType text setlocal textwidth=0

" Match pair for $MYVIMRC
autocmd goosebumps FileType html,vim setlocal mps+=<:>

" Comentary.vim configurations
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
autocmd goosebumps CmdlineEnter,CmdlineChanged * redraws

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
