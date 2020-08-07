" Minhas Configurações VIM
"
" Autor: André Alexandre Aguiar
" Email: andrealexandreaguiar@gmail.com
"
" Dependências: vim-airline (statusline), traces (plugin highlights patterns and ranges for Ex commands), Pathogen (plugin manager), [Surround, Comment, Capslock](tpope), NNN.vim, Emmet (HTML development), vim-cool(exit hlsearch automaticaly), Hexokinase (Hexadecimal colors)

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

" --- True Colors ---
"  St tem um problema com o cursor. Ele não muda de acordo com as cores da fonte que ele está sobre.
"  Dessa forma, com o patch de Jules Maselbas (https://git.suckless.org/st/commit/5535c1f04c665c05faff2a65d5558246b7748d49.html), é possível obter o cursor com a cor do texto (com truecolor) 
set termguicolors
let &t_8f = "\033[38;2;%lu;%lu;%lum"
let &t_8b = "\033[48;2;%lu;%lu;%lum"

" --- vim-airline ---
set t_Co=256
set laststatus=2 
set showtabline=2 
set noshowmode 
let g:airline_theme='molokai'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter = "unique_tail"
let g:airline_section_error=""
let g:airline_section_warning=""
let g:airline#extensions#wordcount#enabled = 0
" A data é atualizada caso algum comando seja executado (importante nos casos de fullscreen)
let g:airline_section_z="%#__accent_bold#%p%% line:%l/%L %{strftime('%H:%M')}"
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#buffer_idx_mode = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#close_symbol = ""

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

" " Configuração de Nnn File Manager
" let g:nnn#set_default_mappings=0
" let g:nnn#statusline=0
" let g:nnn#layout={ 'window': { 'width': 0.9, 'height': 0.8, 'highlight': 'Statement' } } 
" let g:nnn#action={'<cr>':'tab split'}
" let g:nnn#command='nnn -o'

" --- Hexokinase ---
let g:Hexokinase_highlighters = ['backgroundfull']

" --- Emmet ---
let g:user_emmet_install_global = 0

" Criando leader command
let mapleader = ","

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
" \<\> - exactly word match
" <c-r> - acess register
" <c-w> - get word under cursor
" \C - case sensitive
nnoremap S :%s/\<<c-r><c-w>\>\C//g<Left><Left>

