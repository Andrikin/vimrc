" $MYVIMRC
"
" Autor: André Alexandre Aguiar
" Email: andrealexandreaguiar@gmail.com
" Dependences: ripgrep, traces.vim, [surround, comment, capslock] tpope, emmet-vim, vim-cool, vim-hexokinase, vim-dirvish, undotree

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
set t_Co=256
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
" Removed options
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

" Dirvish 'path navigator'
let g:loaded_netrwPlugin = 1
command! -nargs=? -complete=dir Explore Dirvish <args>
command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>
command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>

" Undotree
let g:undotree_ShortIndicators = 1
let g:undotree_SetFocusWhenToggle = 1

" Criando leader command
let mapleader = ","

" --- Key maps ---

" Using gk and gj (screen cursor up/down)
nnoremap <expr> k v:count == 0 ? 'gk' : 'k'
nnoremap <expr> j v:count == 0 ? 'gj' : 'j'

" Fix CTRL-arrow keys - st 
" Mode: nvo
map <esc>[1;5D <c-left>
map <esc>[1;5C <c-right>
" Mode: ic
map! <esc>[1;5D <c-left>
map! <esc>[1;5C <c-right>

nnoremap <backspace> X

" matchit plugin
nmap <space> <plug>(MatchitNormalForward)
vmap <space> <plug>(MatchitVisualForward)

" Esc rápido no Insert/Visual Mode
inoremap jj <esc>
vnoremap vv <esc>

" Caso queira, utilizar :stop
nnoremap <c-z> ,

" Configuração para digitação rápida
inoremap "" ""<left>
inoremap '' ''<left>
inoremap (( ()<left>
inoremap {{ {}<left>
inoremap [[ []<left>

" Configuração troca de guias
nnoremap <tab> gt
nnoremap <s-tab> gT

" Yank to end of line
nnoremap Y yg_

" Remapeando ` (move cursor to column)
nnoremap ' `

" Configuração para PageUp PageDown (half screen)
nnoremap K <c-u>
vnoremap K <c-u>
nnoremap J <c-d>
vnoremap J <c-d>

" Final da linha/início da linha (encontra o primeiro/último caracter)
nnoremap H ^
vnoremap H ^
nnoremap L g_
vnoremap L g_

" Sair de todos os arquivos sem salvar
nnoremap QQ :qa<cr>

" Sair de todos os arquivos, salvando todos
nnoremap QW :wqa<cr>

" Substitute command
" TODO: Make a plugin?
nnoremap s :%s/\<<c-r><c-w>\>\C//g<left><left>
vnoremap s <esc>"syiw:'<,'>s/\<<c-r>s\>\C//g<left><left>
vnoremap sv "sy:%s/<c-r>s\C//g<left><left>

" --- Cmdline ---
" Vim-capslock in command line
cmap <c-l> <plug>CapsLockToggle

" --- Mapleader Commands ---

" Configuração rápida do vimrc
nnoremap <leader>r :tabedit $MYVIMRC<cr>

nnoremap <leader>so :source $MYVIMRC<cr>

" Save files
inoremap <leader>w <esc>:w<cr>
nnoremap <leader>w :w<cr>

" :mksession
nnoremap <leader>ss :call <SID>save_session()<cr>

" Colar e copiar do clipboard ("* -> selection register, "+ -> primary register)
nnoremap <leader>v "+P
vnoremap <leader>c "+y

nnoremap <leader>k :silent make!<cr>

" Quickfix window
nnoremap <silent> <leader>cc :cclose<cr>
nnoremap <silent> <leader>co :copen<cr>
" nnoremap <silent> <leader>cw :cwindow<cr>

" Custom Grep
nmap <leader>g <plug>(GrepMan)
xmap <leader>g <plug>(GrepMan)

" Undotree plugin
nnoremap <silent> <leader>u :UndotreeToggle<cr>

" --- Plug ---

nnoremap <silent> <plug>(GrepMan) :<c-u>call <SID>custom_grep()<cr>
vnoremap <silent> <plug>(GrepMan) :<c-u>call <SID>custom_grep(visualmode())<cr>

" --- Functions ---

" Add funcionality for normal and visual mode
function! s:custom_grep(...) abort
	if !a:0
		let word = expand('<cword>') 
	else
		if a:1 ==# 'v' || a:1 ==# 'V' || a:1 ==# '\<c-v>'
			" save @@
			let sav_reg = @@
			normal! `<v`>y
			let word = @@ 
			let @@ = sav_reg
		endif
	endif
	if empty(word)
		return ''
	endif
	let cmd = 'silent grep! ' . shellescape(word)
	silent execute cmd
	redraw!
	copen
endfunction

function! s:clear_bufs() abort
	let lastbid = bufnr("$")
	for id in range(1, lastbid) 
		if bufloaded(id) == 0 && buflisted(id)
			execute "silent bdelete " . id 
		endif
	endfor
endfunction

function! s:save_session() abort
	let answer = confirm("Gostaria de SALVAR esta sessão ou ABRIR a anterior?", "Salvar\nAbrir Anterior", 2)
"	Salvar sessão
	if answer == 1 
		call s:clear_bufs()
		silent !rm ~/.vim/vimsessao.vim
		silent mksession ~/.vim/vimsessao.vim
		wall
		" redraw!
		echom "Sessão e arquivos salvos com Sucesso!"
"	Abrir sessão anterior
	else
		if filereadable("/home/andre/.vim/vimsessao.vim")
			silent source ~/.vim/vimsessao.vim
			" redraw!
			echom "Sessão restaurada com Sucesso!"
		else
"			A mensagem de erro atua como um throw exception, informando onde o erro aconteceu e a mensagem de erro
			echoerr "Arquivo ~/.vim/vimsessao.vim não existe! Criando arquivo vimsessao.vim"
			silent mksession ~/.vim/vimsessao.vim
			echohl MoreMsg | echom "Arquivo criado com sucesso!" | echohl None
		endif
	endif
endfunction

" Função para rodar código compilado (C, Java)
function! s:run_code() abort
" Buscando saber qual comando deve ser executado 
	let file = expand("%:e")
	if file ==? "java"
		echo system('java ' . expand('%:t:r'))
	elseif file ==? "c"
		echo system('tcc -run ' . expand('%:t'))
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

augroup goosebumps
	autocmd!
augroup END

" This fucking shit again
autocmd goosebumps FileType * set textwidth=0

" Match pair para $MYVIMRC
autocmd goosebumps FileType html,vim set mps+=<:>

" Atalhos para arquivos específicos
autocmd goosebumps FileType python inoremap ; :
autocmd goosebumps FileType java,python,c nnoremap <leader><C-k> :call <SID>run_code()<cr>
autocmd goosebumps FileType html,vim inoremap << <><left>

" Configuração para comentstring [plugin commentary.vim]
autocmd goosebumps FileType sh,bash setlocal commentstring=#\ %s
autocmd goosebumps FileType c setlocal commentstring=/*\ %s\ */
autocmd goosebumps FileType java setlocal commentstring=//\ %s
autocmd goosebumps FileType vim setlocal commentstring=\"\ %s

" Compilar Suckless config - utilizar escape sequence para pipeline nos comandos passados pelo VIM
autocmd goosebumps BufWritePost config.h :!sudo make clean install

" Ao entrar no modo Insert, trocar o background da linha
autocmd goosebumps InsertEnter * set cursorline
autocmd goosebumps InsertLeave * set nocursorline

" Refresh Command mode statusline
autocmd goosebumps CmdlineEnter,CmdlineChanged * redraws

" Enable Emmet plugin just for html, css files
autocmd goosebumps FileType html,css EmmetInstall

" Setlocal :compiler to use with :make and quickfix commands
autocmd goosebumps FileType python compiler python
autocmd goosebumps FileType java compiler java
autocmd goosebumps FileType css compiler csslint
" autocmd goosebumps FileType javascript compiler

" Open quickfix window after :make (:cwindow will open if there is an error message)
autocmd goosebumps QuickFixCmdPost [^l]* ++nested redraw! | cwindow
autocmd goosebumps QuickFixCmdPost l* ++nested redraw! | cwindow
