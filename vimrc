"Configurações do Vim-----------------------------------------------------------

"Configurações do Powerline----------------
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
:set hlsearch
:set mps+=<:>,=:;
"Configaurações para search
:set incsearch
:set ignorecase
:set smartcase

"Configuração para autoindent
":set autoindent
":set smartindent

"Esquema de Cor
:colorscheme koehler

"Configuração de Netrw
:let g:netrw_banner = 0
"let g:netrw_cursor = 1
:let g:netrw_winsize = 85
:let g:netrw_liststyle = 0
:let g:netrw_list_hide= '^\..*'
:let g:netrw_bufsettings='noma nomod rnu nu nowrap ro nobl'

"Auto reload das configurações do vimrc
"autocmd BufWritePost ~/.vim/vimrc source ~/.vim/vimrc

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
:nnoremap <CR> o<esc>
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
:nnoremap L $
"Ir para primeira linha/última linha
:nnoremap <leader>k H
:nnoremap <leader>j L
:nnoremap <leader>m M
"Esc rápido no Insert Mode
:inoremap jj <ESC>
"Abrir netrw
":nnoremap <leader>ex :tabnew<CR>:Ex<CR><bar>:set rnu<cr><bar>:set nu<cr>
:nnoremap <leader>ex :tabnew<CR>:Ex<CR>
"Sair sem salvar
:nnoremap <leader>q :q<CR>
:inoremap <leader>q <ESC>:q<CR>
:nnoremap <leader>qa :qa<cr>
"Configuração rápida do vimrc
:nnoremap <leader>rc :tabedit $MYVIMRC<CR>
"Transformar palavra para UpperCase
:nnoremap <leader>u viwU
"Source vimrc
:nnoremap <leader>xo :source $MYVIMRC<cr><bar>:echom ".vimrc atualizado!"<cr>
"Sair salvando arquivo
:inoremap <leader>qs <Esc>ZZ
:nnoremap <leader>qs ZZ
"Salvar arquivo
:inoremap <leader>s <Esc>:w<CR>
:nnoremap <leader>s :w<CR>
"Salvar todos os arquivos abertos (Tab)
:nnoremap <leader>all :wa<CR>

"Abbreviations

"Atalho para autoQuotation
:nnoremap <leader>qw cw""<esc>F"pf,w
"Inicializo um registrador recursivo com o atalho. O atalho será aplicado até
"a última vírgula
:let @a = ',qw@a'
:nnoremap <leader>aq @a

"Configuração para Operator-Pending Mapping
:onoremap ( i(
:onoremap { i{
:onoremap [ i[
:onoremap " i"
:onoremap < i<
:onoremap w iw

"Tela centralizada (problema com movimentação de cursor, zz impede que ele se
"mova)
":aug telaCentralizada
":	au CursorMoved * :normal zz
":	au CursorMovedI * :normal zz
":aug END

"Autocommands

"Configurações para Python
filetype indent plugin on

"Highlight Cursor 
"highlight Cursor gui=NONE ctermfg=Black ctermbg=White

"Cursor bliking
"set guicursor+=a:blinkon0

"Configuração do popmenu completition
highlight  Pmenu        ctermbg=white   ctermfg=black
highlight  PmenuSel     ctermbg=blue    ctermfg=white   cterm=bold
highlight  PmenuSbar    ctermbg=grey    ctermfg=grey
highlight  PmenuThumb   ctermbg=blue    ctermfg=blue
