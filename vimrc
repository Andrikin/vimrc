" $MYVIMRC
"
" Autor: André Alexandre Aguiar
" Email: andrealexandreaguiar@gmail.com
" Dependences: ripgrep, traces.vim, [surround, comment, capslock] tpope, emmet-vim, vim-cool, vim-hexokinase

" plugin - verifica por $RUNTIMEPATH/ftplugin
" indent - verifica por $RUNTIMEPATH/indent
filetype indent plugin on
syntax enable
colorscheme molokai

" --- Set Configurations ---

" Define como o Vim busca por arquivos
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
set autochdir
set scrolloff=999
set lazyredraw
set backspace=2
set splitbelow
set helpheight=60
" Usando ripgrep (copen; cfdo {cmd} | update)
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
" Problems that can occur in vim session can be avoid by this configuration
set sessionoptions-=options
set encoding=utf-8
set shell=/usr/bin/env\ bash
" When a file is modified outside Vim, buffer with be updated
set autoread
set tabpagemax=50
set textwidth=0
set wildmenu

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

" --- Netrw File Manager ---
let g:Netrw_UserMaps = [
	\['l', 'UserMapping_enter'],
	\['h', 'UserMapping_return'],
	\['r', 'UserMapping_rename'],
	\['x', 'UserMapping_remove'],
	\['.', 'UserMapping_hidden'],
	\['q', 'UserMapping_exit'],
	\['n', 'UserMapping_new'],
	\['~', 'UserMapping_home'], 
	\]
let g:netrw_keepdir = 0
let g:netrw_banner = 0
let g:netrw_liststyle = 0
let g:netrw_list_hide= '^\..*'
let g:netrw_bufsettings='noma nomod rnu nu nowrap ro nobl'
let g:netrw_browse_split = 0
let g:netrw_winsize = 50

" --- Hexokinase ---
let g:Hexokinase_highlighters = ['backgroundfull']

" --- Emmet ---
let g:user_emmet_install_global = 0

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

" Substitute command - make a plugin?
nnoremap s :%s/\<<c-r><c-w>\>\C//g<left><left>
vnoremap s <esc>"syiw:'<,'>s/\<<c-r>s\>\C//g<left><left>
vnoremap sv "sy:%s/<c-r>s\C//g<left><left>

" --- Cmdline ---
" Vim-capslock in command line
cmap <c-l> <plug>CapsLockToggle

" --- Mapleader Commands ---
" Abrir netrw File Manager
nnoremap <leader>f :Vexplore<cr>

" Configuração rápida do vimrc
nnoremap <leader>r :tabedit $MYVIMRC<cr>

" Source vimrc
nnoremap <leader>so :source $MYVIMRC<cr>

" Salvar arquivo
inoremap <leader>w <esc>:w<cr>
nnoremap <leader>w :w<cr>

" Criando :mksession
nnoremap <leader>mk :call SaveSession()<cr>

" Colar e copiar do clipboard ("* -> selection register, "+ -> primary register)
nnoremap <leader>v "+P
vnoremap <leader>c "+y
" Legado
" nnoremap <leader>v :call PutText()<cr>"0P
" vnoremap <leader>c y:call YankText()<cr>

" Custom Grep
nmap <leader>g <plug>(GrepMan)
xmap <leader>g <plug>(GrepMan)

" --- Plug ---

nnoremap <silent> <plug>(GrepMan) :<c-u>call <SID>custom_grep()<cr>
vnoremap <silent> <plug>(GrepMan) :<c-u>call <SID>custom_grep(visualmode())<cr>

" --- Functions ---

" " Colar texto do clipboard do sistema
" function! PutText() abort
" 	let @0 = system('xsel -o -b')
" endfunction

" function! YankText() abort
" 	call system('xsel -i -b', @0)
" endfunction

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
	let l:lastbid = bufnr("$")
	for id in range(1, lastbid) 
		if bufloaded(id) == 0 && buflisted(id)
			execute "silent bdelete " . id 
		endif
	endfor
endfunction

function! SaveSession() abort
	let l:answer = confirm("Gostaria de SALVAR esta sessão ou ABRIR a anterior?", "Salvar\nAbrir Anterior", 2)
"	Salvar sessão
	if l:answer == 1 
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

" Funções para compilar e mostrar prováveis erros na tela do Vim (C, Java)
" Acrescentado o comando :silent, o prompt retorna imediatamente
function! CompilarCodigo() abort
	let l:file = expand("%:e")
	if l:file ==? "java"
		if bufexists(bufname("log_java.txt"))
			bdelete log_java.txt
		endif
		silent !clear&&javac "%:t" &> /home/andre/.vim/log_java.txt
		silent !clear&&bash /home/andre/.vim/log_java_script.sh
		redraw!
		split /home/andre/.vim/log_java.txt
		resize 10
		execute "normal! \<C-w>\<C-k>"
	elseif l:file ==? "c"
		!clear&&cc -Wall -g "%:t"&&rm a.out
":		!clear&&cc -Wall -g "%:t"
	endif
endfunction

" Função para rodar código compilado (C, Python, Java)
function! RodarCodigo() abort
" Buscando saber qual comando deve ser executado 
	let l:file = expand("%:e")
	if l:file ==? "java"
		!clear&&java "%:t:r"
	elseif l:file ==? "py"
		!clear&&python3 "%:t"
	elseif l:file ==? "c"
		!clear&&tcc -run "%:t"
	endif
endfunction

" --- User Functions Mappings for Netrw --- 
" Netrw.vim em /usr/share/vim/vim80/autoload/netrw.vim.
" Alterei os valores nnoremap de <cr>, -, %, D, d, R, a
function! UserMapping_enter(islocal) abort
	return "normal \<plug>NetrwLocalBrowseCheck"
endfunction

function! UserMapping_return(islocal) abort
	return "normal \<plug>NetrwBrowseUpDir"
endfunction

" Make user input 'f' or 'd'
function! UserMapping_new(islocal) abort
	let l:answer = confirm("Create new file or dir?", "file\ndir", 1)
	if l:answer == 1
		return "normal \<plug>NetrwOpenFile"
	elseif l:answer == 2
		return "normal :call \<SID>NetrwMakeDir('')\<cr>"
	else
		return "refresh"
	endif
endfunction

function! UserMapping_rename(islocal) abort
	let l:curdir = getcwd(0, 0)
	return "normal :call \<SID>NetrwLocalRename('" . l:curdir . "')\<cr>"
endfunction

function! UserMapping_remove(islocal) abort
	let l:curdir = getcwd(0, 0)
	return "normal :call \<SID>NetrwLocalRm('" . l:curdir . "')\<cr>"
endfunction

function! UserMapping_hidden(islocal) abort
	return "normal \<plug>NetrwHide_a"
endfunction

function! UserMapping_exit(islocal) abort
	return "normal ZQ"
endfunction

function! UserMapping_home(islocal) abort
	return "normal :Explore ~\<cr>"
endfunction

 " --- Lightline Funcions --- 
 function! LightlineMode() abort
 	return lightline#mode() . ' ' . CapsLockStatusline()
 endfunction

function! LightlineReadonly() abort
	return &readonly ? '' : ''
endfunction

function! LightlineFilename() abort
	let l:filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
	let l:modified = &modified ? ' +' : ''
	return l:filename . l:modified 
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
autocmd goosebumps FileType java,c nnoremap <leader><C-j> :call CompilarCodigo()<cr>
autocmd goosebumps FileType java,python,c nnoremap <leader><C-k> :call RodarCodigo()<cr>
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
