" Vim compiler file for Java
" Compiler:	Java
" Maintainer: André Alexandre Aguiar

if exists("current_compiler")
  finish
endif
let current_compiler = "java"

let s:cpo_save = &cpo
set cpo&vim

if exists(":CompilerSet") != 2
  command -nargs=* CompilerSet setlocal <args>
endif

" TODO: Verify errorformat value
CompilerSet errorformat=%E%f:%l:\ %m,%-Z%p^,%-C%.%#,%-G%.%#
CompilerSet makeprg=javac\ %

let &cpo = s:cpo_save
