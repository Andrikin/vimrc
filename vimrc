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

" --- Configurations ---

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
set splitbelow
set autochdir
set scrolloff=999
set lazyredraw
set backspace=2
set helpheight=999
" Usando ripgrep (copen; cfdo {cmd} | update)
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
" Problems that can occur in vim session can be avoid by this configuration
set sessionoptions-=options
set encoding=utf-8
set shell=/usr/bin/env\ bash
" When a file is modified outside Vim, buffer with be updated
set autoread
set tabpagemax=50

" Statusline
set t_Co=256
set laststatus=2 
set showtabline=2 
set noshowmode 

" --- True Colors ---
"  St tem um problema com o cursor. Ele não muda de acordo com as cores da fonte que ele está sobre.
"  Dessa forma, com o patch de Jules Maselbas (https://git.suckless.org/st/commit/5535c1f04c665c05faff2a65d5558246b7748d49.html), é possível obter o cursor com a cor do texto (com truecolor) 
set termguicolors
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
	\['n', 'UserMapping_new']
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

nnoremap <BackSpace> X
nnoremap <space> %
vnoremap <space> %

" Esc rápido no Insert/Visual Mode
inoremap jj <esc>
vnoremap vv <esc>

" Configuração para digitação rápida
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap (( ()<Left>
inoremap {{ {}<Left>
inoremap [[ []<Left>

" Configuração troca de guias
nnoremap <TAB> gt
nnoremap <S-TAB> gT

" Yank to end of line
nnoremap Y yg_

" Remapeando ` (move cursor to column)
nnoremap ' `

" Configuração para PageUp PageDown (half screen)
nnoremap K <c-u>
nnoremap J <c-d>

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
nnoremap <silent> S :<c-u>%s/\<<c-r><c-w>\>\C//g<Left><Left>

" Substituir texto usando Visual mode para selecionar trechos a serem substituídos
vnoremap <silent> <leader>S <esc>:<c-u>'<,'>s/\<<c-r><c-w>\>\C//g<Left><Left>

" Esc more fast
vnoremap <esc> <c-c>
cnoremap <esc> <c-c>

" --- Cmdline ---
" Vim-capslock in command line
cmap <c-l> <plug>CapsLockToggle

" --- Mapleader Commands ---
" Abrir netrw File Manager
nnoremap <leader>f :<c-u>Vexplore<cr>

" Configuração rápida do vimrc
nnoremap <leader>r :<c-u>tabedit $MYVIMRC<cr>

" Source vimrc - Problema com Tabline do Airline Powerline (caracteres perdiam a cor)
nnoremap <silent> <leader>s :<c-u>write<bar>:source $MYVIMRC<cr>

" Salvar arquivo
inoremap <leader>w <esc>:w<cr>
nnoremap <leader>w :w<cr>

" Criando :mksession
nnoremap <leader>mk :<c-u>call SaveSession()<cr>

" Colar e copiar do clipboard ("* -> selection register, middle mouse button/ "+ -> system register)
nnoremap <leader>v "+P
vnoremap <leader>c "+y
" Legado
" nnoremap <leader>v <plug>SystemYank
" vnoremap <leader>c y:call CopiarTexto()<cr>

" --- Functions ---

" " Colar texto do clipboard do sistema
" function! YankText() abort
" 	let @0 = system('xsel -o -b')
" endfunction

" function! CopiarTexto() abort
" 	call system('xsel -i -b', @0)
" endfunction

function! EliminarHidBuf() abort
	let l:lastbid=bufnr("$")
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
		call EliminarHidBuf()
		silent !rm ~/.vim/vimsessao.vim
		silent mksession ~/.vim/vimsessao.vim
		wall
		redraw!
		echom "Sessão e arquivos salvos com Sucesso!"
"	Abrir sessão anterior
	elseif l:answer == 2
		if filereadable("/home/andre/.vim/vimsessao.vim")
			silent source ~/.vim/vimsessao.vim
			redraw!
			" AirlineRefresh
			echom "Sessão restaurada com Sucesso!"
		else
"			A mensagem de erro atua como um throw exception, informando onde o erro aconteceu e a mensagem de erro
			echoerr "Arquivo ~/.vim/vimsessao.vim não existe! Criando arquivo vimsessao.vim"
			silent mksession ~/.vim/vimsessao.vim
			echohl MoreMsg | echom "Arquivo criado com sucesso!" | echohl None
		endif
	else
		echo "\n" | call SaveSession()
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

" User Functions Mappings for Netrw 
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

" function! LightlineGitbranch() abort
" endfunction

" --- Autocommands ---

" Reset de todos os autocmd
augroup vimrc
	autocmd!
augroup END

" Configuração para que a linha não tenha limite de fim
autocmd vimrc FileType * set textwidth=0

" Match pair para $MYVIMRC
autocmd vimrc FileType vim set mps+=<:>
autocmd vimrc FileType vim inoremap < <><esc>i

" Atalhos para arquivos específicos
autocmd vimrc FileType python inoremap ; :
autocmd vimrc FileType java,c nnoremap <leader><C-j> :call CompilarCodigo()<cr>
autocmd vimrc FileType java,python,c nnoremap <leader><C-k> :call RodarCodigo()<cr>
autocmd vimrc FileType html inoremap < <><esc>i

" Configuração para comentstring [plugin commentary.vim]
autocmd vimrc FileType sh,bash setlocal commentstring=#\ %s
autocmd vimrc FileType c setlocal commentstring=/*\ %s\ */
autocmd vimrc FileType java setlocal commentstring=//\ %s
autocmd vimrc FileType vim setlocal commentstring=\"\ %s

" Compilar Suckless config - utilizar escape sequence para pipeline nos comandos passados pelo VIM
autocmd vimrc BufWritePost config.h :!sudo make clean install

" Templates de arquivos
autocmd vimrc FileType java nnoremap <leader>java :call TemplateJava()<cr>

" Ao entrar no modo Insert, trocar o background da linha
autocmd vimrc InsertEnter * set cursorline
autocmd vimrc InsertLeave * set nocursorline

" Refresh Command mode statusline
autocmd vimrc CmdlineEnter,CmdlineChanged * redraws

" Enable Emmet plugin just for html, css files
autocmd vimrc FileType html,css EmmetInstall
