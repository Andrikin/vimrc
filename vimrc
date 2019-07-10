"                                                __  __             __      ___
"                                               |  \/  |            \ \    / (_)
"                                               | \  / | ___ _   _   \ \  / / _ _ __ ___  _ __ ___
"                                               | |\/| |/ _ \ | | |   \ \/ / | | '_ ` _ \| '__/ __|
"                                               | |  | |  __/ |_| |    \  /  | | | | | | | | | (__
"                                               |_|  |_|\___|\__,_|     \/   |_|_| |_| |_|_|  \___|


" Minhas Configurações VIM
"
" Autor: Andre Alexandre Aguiar
" Email: andrealexandreaguiar@gmail.com

" Configurações utilizadas pelo Airline - Powerline
:set laststatus=2 
:set showtabline=2 
:set noshowmode 
":set rtp+=/home/andre/.local/lib/python2.7/site-packages/powerline/bindings/vim/ - Habilita Powerline-status (outro powerline)
:set t_Co=256
:let g:airline_powerline_fonts=1
:let g:airline#extensions#tabline#enabled=1
:let g:airline#extensions#tabline#formatter = "unique_tail"

" Variáveis que modificam statusline - Airline Powerline
:let g:airline_section_error=""
:let g:airline_section_warning=""

" Variáveis Tabline - Airline Powerline
:let g:airline#extensions#tabline#show_tab_type = 0
:let g:airline#extensions#tabline#show_tab_count = 0
:let g:airline#extensions#tabline#show_tab_nr = 0
:let g:airline#extensions#tabline#show_buffers = 0
:let g:airline#extensions#tabline#buffer_idx_mode = 0
:let g:airline#extensions#tabline#show_close_button = 0
:let g:airline#extensions#tabline#close_symbol = ""

" Define como o Vim busca por arquivos
:set path+=**

" Indicadores - números nas linhas
:set rnu 
:set nu

" Tamanho da indentação
:set tabstop=4
:set shiftwidth=4
:set softtabstop=4

" Configurações para search
:set incsearch
:set ignorecase
:set smartcase
:set hlsearch

" Configurações gerais
:set splitbelow
:set syntax=on.vim
:set autochdir
:set scrolloff=20

" Esquema de Cor
:colorscheme mycolors

" Configuração de Netrw
:let g:netrw_banner = 0
:let g:netrw_winsize = 85
:let g:netrw_liststyle = 0
:let g:netrw_list_hide= '^\..*'
:let g:netrw_bufsettings='noma nomod rnu nu nowrap ro nobl'

" Criando leader command
:let mapleader = ","

" Shortcut para :%s///g
:nnoremap S :%s///g<left><left><left>

" Enter para pular uma linha no modo normal
:inoremap <cr> <C-m>
:nnoremap <cr> o

" Remapeando as teclas de movimentação - :nnoremap (Normal Mode) no recursive
:nnoremap l w
:nnoremap h b
:nnoremap j <Down>
:nnoremap k <Up>
:vnoremap l w
:vnoremap h b
:vnoremap j <Down>
:vnoremap k <Up>
:nnoremap <BackSpace> X

