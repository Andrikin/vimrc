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
set backspace=2
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
set textwidth=0
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

let mapleader = ","

" --- Key maps ---

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" Revert with ":iunmap <C-U>". -> from defaults.vim
inoremap <c-u> <c-g>u<c-u>

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

" Tab for tabs
nnoremap <tab> gt
nnoremap <s-tab> gT

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

" Quit all windows without save
nnoremap QQ :qa<cr>
" Quit and save all windows
nnoremap QW :wqa<cr>

" Vim-capslock in command line
cmap <c-l> <plug>CapsLockToggle

" --- Mapleader Commands ---

" $MYVIMRC
nnoremap <silent> <leader>r :tabedit $MYVIMRC<cr>
nnoremap <silent> <leader>so :source $MYVIMRC<cr>

" :mksession
nnoremap <silent> <leader>ss :call <SID>save_session()<cr>

" Copy and paste from clipboard (* -> selection register/+ -> primary register)
nnoremap <leader>p "+P
vnoremap <leader>y "+y

" Quickfix window
nnoremap <silent> <leader>k :Make %:S<cr>
nnoremap <silent> <expr> <leader>c <SID>toggle_qf() == 0 ? ":copen\<cr>" : ":cclose\<cr>"
nnoremap <silent> <expr> <leader>l <SID>toggle_qf() == 0 ? ":lopen\<cr>" : ":lclose\<cr>"
nnoremap <silent> <expr> <leader>q <SID>is_qf_on()[0] ? (<SID>is_qf_loc() ? ":lclose\<cr>" : ":cclose\<cr>") : ''

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
" command! -nargs=1 -bang Vimgrep execute "vimgrep" . <bang> . " /" . <q-args> . "/ %"
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

" TODO: It don't look for situations when there is two quickfix windows open, but I think that it handles
function! s:is_qf_on() abort
	for window in gettabinfo('%')[0].windows
		if getwininfo(window)[0].quickfix
			return [1, getwininfo(window)[0].loclist]
		endif
	endfor
	return [0, 0]
endfunction

function! s:is_qf_loc() abort
	return s:is_qf_on()[1]
endfunction

function! s:toggle_qf() abort
	return s:is_qf_on()[0]
endfunction

function! s:g_bar_search(...) abort
	return system(join([&grepprg] + [expandcmd(join(a:000, ' '))] + [expandcmd('%')], ' '))
endfunction

function! s:custom_grep(...) abort
	return system(join([&grepprg] + [expandcmd(join(a:000, ' '))], ' '))
endfunction

" [lc]getexpr pass the result of system() through [global] 'errorformat'
" :make recive more args
" TODO: Move to runtime
function! s:custom_make(mode, ...) abort
	let sav_errorformat = &l:errorformat
	let &g:errorformat = &l:errorformat
	if a:mode ==# 'c'
		cgetexpr system(join([&makeprg] + [expandcmd(join(a:000, ' '))], ' '))
	elseif a:mode ==# 'l'
		lgetexpr system(join([&makeprg] + [expandcmd(join(a:000, ' '))], ' '))
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

" TODO: Make it better
function! s:save_session() abort
	let answer = confirm("Gostaria de SALVAR esta sessão ou ABRIR a anterior?", "Salvar\nAbrir Anterior", 2)
	if answer == 1 
		call s:clear_bufs()
		silent !rm ~/.vim/vimsessao.vim
		silent mksession ~/.vim/vimsessao.vim
		wall
		" redraw!
		echom "Sessão e arquivos salvos com Sucesso!"
	else
		if filereadable("/home/andre/.vim/vimsessao.vim")
			silent source ~/.vim/vimsessao.vim
			" redraw!
			echom "Sessão restaurada com Sucesso!"
		else
			echoerr "Arquivo ~/.vim/vimsessao.vim não existe! Criando arquivo vimsessao.vim"
			silent mksession ~/.vim/vimsessao.vim
			echohl MoreMsg | echom "Arquivo criado com sucesso!" | echohl None
		endif
	endif
endfunction

" Run C, Java code
" TODO: Make it better
function! s:run_code() abort
	let file = expand("%:e")
	if file ==? "java"
		lgetexpr system('java ' . expand('%:t:r'))
	elseif file ==? "c"
		lgetexpr system('tcc -run ' . expand('%:t'))
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
	let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
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

" This fucking shit again
" autocmd goosebumps FileType * setlocaltextwidth=0

" Match pair para $MYVIMRC
autocmd goosebumps FileType html,vim setlocal mps+=<:>

" Configuração para comentstring [plugin commentary.vim]
autocmd goosebumps FileType sh,bash setlocal commentstring=#\ %s
autocmd goosebumps FileType c setlocal commentstring=/*\ %s\ */
autocmd goosebumps FileType java setlocal commentstring=//\ %s
autocmd goosebumps FileType vim setlocal commentstring=\"\ %s

" Compilar Suckless config - utilizar escape sequence para pipeline nos comandos passados pelo VIM
autocmd goosebumps BufWritePost config.h :!sudo make clean install

" Ao entrar no modo Insert, trocar o background da linha
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
