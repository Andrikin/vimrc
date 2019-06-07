"Configurações do Vim

"Configurações utilizadas pelo Airline - Powerline
:set laststatus=2 "Always display the statusline in all windows
:set showtabline=2 "Always display the tabline, even if there is only one tab
:set noshowmode "Hide the default mode text (e.g. -- INSERT -- below the statusline)
":set rtp+=/home/andre/.local/lib/python2.7/site-packages/powerline/bindings/vim/ - Habilita Powerline-status (outro powerline)
:set t_Co=256
:let g:airline_powerline_fonts=1
:let g:airline#extensions#tabline#enabled=1
:let g:airline#extensions#tabline#formatter = "unique_tail"

"Define como o Vim busca por arquivos
:set path+=**
"Indicadores - números nas linhas
:set rnu 
:set nu
"Tamanho da indentação
:set tabstop=4
:set shiftwidth=4
:set softtabstop=4
"Configurações para search
:set incsearch
:set ignorecase
:set smartcase
:set hlsearch

"Configurações gerais
:set splitbelow
:set syntax=on.vim

"Quantidade de linhas que serão o limite para a rolagem (linhas acima/linhas abaixo do cursor)
:set scrolloff=20

"Esquema de Cor
:colorscheme mycolors

"Configuração de Netrw
:let g:netrw_banner = 0
"let g:netrw_cursor = 1
:let g:netrw_winsize = 85
:let g:netrw_liststyle = 0
:let g:netrw_list_hide= '^\..*'
:let g:netrw_bufsettings='noma nomod rnu nu nowrap ro nobl'

"Criando leader command
:let mapleader = ","

"Shortcut para :%s///gc
:nnoremap S :%s//gc<LEFT><LEFT><Left>

"Enter para pular uma linha no modo normal
:inoremap <CR> <C-m>
:nnoremap <CR> o
"Remapeando as teclas de movimentação - :nnoremap (Normal Mode) no recursive
:nnoremap l w
:nnoremap h b
:nnoremap j <Down>
:nnoremap k <Up>
:vnoremap l w
:vnoremap h b
:vnoremap j <Down>
:vnoremap k <Up>
:nnoremap <BackSpace> X

