if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syntax include @MAKE syntax/make.vim

syntax match plinkComment "\v#.*$" contains=@Spell
hi! def link plinkComment Comment

syntax match plinkLink "<="
hi! def link plinkLink Operator

syn region  plinkString start=+\(\\\)\@<!"+  skip=+\\.+  end=+"+  contains=makeIdent
syn region  plinkString start=+\(\\\)\@<!'+  skip=+\\.+  end=+'+  contains=makeIdent
hi! def link plinkString String

syntax region plinkDep start="^\@<!\[" end="]" oneline contains=makeIdent
hi! def link plinkDep Include

syntax region plinkTarget start="^[^#[]" end="]" oneline contains=makeIdent,plinkDep
syntax region plinkTarget start="^[^#]" end="!!\?" oneline contains=makeIdent,plinkDep
hi! def link plinkTarget makeTarget

let b:current_syntax='plink'

let &cpo = s:cpo_save
unlet s:cpo_save
