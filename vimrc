"                                                __  __             __      ___
"                                               |  \/  |            \ \    / (_)
"                                               | \  / | ___ _   _   \ \  / / _ _ __ ___  _ __ ___
"                                               | |\/| |/ _ \ | | |   \ \/ / | | '_ ` _ \| '__/ __|
"                                               | |  | |  __/ |_| |    \  /  | | | | | | | | | (__
"                                               |_|  |_|\___|\__,_|     \/   |_|_| |_| |_|_|  \___|


" Minhas Configurações VIM
"
" Autor: André Alexandre Aguiar
" Email: andrealexandreaguiar@gmail.com

" TODO - Aprimorar o comando de 'Auto Quotation', modificando como Vim reconhece palavras

" Dependências: Vim Airline (plugin powerline), traces (plugin highlights patterns and ranges for Ex commands), Pathogen (plugin manager)"
" Configurações utilizadas pelo Airline - Powerline
set laststatus=2 
set showtabline=2 
set noshowmode 
set t_Co=256
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter = "unique_tail"

" Variáveis que modificam statusline - Airline Powerline
let g:airline_section_error=""
let g:airline_section_warning=""
let g:airline#extensions#wordcount#enabled = 0
" A data é atualizada caso algum comando seja executado (importante nos casos de fullscreen)
let g:airline_section_z="%#__accent_bold#%p%% line:%l/%L %{strftime('%H:%M')}"

" variáveis tabline - airline powerline
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#buffer_idx_mode = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#close_symbol = ""

" Configurações do Lightline Powerline - Desativado

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
set syntax=on.vim
set autochdir
set scrolloff=22
set lazyredraw

" Esquema de Cor
colorscheme mycolors

" Configuração de Netrw File Manager
" Desabilitando Nertw
let g:netrwPlugin=1
let g:netrw_banner = 0
let g:netrw_winsize = 85
let g:netrw_liststyle = 0
let g:netrw_list_hide= '^\..*'
let g:netrw_bufsettings='noma nomod rnu nu nowrap ro nobl'

" Configuração do Vifm File Manager
":let g:vifm_term="st -e"
":let g:vifm_embed_term=1
let g:vifm="vifm"
let g:vifm_embed_split=1
let g:vifm_embed_cwd=1

" Configuração de Nnn File Manager
let g:nnn#set_default_mappings=0
let g:nnn#statusline=0
let g:nnn#layout="tabnew"
let g:nnn#action={'<cr>':'tab split'}
let g:nnn#command='nnn -eo'

" Criando leader command
let mapleader = ","

" Enter para pular uma linha no modo normal
inoremap <cr> <C-m>
nnoremap <cr> o

" Remapeando as teclas de movimentação - :nnoremap (Normal Mode) no recursive
" nnoremap l e
" nnoremap h b
" vnoremap l e
" vnoremap h b
nnoremap j <Down>
nnoremap k <Up>
vnoremap j <Down>
vnoremap k <Up>
nnoremap <BackSpace> X
nnoremap <space> %
vnoremap <space> %

