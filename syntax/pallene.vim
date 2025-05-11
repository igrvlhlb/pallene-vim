if exists("b:current_syntax")
  finish
endif

runtime! syntax/lua.vim

" Keywords
syntax keyword palleneKeyword as record typealias export
syntax keyword palleneType nil boolean integer float string any

" Highlight groups
hi def link palleneKeyword Keyword
hi def link palleneType Type

let b:current_syntax = "pallene"
