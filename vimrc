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
"Configurações gerais
:set hlsearch
:set textwidth=0

"Esquema de Cor
:colorscheme koehler

"Configuração de Netrw
:let g:netrw_banner = 0
"let g:netrw_cursor = 1
:let g:netrw_winsize = 85
:let g:netrw_liststyle = 0
:let g:netrw_list_hide= '^\..*'
:let g:netrw_bufsettings='noma nomod rnu nu nowrap ro nobl'

"Criando leader command
:let mapleader = ","

"Auto Indentação, trazendo o cursor para o local original
:inoremap <F3> <Esc>magg=G`az.:w<CR>
:nnoremap <F3> magg=G`az.:w<CR>
"Retirar modo highlight search (Encontrar comando melhor)
:nnoremap <silent> <F4> :nohlsearch<Bar>:echo<CR>

"Shortcut para :%s///gc
:nnoremap S :%s//gc<LEFT><LEFT><Left>

"Enter para pular uma linha no modo normal
:inoremap <CR> <C-m>
:nnoremap <CR> o<esc>cc
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
"Final da linha/início da linha
:nnoremap H ^
:vnoremap H ^
:nnoremap L $
:vnoremap L $
"Esc rápido no Insert Mode
:inoremap jj <ESC>
:vnoremap vv <ESC>

"Atalhos usando map <leader>

"Ir para primeira linha/última linha
:nnoremap <leader>k H
:nnoremap <leader>j L
:nnoremap <leader>m M
"Abrir netrw
:nnoremap <leader>ex :Texplore<CR>
"Sair sem salvar
:nnoremap <leader>q :q<CR>
:inoremap <leader>q <ESC>:q<CR>
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
:nnoremap <leader>all :wa<CR>

"Atalho para autoQuotation
:nnoremap <leader>qw cw""<esc>F"pf,w
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

"Funções para compilar e rodar java/python
:function CompilarJava()
:	let l:nomeDoArquivo = expand('%:t')
:	execute ":!clear&&javac " . l:nomeDoArquivo
:endfunction


:function RodarJava()
:	let l:nomeDoArquivo = expand('%:t')
"index and slice strings - como no Python - lembrar que é utilizado as posições dos caracteres para 'cortar' a string
"removendo .java
:	execute ":!clear&&java " . l:nomeDoArquivo[:-6]
:endfunction

:function RodarPython()
:	let l:nomeDoArquivo = expand('%:t')
:	execute ":!clear&&python3 " . l:nomeDoArquivo
:endfunction


"Autocommands

"Match pair para arquivos vim
:autocmd FileType vim :set mps+=<:>
:autocmd FileType vim :inoremap < <><Esc>i

"Atalhos para arquivos específicos
:autocmd FileType java :nnoremap <leader><F5> :call CompilarJava()<esc>
:autocmd FileType java :nnoremap <leader><F6> :call RodarJava()<esc>
:autocmd FileType python :nnoremap <leader><F6> :call RodarPython()<esc>

"Configurações para Python
:filetype indent plugin on

"Configuração do popmenu completition
highlight  Pmenu        ctermbg=7   ctermfg=black
highlight  PmenuSel     ctermbg=242    ctermfg=7   cterm=bold
highlight  PmenuSbar    ctermbg=7    ctermfg=7
highlight  PmenuThumb   ctermbg=242    ctermfg=242
"Configurações para cores do cursor quando match pair
highlight  MatchParen   cterm=bold ctermbg=242    ctermfg=7