" Substituir texto usando Visual mode para selecionar trechos a serem substituídos
vnoremap <leader>S mvy`v"syiw:'<,'>s/\<<c-r>s\>\C//g<Left><Left>

" Esc more fast
vnoremap <esc> <c-c>
cnoremap <esc> <c-c>

" <c-g>u -> new undoable edit - Experimental
" inoremap <c-w> <c-g>u<c-w>
" inoremap <c-u> <c-g>u<c-u>

" --- Cmdline ---
" Vim-capslock in command line
cmap <c-l> <plug>CapsLockToggle

" --- Mapleader Commands ---
" Abrir netrw File Manager
:nnoremap <leader>ff :Vexplore<cr>

" Abrir Nnn File Manager
" nnoremap <leader>ff :NnnPicker '%:p:h'<cr>

" Configuração rápida do vimrc
nnoremap <leader>rc :tabedit $MYVIMRC<cr>

" Source vimrc - Problema com Tabline do Airline Powerline (caracteres perdiam a cor)
nnoremap <leader>src :w<bar>:source $MYVIMRC<bar>:call UpdateVimRc()<cr>

" Salvar arquivo
inoremap <leader>w <esc>:w<cr>
nnoremap <leader>w :w<cr>

" Criando :mksession
nnoremap <leader>mk :call SalvarSessao()<cr>

" Colar e copiar do clipboard ("* -> selection register, middle mouse button/ "+ -> system register)
nnoremap <leader>v "+P
vnoremap <leader>c "+y

" --- Functions ---
" " Colar texto do clipboard do sistema
" function! ColarTexto()
" 	let @p=system("xsel -o -b")
" endfunction

" function! CopiarTexto()
" 	call system('xsel -i -b', @0)
" endfunction

function! EliminarHidBuf() abort
	let l:lastbid=bufnr("$")
	for id in range(1, lastbid) 
		if bufloaded(id)==0&&buflisted(id)
			execute "silent bdelete " . id 
		endif
	endfor
endfunction

function! SalvarSessao() abort
	let l:answer=confirm("Gostaria de SALVAR esta sessão ou ABRIR a anterior?", "Salvar\nAbrir Anterior", 2)
"	Salvar sessão
	if l:answer==1
		call EliminarHidBuf()
		silent !rm ~/.vim/vimsessao.vim
		silent mksession ~/.vim/vimsessao.vim
		wall
		redraw!
		echom "Sessão e arquivos salvos com Sucesso!"
"	Abrir sessão anterior
	elseif l:answer==2
		if filereadable("/home/andre/.vim/vimsessao.vim")
			silent source ~/.vim/vimsessao.vim
			redraw!
			AirlineRefresh
			echom "Sessão restaurada com Sucesso!"
		else
"			A mensagem de erro atua como um throw exception, informando onde o erro aconteceu e a mensagem de erro
			echoerr "Arquivo ~/.vim/vimsessao.vim não existe! Criando arquivo vimsessao.vim"
			silent mksession ~/.vim/vimsessao.vim
			echohl MoreMsg | echom "Arquivo criado com sucesso!" | echohl None
		endif
	else
		echo "\n" | call SalvarSessao()
	endif
endfunction

function! UpdateVimRc() abort
	AirlineRefresh
"	Comando para reload do arquivo (ao dar reload no vimrc, alguns arquivos perdem highlight)
	silent e
"	Comando :redraw redesenha a janela. Com a partícula [!], primeiramente limpa a janela e depois redesenha
	redraw! | echom "Configurações do arquivo vimrc atualizadas!"
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

" --- Autocommands ---
" Reset de todos os autocmd (criar augroup's para cada tipo de autocmd?)
augroup CleanHouse
	au!
augroup END

" Configuração para que a linha não tenha limite de fim
autocmd CleanHouse FileType * set textwidth=0

" Match pair para $MYVIMRC
autocmd CleanHouse FileType vim set mps+=<:>
autocmd CleanHouse FileType vim inoremap < <><esc>i

" Atalhos para arquivos específicos
autocmd CleanHouse FileType python inoremap ; :
autocmd CleanHouse FileType java,c nnoremap <leader><C-j> :call CompilarCodigo()<cr>
autocmd CleanHouse FileType java,python,c nnoremap <leader><C-k> :call RodarCodigo()<cr>
autocmd CleanHouse FileType html inoremap < <><esc>i

" Configuração para comentstring [plugin commentary.vim]
autocmd CleanHouse FileType sh,bash setlocal commentstring=#\ %s
autocmd CleanHouse FileType c setlocal commentstring=/*\ %s\ */
autocmd CleanHouse FileType java setlocal commentstring=//\ %s
autocmd CleanHouse FileType vim setlocal commentstring=\"\ %s

" Compilar Suckless config - utilizar escape sequence para pipeline nos comandos passados pelo VIM
autocmd CleanHouse BufWritePost config.h :!sudo make clean install

" Templates de arquivos
autocmd CleanHouse FileType java nnoremap <leader>java :call TemplateJava()<cr>

" Ao entrar no modo Insert, trocar o background da linha
autocmd CleanHouse InsertEnter * set cursorline
autocmd CleanHouse InsertLeave * set nocursorline

" Refresh Command mode statusline
autocmd CleanHouse CmdlineEnter * redraws
autocmd CleanHouse CmdlineChanged * redraws

" Enable Emmet plugin just for html, css files
autocmd CleanHouse FileType html,css EmmetInstall