" Configuracao para digitação rápida
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap (( ()<Left>
inoremap {{ {}<Left>
inoremap [[ []<Left>

" Configuração para navegation keys
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
vnoremap <C-h> <Left>
vnoremap <C-j> <Down>
vnoremap <C-k> <Up>
vnoremap <C-l> <Right>
" <C-j> já está configurado para ser <Down>
nnoremap <C-h> <Left>
nnoremap <C-k> <Up>
nnoremap <C-l> <Right>

" Aumentar/diminuir números
nnoremap _ <C-x>
nnoremap + <C-a>

" Configuração troca de guias
nnoremap <TAB> gt
nnoremap <S-TAB> gT

" Configuração para PageUp PageDown
":nnoremap J <C-f>
":nnoremap K <C-b>
nnoremap K 19k
nnoremap J 19j

" Go to top/bottom marking last location
nnoremap gg mlgg
nnoremap G mlG

" Final da linha/início da linha (encontra o primeiro/último caracter)
nnoremap H ^
vnoremap H ^
nnoremap L g_
vnoremap L g_

" Esc rápido no Insert/Visual Mode
inoremap jj <esc>
vnoremap vv <esc>

" Completition Files/tags
inoremap <C-f> <C-x><C-f>

" Configuração para Operator-Pending Mapping (ao entrar com um comando, este espera por um Operator-Pending)
onoremap " i"
onoremap ( i(
onoremap { i{
onoremap [ i[
":onoremap ' i'
onoremap < i<
onoremap w iw
onoremap W iW
" Remapeando Visual Mode (como Operator-Pending)
vnoremap " i"
vnoremap ' i'
vnoremap ( i(
vnoremap [ i[
vnoremap { i{
vnoremap w iw

" Atalhos usando [ map <leader> ]

" Abrir netrw File Manager
":nnoremap <leader>ff :Texplore<cr>

" Abrir Nnn File Manager
":nnoremap <leader>ff :NnnPicker<cr>
":nnoremap <leader>ff :call NnnOpen()<cr>

" Abrir Vifm File Manager
nnoremap <leader>ff :TabVifm<cr>

" Transformar palavra para UpperCase
nnoremap <leader>u viwU

" Mudar para tela superior/inferior
nnoremap <leader>J <C-w><C-j>
nnoremap <leader>K <C-w><C-k>

" Sair sem salvar
nnoremap <leader>qq :q!<cr>
inoremap <leader>qq <esc>:q!<cr>

" Sair de todos os arquivos sem salvar
nnoremap <leader>QQ :qa<cr>

" Sair de todos os arquivos, salvando todos
nnoremap <leader>QW :wqa<cr>
inoremap <leader>QW <esc>:wqa<cr>

" Configuração rápida do vimrc
nnoremap <leader>rc :tabedit $MYVIMRC<cr>

" Source vimrc - Problema com Tabline do Airline Powerline (caracteres perdiam a cor)
nnoremap <leader>src :source $MYVIMRC<bar>:call RecarregarVimrc()<bar>:nohls<cr>

" Sair salvando arquivo
inoremap <leader>qw <esc>ZZ
nnoremap <leader>qw ZZ

" Salvar arquivo
inoremap <leader>w <esc>:w<cr>
nnoremap <leader>w :w<cr>

" Salvar todos os arquivos abertos (Modo Tab)
nnoremap <leader>W :wa<bar>:echom "Todos os arquivos foram salvos!"<cr>

" Retirar modo highlight search (Encontrar comando melhor)
nnoremap <leader>nn :nohls<bar>:echo<cr>

" Auto Indentação, trazendo o cursor para o local original
inoremap <leader><tab> <esc>magg=G`az.:w<cr>
nnoremap <leader><tab> magg=G`az.:w<cr>

" Criando :mksession
nnoremap <leader>mk :call SalvarSessao()<cr>

" Xclip - colar/copiar string usando seletor primary (xwindows). Também existe a opção com xsel
nnoremap <leader>v :call ColarTexto()<cr>"tP<bar>:echom "Seleção colada do clipboard!"<cr>
vnoremap <leader>c y:call system('xsel -i -b', @0)<bar>:echom "Seleção copiada para clipboard!"<cr>

" Substituir texto usando Visual mode para selecionar trechos a serem substituídos
vnoremap <leader>S :s///g<Left><Left><Left>
" Shortcut para :%s///g
nnoremap <leader>S :%s///g<Left><Left><Left>

" Pular um caracter no insert mode
inoremap <leader><space> <Right>


" Functions

" Colar texto do clipboard do sistema
function! ColarTexto()
	let @t=system("xsel -o -b")
endfunction

function! EliminarHidBuf()
	let id_ultimo_buf=bufnr("$")
	for id in range(1, id_ultimo_buf) 
		if bufloaded(id)==0&&buflisted(id)
			execute "silent bdelete " . id 
		endif
	endfor
endfunction

function! SalvarSessao()
	let l:respostaUsuario=confirm("Gostaria de SALVAR esta sessão ou ABRIR a anterior?", "Salvar\nAbrir Anterior", 2)
"	Salvar sessão
	if l:respostaUsuario==1
		call EliminarHidBuf()
		silent !rm ~/.vim/vimsessao.vim
		silent mksession ~/.vim/vimsessao.vim
		wall
		redraw!
		echom "Sessão e arquivos salvos com Sucesso!"
"	Abrir sessão anterior
	elseif l:respostaUsuario==2
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

function! RecarregarVimrc()
	AirlineRefresh
"	Comando para reload do arquivo (ao dar reload no vimrc, alguns arquivos perdem highlight)
	silent e
"	Comando :redraw redesenha a janela. Com a partícula [!], primeiramente limpa a janela e depois redesenha
	redraw! | echom "Configurações do arquivo vimrc atualizadas!"
endfunction

" Preenchimento de Template
function! TemplateJava()
	0read /home/andre/.vim/.esqueleto.java
	execute "normal! fTciw" . expand("%:t:r")
	execute "normal! 2j"
endfunction

" Funções para compilar e mostrar prováveis erros na tela do Vim (C, Java)
" Acrescentado o comando :silent, o prompt retorna imediatamente
function! CompilarCodigo()
	let l:extencaoArquivo = expand("%:e")
	if l:extencaoArquivo ==? "java"
		if bufexists(bufname("log_java.txt"))
			bdelete log_java.txt
		endif
		silent !clear&&javac "%:t" &> /home/andre/.vim/log_java.txt
		silent !clear&&bash /home/andre/.vim/log_java_script.sh
		redraw!
		split /home/andre/.vim/log_java.txt
		resize 10
		execute "normal! \<C-w>\<C-k>"
	elseif l:extencaoArquivo ==? "c"
		!clear&&cc -Wall -g "%:t"&&rm a.out
":		!clear&&cc -Wall -g "%:t"
	endif
endfunction

" Função para rodar código compilado (C, Python, Java)
function! RodarCodigo()
" Buscando saber qual comando deve ser executado 
	let l:extencaoArquivo = expand("%:e")
	if l:extencaoArquivo ==? "java"
		!clear&&java "%:t:r"
	elseif l:extencaoArquivo ==? "py"
		!clear&&python3 "%:t"
	elseif l:extencaoArquivo ==? "c"
		!clear&&tcc -run "%:t"
	endif
endfunction

" " Função para utilizar o comando :earlier
" " Função incompleta
" " Utilizar autocommand-event: CursorMoved
" " Falta lógica para determinar a hora de 'início'
" function! EarlierUndo()
" 	" Início
" 	let l:marcador_hora=strftime('%H')
" 	let l:marcador_minuto=strftime('%M')
" 	" Atual
" 	let l:hora=strftime('%H')
" 	let l:minuto=strftime('%M')
" 	" Cálculo do tempo em minutos
" 	let l:cal_hora=l:hora - l:marcador_hora
" 	let l:cal_minuto=l:minuto - l:marcador_minuto
" 	" Resultado para ir no comando earlier l:cmd_time
" 	let l:cmd_time=l:cal_hora * 60 + l:cal_minuto
" endfunction

" Autocommands

" Configuração para que a linha não tenha limite de fim
autocmd FileType * :set textwidth=0

" Match pair para $MYVIMRC
autocmd FileType vim :set mps+=<:>
autocmd FileType vim :inoremap < <><esc>i

" Atalhos para arquivos específicos
autocmd FileType java,c :nnoremap <leader><C-j> :call CompilarCodigo()<cr>
autocmd FileType java,python,c :nnoremap <leader><C-k> :call RodarCodigo()<cr>
autocmd FileType python :inoremap ; :
autocmd FileType html :inoremap < <><esc>i

" Configuração para comentstring [plugin commentary.vim]
autocmd FileType sh,bash setlocal commentstring=#\ %s
autocmd FileType c setlocal commentstring=/*\ %s\ */
autocmd FileType java setlocal commentstring=//\ %s
autocmd FileType vim setlocal commentstring=\"\ %s

" Compilar Suckless config - utilizar escape sequence para pipeline nos comandos passados pelo VIM
autocmd BufWritePost config.h :!sudo make clean install

" Templates de arquivos
autocmd FileType java :nnoremap <leader>java :call TemplateJava()<cr>

" Ao entrar no modo Insert, trocar o background da linha
autocmd! InsertEnter * :set cursorline
autocmd! InsertLeave * :set nocursorline

" Configurações para Plugin's
filetype indent plugin on

" Executa o Pathongen (Gerenciador de Plugin's)
execute pathogen#infect()

" Modifiquei o arquivo netrw.vim em /usr/share/vim/vim80/autoload/netrw.vim.
" Alterei os valores nnoremap de <cr>, -, %, r, D, d, R para respectivamente (l, h, f, R, d, n, r)
