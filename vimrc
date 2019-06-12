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
":let g:airline_section_a=
":let g:airline_section_b=    
":let g:airline_section_c=    
":let g:airline_section_gutter=
":let g:airline_section_x=    
":let g:airline_section_y=    
":let g:airline_section_z=    
:let g:airline_section_error=""
:let g:airline_section_warning=""

" Variáveis Tabline - Airline Powerline
:let g:airline#extensions#tabline#show_tab_count = 0
:let g:airline#extensions#tabline#show_tab_nr = 0
:let g:airline#extensions#tabline#show_buffers = 0
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

" Quantidade de linhas que serão o limite para a rolagem (linhas acima/linhas abaixo do cursor)
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

" Shortcut para :%s///gc
:nnoremap S :%s//gc<left><left><left>

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
" <c-j> já está configurado para ser <Down>
:nnoremap <C-h> <left>
:nnoremap <C-k> <Up>
:nnoremap <C-l> <Right>

" Configuração troca de guias
:nnoremap <TAB> gt
:nnoremap <S-TAB> gT

" Configuração para PageUp PageDown
:nnoremap J <c-f>
:nnoremap K <c-b>

" Final da linha/início da linha (encontra o primeiro/último caracter)
:nnoremap H ^
:vnoremap H ^
:nnoremap L g_
:vnoremap L g_

" Esc rápido no Insert/Visual Mode
:inoremap jj <esc>
:vnoremap vv <esc>

" Completition Files/tags
:inoremap <c-f> <c-x><c-f>
:inoremap <c-]> <c-x><c-]>

" Atalhos usando map <leader>

" Ir para primeira linha/última linha
" Se scrolloff está setado, estes comandos não são úteis
":nnoremap <leader>k H
":nnoremap <leader>j L
":nnoremap <leader>m M
"
" Em contrapartida mudar para estes comandos
:nnoremap <leader>k<space> 19k
:nnoremap <leader>j<space> 19j

" Abrir netrw File Manager
:nnoremap <leader>fff :Texplore<cr>

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
:nnoremap <leader>xo :source $MYVIMRC<bar>:call RecarregarVimrc()<cr>

" Sair salvando arquivo
:inoremap <leader>qs <esc>ZZ
:nnoremap <leader>qs ZZ

" Salvar arquivo
:inoremap <leader>ss <esc>:w<cr>
:nnoremap <leader>ss :w<cr>

" Salvar todos os arquivos abertos (Modo Tab)
:nnoremap <leader>wa :wa<bar>:echom "Todos os arquivos foram salvos!"<cr>

" Retirar modo highlight search (Encontrar comando melhor)
:nnoremap <leader>nn :nohl<bar>:echo<cr>

" Fechar telas abertas em :split
:nnoremap <leader>qj <c-w><c-j>:q<cr>

" Mudar para tela superior/inferior
:nnoremap <leader>J <c-w><c-j>
:nnoremap <leader>K <c-w><c-k>

" Colar/copiar e recortar do clip board do sistema - Não estão funcionando
":nnoremap <leader><c-v> <s-Insert>
":nnoremap <leader><c-c> <c-Insert>
":nnoremap <leader><c-x> <c-del>

" Auto Indentação, trazendo o cursor para o local original
:inoremap <leader><tab> <esc>magg=G`az.:w<cr>
:nnoremap <leader><tab> magg=G`az.:w<cr>

" Atalho para AutoQuotation
:nnoremap <leader>qw ciw""<esc>F"pf,w
" Inicializo um registrador recursivo com o atalho. O atalho será aplicado até a última vírgula
:let @a = ',qw@a'
:nnoremap <leader>aq @a

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

:function! RecarregarVimrc()
:	AirlineRefresh
" Comando :e produz o reload do arquivo
:	silent e
" Comando :redraw redesenha a janela. Com a partícula [!], primeiramente limpa a janela e depois redesenha
:	redraw
:	echom "Configurações do arquivo vimrc atualizadas!"
:	nohl
:endfunction

" Preenchimento de Template
:function! TemplateJava()
:	0read /home/andre/.vim/.esqueleto.java
:	execute "normal! fTciw" . expand("%:t:r")
:	execute "normal! 2j"
:endfunction

" Função que verifica se o buffer está no diretório correto
:function! CorrigirDiretorio()
:	if getcwd() != expand("%:p")
:		execute ":cd " . expand("%:p:h")
:	endif
:endfunction

" Funções para compilar e mostrar prováveis erros na tela do Vim
" Acrescentado o comando :silent, o prompt retorna imediatamente
:function! CompilarJava()
:	call CorrigirDiretorio()
:	if buflisted(bufname("log_java.txt"))
:		bdelete ~/.vim/log_java.txt
:	endif
:	silent !javac "%:t" &> /home/andre/.vim/log_java.txt
:	silent !clear&&bash /home/andre/.vim/log_java_script.sh
:	redraw!
:	split /home/andre/.vim/log_java.txt
:	resize 10
:	execute "normal! \<c-w>\<c-k>"
:endfunction

" Função para rodar código compilado
" A ideia é fazer um método genérico para vários formatos de arquivos (Java/Python)
:function! RodarCodigo()
:	:call CorrigirDiretorio()
" Buscando saber qual comando deve ser executado 
:	let l:nomeDoArquivo = expand("%:e")
:	if l:nomeDoArquivo == "java"
:		execute ":!clear&&java " . expand("%:t:r")
:	elseif l:nomeDoArquivo == "py"
:		execute ":!clear&&python3 " . expand("%:t")
:	endif
:endfunction

" Autocommands

" Match pair para $MYVIMRC
:autocmd FileType vim :set mps+=<:>
:autocmd FileType vim :inoremap < <><esc>i
:autocmd FileType vim :set textwidth=0

" Atalhos para arquivos específicos
:autocmd FileType java :nnoremap <leader><c-j> :call CompilarJava()<cr>
:autocmd FileType java,python :nnoremap <leader><c-k> :call RodarCodigo()<cr>

" Templates de arquivos
:autocmd FileType java :nnoremap <leader>java :call TemplateJava()<cr>

" Configurações para Plugin's
:filetype indent plugin on

" Executa o Pathongen (Gerenciador de Plugin's?)
execute pathogen#infect()

" Modifiquei o arquivo netrw.vim em /usr/share/vim/vim80/autoload/netrw.vim.
" Alterei os valores nnoremap de <cr>, -, %, r, D, d, R para respectivamente (l, h, f, R, d, n, r)