" Configuracao para digitação rápida
:inoremap ( ()<left>
:inoremap { {}<left>
:inoremap " ""<left>
:inoremap [ []<left>
:inoremap ' ''<left>

" Configuração para navegation keys
:inoremap <C-h> <left>
:inoremap <C-j> <Down>
:inoremap <C-k> <Up>
:inoremap <C-l> <Right>
:vnoremap <C-h> <left>
:vnoremap <C-j> <Down>
:vnoremap <C-k> <Up>
:vnoremap <C-l> <Right>
" <C-j> já está configurado para ser <Down>
" <C-j> já está configurado para ser <Down>
:nnoremap <C-h> <left>
:nnoremap <C-k> <Up>
:nnoremap <C-l> <Right>

" Configuração troca de guias
:nnoremap <TAB> gt
:nnoremap <S-TAB> gT

" Configuração para PageUp PageDown
:nnoremap J <C-f>
:nnoremap K <C-b>

" Final da linha/início da linha (encontra o primeiro/último caracter)
:nnoremap H ^
:vnoremap H ^
:nnoremap L g_
:vnoremap L g_

" Esc rápido no Insert/Visual Mode
:inoremap jj <esc>
:vnoremap vv <esc>

" Completition Files/tags
:inoremap <C-f> <C-x><C-f>
":inoremap <C-]> <C-x><C-]>

" Atalhos usando map <leader>

" PageUp/PageDown
:nnoremap <leader>K 19k
:nnoremap <leader>J 19j

" Abrir netrw File Manager
:nnoremap <leader>ff :Texplore<cr>

" Sair sem salvar
:nnoremap <leader>qq :q<cr>
:inoremap <leader>qq <esc>:q<cr>

" Sair de todos os arquivos sem salvar
:nnoremap <leader>qa :qa<cr>

" Sair de todos os arquivos, salvando todos
:nnoremap <leader>wqa :wqa<cr>
:inoremap <leader>wqa <esc>:wqa<cr>

" Configuração rápida do vimrc
:nnoremap <leader>rc :tabedit $MYVIMRC<cr>

" Transformar palavra para UpperCase
:nnoremap <leader>u viwU

" Source vimrc - Problema com Tabline do Airline Powerline (alguns caracteres perdiam a cor)
:nnoremap <leader>xo :source $MYVIMRC<bar>:call RecarregarVimrc()<bar>:nohls<cr>

" Sair salvando arquivo
:inoremap <leader>qs <esc>ZZ
:nnoremap <leader>qs ZZ

" Salvar arquivo
:inoremap <leader>ss <esc>:w<cr>
:nnoremap <leader>ss :w<cr>

" Salvar todos os arquivos abertos (Modo Tab)
:nnoremap <leader>wa :wa<bar>:echom "Todos os arquivos foram salvos!"<cr>

" Retirar modo highlight search (Encontrar comando melhor)
:nnoremap <leader>nn :nohls<bar>:echo<cr>

" Fechar telas abertas em :split
:nnoremap <leader>qj <C-w><C-j>:q<cr>

" Mudar para tela superior/inferior
:nnoremap <leader>jm <C-w><C-j>
:nnoremap <leader>ki <C-w><C-k>

" Auto Indentação, trazendo o cursor para o local original
:inoremap <leader><tab> <esc>magg=G`az.:w<cr>
:nnoremap <leader><tab> magg=G`az.:w<cr>

" Atalho para AutoQuotation
:nnoremap <leader>qw ciw""<esc>F"pf,w
" Inicializo um registrador recursivo com o atalho. O atalho será aplicado até a última vírgula
:let @a = ',qw@a'
:nnoremap <leader>aq @a

" Criando :mksession
:nnoremap <leader>mk :call SalvarSessao()<cr>

" Configuração para Operator-Pending Mapping (ao entrar com um comando, este espera por um Operator-Pending)
:onoremap ( i(
:onoremap { i{
:onoremap [ i[
:onoremap " i"
":onoremap ' i'
:onoremap < i<
:onoremap w iw
:onoremap W iW

" Functions

:function! EliminarHidBuf()
:	let id_ultimo_buf=bufnr("$")
:	for id in range(1, id_ultimo_buf) 
:		if bufloaded(id)==0&&buflisted(id)
:			execute "silent bdelete " . id 
:		endif
:	endfor
:endfunction

:function! SalvarSessao()
:	let l:respostaUsuario=confirm("Gostaria de SALVAR esta sessão ou ABRIR a anterior?", "Salvar\nAbrir Anterior", 2)
"	Salvar sessão
:	if l:respostaUsuario==1
:		call EliminarHidBuf()
:		silent !rm ~/.vim/vimsessao.vim
:		silent mksession ~/.vim/vimsessao.vim
:		wall
:		redraw!
:		echom "Sessão e arquivos salvos com Sucesso!"
"	Abrir sessão anterior
:	elseif l:respostaUsuario==2
:		if filereadable("/home/andre/.vim/vimsessao.vim")
:			silent source ~/.vim/vimsessao.vim
:			redraw!
:			AirlineRefresh
:			echom "Sessão inicializada com Sucesso!"
:		else
"			A mensagem de erro atua como um throw exception, informando onde o erro aconteceu e a mensagem de erro
:			echoerr "Arquivo ~/.vim/vimsessao.vim não existe! Criando arquivo vimsessao.vim"
:			silent mksession ~/.vim/vimsessao.vim
:			echohl MoreMsg | echom "Arquivo criado com sucesso!" | echohl None
:		endif
:	else
:		echo "\n" | call SalvarSessao()
:	endif
:endfunction

:function! RecarregarVimrc()
:	AirlineRefresh
"	Comando para reload do arquivo (ao dar reload no vimrc, alguns arquivos perdem highlight)
:	silent e
"	Comando :redraw redesenha a janela. Com a partícula [!], primeiramente limpa a janela e depois redesenha
:	redraw! | echom "Configurações do arquivo vimrc atualizadas!"
:endfunction

" Preenchimento de Template
:function! TemplateJava()
:	0read /home/andre/.vim/.esqueleto.java
:	execute "normal! fTciw" . expand("%:t:r")
:	execute "normal! 2j"
:endfunction

" Funções para compilar e mostrar prováveis erros na tela do Vim
" Acrescentado o comando :silent, o prompt retorna imediatamente
:function! CompilarJava()
:	if bufexists(bufname("log_java.txt"))
:		bdelete log_java.txt
:	endif
:	silent !clear&&javac "%:t" &> /home/andre/.vim/log_java.txt
:	silent !clear&&bash /home/andre/.vim/log_java_script.sh
:	redraw!
:	split /home/andre/.vim/log_java.txt
:	resize 10
:	execute "normal! \<C-w>\<C-k>"
:endfunction

" Função para rodar código compilado
:function! RodarCodigo()
" Buscando saber qual comando deve ser executado 
:	let l:nomeDoArquivo = expand("%:e")
:	if l:nomeDoArquivo ==? "java"
:		!clear&&java "%:t:r"
:	elseif l:nomeDoArquivo ==? "py"
:		!clear&&python3 "%:t"
:	endif
:endfunction

" Autocommands

" Match pair para $MYVIMRC
:autocmd FileType vim :set mps+=<:>
:autocmd FileType vim :inoremap < <><esc>i
:autocmd FileType vim :set textwidth=0

" Atalhos para arquivos específicos
:autocmd FileType java :nnoremap <leader><C-j> :call CompilarJava()<cr>
:autocmd FileType java,python :nnoremap <leader><C-k> :call RodarCodigo()<cr>
:autocmd FileType python :inoremap ; :

" Templates de arquivos
:autocmd FileType java :nnoremap <leader>java :call TemplateJava()<cr>

" Configurações para Plugin's
:filetype indent plugin on

" Executa o Pathongen (Gerenciador de Plugin's?)
execute pathogen#infect()

" Modifiquei o arquivo netrw.vim em /usr/share/vim/vim80/autoload/netrw.vim.
" Alterei os valores nnoremap de <cr>, -, %, r, D, d, R para respectivamente (l, h, f, R, d, n, r)