"Configuracao para digitação rápida
:inoremap ( ()<left>
:inoremap { {}<left>
:inoremap " ""<left>
:inoremap [ []<left>
:inoremap ' ''<left>
"Configuração para navegation keys
:inoremap <C-h> <Left>
:inoremap <C-j> <Down>
:inoremap <C-k> <Up>
:inoremap <C-l> <Right>
"<c-j> já está configurado para ser <Down>
:nnoremap <C-h> <Left>
:nnoremap <C-k> <Up>
:nnoremap <C-l> <Right>
"Configuração troca de guias
:nnoremap <TAB> gt
:nnoremap <S-TAB> gT
"Configuração para PageUp PageDown
:nnoremap J <c-f>
:nnoremap K <c-b>
"Final da linha/início da linha (encontra o primeiro/último caracter)
:nnoremap H ^
:vnoremap H ^
:nnoremap L g_
:vnoremap L g_
"Esc rápido no Insert/Visual Mode
:inoremap jj <ESC>
:vnoremap vv <ESC>
"Completition Files/tags
:inoremap <c-f> <c-x><c-f>
:inoremap <c-]> <c-x><c-]>

"Atalhos usando map <leader>

"Ir para primeira linha/última linha
"Se scrolloff está setado, estes comandos não são úteis
":nnoremap <leader>k H
":nnoremap <leader>j L
":nnoremap <leader>m M
"Em contrapartida mudar para estes comandos
:nnoremap <leader>k<space> 19k
:nnoremap <leader>j<space> 19j
"Abrir netrw File Manager
:nnoremap <leader>fff :Texplore<CR>
"Sair sem salvar
:nnoremap <leader>qq :q<CR>
:inoremap <leader>qq <ESC>:q<CR>
"Sair de todos os arquivos sem salvar
:nnoremap <leader>qa :qa<cr>
"Configuração rápida do vimrc
:nnoremap <leader>rc :tabedit $MYVIMRC<CR>
"Transformar palavra para UpperCase
:nnoremap <leader>u viwU
"Source vimrc
:nnoremap <leader>xo :source $MYVIMRC<cr><bar>:echom "Arquivo vimrc atualizado!"<cr>
"Sair salvando arquivo
:inoremap <leader>qs <Esc>ZZ
:nnoremap <leader>qs ZZ
"Salvar arquivo
:inoremap <leader>ss <Esc>:w<CR>
:nnoremap <leader>ss :w<CR>
"Salvar todos os arquivos abertos (Modo Tab)
:nnoremap <leader>wa :wa<CR><bar>:echom "Todos os arquivos foram salvos!"<cr>
"Retirar modo highlight search (Encontrar comando melhor)
:nnoremap <leader>nn :nohl<bar>:echo<cr>
"Fechar telas abertas em :split
:nnoremap <leader>qj <c-w><c-j>:q<cr>
"Mudar para tela superior/inferior
:nnoremap <leader>J <c-w><c-j>
:nnoremap <leader>K <c-w><c-k>

"Colar/copiar e recortar do clip board do sistema - Não estão funcionando
":nnoremap <leader><c-v> <s-Insert>
":nnoremap <leader><c-c> <c-Insert>
":nnoremap <leader><c-x> <c-del>

"Auto Indentação, trazendo o cursor para o local original
:inoremap <leader><tab> <Esc>magg=G`az.:w<CR>
:nnoremap <leader><tab> magg=G`az.:w<CR>

"Atalho para AutoQuotation
:nnoremap <leader>qw ciw""<esc>F"pf,w
"Inicializo um registrador recursivo com o atalho. O atalho será aplicado até
"a última vírgula
:let @a = ',qw@a'
:nnoremap <leader>aq @a

"Configuração para Operator-Pending Mapping (ao entrar com um comando, este espera por um Operator-Pending)
:onoremap ( i(
:onoremap { i{
:onoremap [ i[
:onoremap " i"
:onoremap < i<
:onoremap w iw

"Functions

"Preenchimento de Template
:function TemplateJava()
:	let l:nomeDoArquivo=split(expand("%:t"), "\\.")
:	execute "normal! :-1read /home/andre/.vim/.esqueleto.java\rf<ciw" . l:nomeDoArquivo[0]
:	execute "normal! 2j"
:endfunction

"Função que verifica se o buffer está no diretório correto
:function CorrigirDiretorio()
:	let l:caminhoDoArquivo = expand("%:p")
:	if getcwd() != l:caminhoDoArquivo
:		let l:tamanhoStringArquivo = len(expand('%:t'))+1
:		execute ":cd " . l:caminhoDoArquivo[:-(l:tamanhoStringArquivo)]
:	endif
:endfunction

"Funções para compilar e mostrar prováveis erros na tela do Vim
:function CompilarJava()
:	:call CorrigirDiretorio()
:	let l:nomeDoArquivo = expand('%:t')
"Acrescentado o comando :silent, o prompt retorna imediatamente
:	execute ":silent ! javac " . l:nomeDoArquivo . " &> /home/andre/.vim/log_java.txt"
:	execute ":silent ! bash /home/andre/.vim/log_java_script.sh"
:	split /home/andre/.vim/log_java.txt
:	resize 10
:	execute "normal! \<c-w>\<c-k>"
:endfunction

"Função para rodar código compilado
"A ideia é fazer um método genérico para vários formatos de arquivos (Java/Python)
:function RodarCodigo()
"Caso o arquivo foi aberto num diretório diferente, ir para diretório do arquivo
:	:call CorrigirDiretorio()
:
"Programando qual comando deve ser executado 
:	let l:nomeDoArquivo = split(expand('%:t'), "\\.")
:	if l:nomeDoArquivo[1] == "java"
"Index and slice strings - como no Python - lembrar que é utilizado as posições dos caracteres para 'cortar' a string, removendo .java
"'.' concatena Strings
:		execute ":!clear&&java " . l:nomeDoArquivo[0]
:	elseif l:nomeDoArquivo[1] == "py"
:		execute ":!clear&&python3 " . l:nomeDoArquivo[0] . "." . l:nomeDoArquivo[1] 
:	endif
:endfunction

"Autocommands

"Match pair para $MYVIMRC
:autocmd FileType vim :set mps+=<:>
:autocmd FileType vim :inoremap < <><Esc>i
:autocmd FileType vim :set textwidth=0

"Atalhos para arquivos específicos
:autocmd FileType java :nnoremap <leader><c-j> :call CompilarJava()<cr>
:autocmd FileType java,python :nnoremap <leader><c-k> :call RodarCodigo()<cr>

"Templates de arquivos
:autocmd FileType java :nnoremap <leader>java :call TemplateJava()<cr>

"Configurações para Plugin's
:filetype indent plugin on

"Executa o Pathongen (Gerenciador de Plugin's?)
execute pathogen#infect()

"Modifiquei o arquivo netrw.vim em /usr/share/vim/vim80/autoload/netrw.vim.
"Alterei os valores nnoremap de <cr>, -, %, r, D, d, R
