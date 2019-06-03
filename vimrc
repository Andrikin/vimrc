"Configurações do Vim

"Configurações do Powerline
:set laststatus=2 "Always display the statusline in all windows
:set showtabline=2 "Always display the tabline, even if there is only one tab
:set noshowmode "Hide the default mode text (e.g. -- INSERT -- below the statusline)
:set rtp+=/home/andre/.local/lib/python2.7/site-packages/powerline/bindings/vim/
:set t_Co=256

"Define como o Vim busca por arquivos
:set path+=**
"Numero nas Linhas
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

"Setando cursorline para habilitar HIGHLIGHT CursorLine (mudar o background da linha, uma maneira de enxeguar melhor onde está o cursor - Não deu muito certo)
":set cursorline

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
":nnoremap kj <Insert>
:nnoremap j <Down>
:nnoremap k <Up>
:nnoremap <BackSpace> X

"Configuracao para digitação rápida
:inoremap ( ()<Esc>i
:inoremap { {}<Esc>i
:inoremap " ""<Esc>i
:inoremap [ []<Esc>i
:inoremap ' ''<Esc>i
"Configuração para navegation keys
:inoremap <C-h> <Left>
:inoremap <C-j> <Down>
:inoremap <C-k> <Up>
:inoremap <C-l> <Right>
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
:nnoremap <leader>k H
:nnoremap <leader>j L
:nnoremap <leader>m M
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
:nnoremap <leader>wa :wa<CR>
"Retirar modo highlight search (Encontrar comando melhor)
:nnoremap <leader>nh :nohl<bar>:echo<cr>
"Colar/copiar e recortar do clip board do sistema
:nnoremap <leader><c-v> <s-Insert>
:nnoremap <leader><c-c> <c-Insert>
:nnoremap <leader><c-x> <c-del>
"Auto Indentação, trazendo o cursor para o local original
:inoremap <leader><tab> <Esc>magg=G`az.:w<CR>
:nnoremap <leader><tab> magg=G`az.:w<CR>

"Atalho para AutoQuotation
:nnoremap <leader>qw ciw""<esc>F"pf,w
"Inicializo um registrador recursivo com o atalho. O atalho será aplicado até
"a última vírgula
:let @a = ',qw@a'
:nnoremap <leader>aq @a

"Templates de arquivos
:nnoremap <leader>java :-1read /home/andre/.vim/.esqueleto.java<cr>2jcc

"Configuração para Operator-Pending Mapping (ao entrar com um comando, este espera por um Operator-Pending)
:onoremap ( i(
:onoremap { i{
:onoremap [ i[
:onoremap " i"
:onoremap < i<
:onoremap w iw

"Functions

"Funções para compilar e rodar java/python
:function CompilarJava()
:	let l:nomeDoArquivo = expand('%:p')
:	execute ":!clear&&javac " . l:nomeDoArquivo
:endfunction

"a ideia é fazer um método genérico para vários formatos de arquivos (Java/Python)
:function RodarCodigo()
"caso o arquivo foi aberto num diretório diferente, ir para diretório do arquivo
:	let l:tamanhoStringArquivo = len(expand('%:t'))+1
:	let l:caminhoDoArquivo = expand("%:p")
:	execute ":cd " . l:caminhoDoArquivo[:-(l:tamanhoStringArquivo)]
:	let l:nomeDoArquivo = expand('%:t')
:	let l:formatoDoArquivo = split(expand('%:t'), "\\.")
:
"programando qual comando deve ser executado 
:	if l:formatoDoArquivo[1] == "java"
"index and slice strings - como no Python - lembrar que é utilizado as posições dos caracteres para 'cortar' a string, removendo .java
"'.' concatena Strings
:		execute ":!clear&&java " . l:nomeDoArquivo[:-6]
:	elseif l:formatoDoArquivo[1] == "py"
:		execute ":!clear&&python3 " . l:nomeDoArquivo
:	endif
:		
:endfunction

"Autocommands

"Match pair para arquivos vim
:autocmd FileType vim :set mps+=<:>
:autocmd FileType vim :inoremap < <><Esc>i
:autocmd FileType $MYVIMRC :set textwidth=0

"Atalhos para arquivos específicos
:autocmd FileType java :nnoremap <leader><c-j> :call CompilarJava()<esc>
:autocmd FileType java,python :nnoremap <leader><c-k> :call RodarCodigo()<esc>

"Configuração para compilar java e obter mensagens de erro dentro do Vim - ANALISAR COMO USAR
":autocmd FileType java :set makeprg=javac\ %
":autocmd FileType python :set makeprg=python3\ %
"Comando para compilar os arquivos
":nnoremap <leader><F7> :execute ":!clear"<bar>:make<cr>j:copen<cr>
"ErrorFormat genérico
":set errorformat=%A%t

"Configurações para Plugin's
:filetype indent plugin on
