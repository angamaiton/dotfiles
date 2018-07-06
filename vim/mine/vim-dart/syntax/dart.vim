if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'dart'
endif

syntax sync fromstart
syntax case match

" Noise
syntax match dartNoise /[:,;]/

" Program Keywords
syntax keyword dartOperatorKeyword new in of void
syntax keyword dartBooleanTrue    true
syntax keyword dartBooleanFalse   false

" Classes
syntax keyword dartClassKeyword           contained class

" Syntax
highlight default link dartBooleanTrue Boolean
highlight default link dartBooleanFalse Boolean
highlight default link dartOperatorKeyword dartOperator
highlight default link dartOperator Operator
highlight default link dartClassKeyword Keyword
