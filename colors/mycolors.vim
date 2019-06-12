highlight clear
set background=dark
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "mycolors"
highlight Normal		  ctermfg=white
highlight Scrollbar	      guifg=darkcyan guibg=cyan
highlight Menu			  guifg=black guibg=cyan
highlight SpecialKey	  cterm=bold  ctermfg=darkred  
highlight NonText		  cterm=bold  ctermfg=darkred 
highlight Directory	      cterm=bold  ctermfg=lightblue  
highlight ErrorMsg		  cterm=bold  ctermfg=grey  ctermbg=red  
highlight Search		  ctermfg=white  ctermbg=red      
highlight MoreMsg		  cterm=bold  ctermfg=darkgreen	
highlight ModeMsg		  cterm=bold  
highlight LineNr		  cterm=bold  ctermfg=white	
highlight CursorLineNr 	  cterm=bold  ctermfg=red	
highlight Question		  cterm=bold  ctermfg=white	
highlight StatusLine	  cterm=bold ctermfg=lightblue ctermbg=white 
highlight StatusLineNC    ctermfg=white ctermbg=lightblue 
highlight Title		      cterm=bold  ctermfg=darkmagenta  
highlight Visual		  cterm=reverse  
highlight WarningMsg	  cterm=bold  ctermfg=darkred 
highlight Cursor		  cterm=bold
highlight Comment		  cterm=bold,italic ctermfg=darkblue
highlight Constant		  cterm=bold ctermfg=magenta  
highlight Special		  cterm=bold ctermfg=red  
highlight Identifier	  ctermfg=lightblue  
highlight Statement	      cterm=bold ctermfg=yellow	
highlight PreProc		  ctermfg=darkmagenta  
highlight Type			  cterm=bold ctermfg=lightgreen  
highlight Error		      ctermfg=darkcyan  ctermbg=black 
highlight Todo			  ctermfg=black	ctermbg=darkcyan  
highlight CursorLine	  cterm=bold ctermbg=242
highlight CursorColumn	  cterm=underline
highlight TabLine		  cterm=bold ctermfg=lightblue ctermbg=white 
highlight TabLineFill	  cterm=bold ctermfg=lightblue ctermbg=white 
highlight TabLineSel	  ctermfg=white ctermbg=lightblue 
highlight Underlined	  cterm=bold,underline ctermfg=lightblue 
highlight Ignore		  ctermfg=black ctermbg=black 
highlight EndOfBuffer	  cterm=bold  ctermfg=darkred 
highlight Pmenu           ctermbg=7   ctermfg=black
highlight PmenuSel        ctermbg=242    ctermfg=7   cterm=bold
highlight PmenuSbar       ctermbg=7    ctermfg=7
highlight PmenuThumb      ctermbg=242    ctermfg=242
highlight MatchParen      cterm=bold ctermbg=242    ctermfg=7
highlight link IncSearch		Visual
highlight link String			Constant
highlight link Character		Constant
highlight link Number			Constant
highlight link Boolean			Constant
highlight link Float			Number
highlight link Function		    Identifier
highlight link Conditional		Statement
highlight link Repeat			Statement
highlight link Label			Statement
highlight link Operator		    Statement
highlight link Keyword			Statement
highlight link Exception		Statement
highlight link Include			PreProc
highlight link Define			PreProc
highlight link Macro			PreProc
highlight link PreCondit		PreProc
highlight link StorageClass	    Type
highlight link Structure		Type
highlight link Typedef			Type
highlight link Tag				Special
highlight link SpecialChar		Special
highlight link Delimiter		Special
highlight link SpecialComment	Special
highlight link Debug			Special
