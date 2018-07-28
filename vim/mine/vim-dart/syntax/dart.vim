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
syntax keyword dartStorageClass    abstract const factory final static
syntax keyword dartOperatorKeyword as in is new of
syntax keyword dartBooleanTrue     true
syntax keyword dartBooleanFalse    false
syntax keyword dartReturn          return
syntax keyword dartType            bool covariant double dynamic int var void
syntax keyword dartThis            this
syntax keyword dartNull            null undefined
syntax match   dartDecorators      /@\([_$a-zA-Z][_$a-zA-Z0-9]*\.\)*[_$a-zA-Z][_$a-zA-Z0-9]*\>/

" Classes
syntax keyword dartClassKeyword   contained class
syntax keyword dartExtendsKeyword contained extends implements skipwhite skipempty nextgroup=@dartExpression
syntax match   dartClassNoise     contained /\./
" todo fix this next one
" syntax match   dartClassMethodType        contained /\<\%([gs]et\|static\)\ze\s\+\K\k*/ skipwhite skipempty nextgroup=dartAsyncKeyword,dartClassFuncName,dartClassProperty
" syntax match   dartClassFuncName          contained /\<\K\k*\ze\s*[(<]/ skipwhite skipempty nextgroup=dartFuncArgs
syntax match   dartClassFuncName          contained /\<\K\k*\ze\s*[(<]/ skipwhite skipempty nextgroup=dartFuncArgs
syntax match   dartClassMethodType        contained /\<\%([gs]et\|static\)\ze\s\+\K\k*/ skipwhite skipempty nextgroup=dartAsyncKeyword,dartClassFuncName,dartClassProperty
syntax match   dartClassProperty          contained /\<\K\k*\ze\s*=/ skipwhite skipempty nextgroup=dartClassValue
syntax region  dartClassValue             contained start=/=/ end=/\_[;}]\@=/ contains=@dartExpression

" syntax region  dartClassDefinition                  start=/\<class\>/ end=/\(\<extends\>\s\+\)\@<!{\@=/ contains=dartClassKeyword,dartExtendsKeyword,dartClassNoise,@dartExpression,dartFlowClassGroup skipwhite skipempty nextgroup=dartCommentClass,dartClassBlock,dartFlowClassGroup
syntax region dartClassDefinition start=/\<class\>/ end=/\(\<extends\>\s\+\)\@<!{\@=/ contains=dartClassKeyword,dartExtendsKeyword,dartClassNoise,@dartExpression skipwhite skipempty nextgroup=dartClassBlock


" Modules
syntax keyword dartImport                       import skipwhite skipempty nextgroup=dartModuleAsterisk,dartModuleKeyword,dartModuleGroup
syntax keyword dartExport                       export skipwhite skipempty nextgroup=@dartAll,dartModuleKeyword
syntax match   dartModuleKeyword      contained /\<\K\k*/ skipwhite skipempty nextgroup=dartModuleAs,dartModuleComma
" syntax keyword dartExportDefault      contained default skipwhite skipempty nextgroup=@dartExpression
" syntax keyword dartExportDefaultGroup contained default skipwhite skipempty nextgroup=dartModuleAs,dartFrom,dartModuleComma
" syntax match   dartModuleAsterisk     contained /\*/ skipwhite skipempty nextgroup=dartModuleKeyword,dartModuleAs,dartFrom
syntax keyword dartModuleAs           contained as skipwhite skipempty nextgroup=dartModuleKeyword
syntax match   dartModuleComma        contained /,/ skipwhite skipempty nextgroup=dartModuleKeyword


" Strings, Templates, Numbers
syntax region  dartString           start=+\z(["']\)+  skip=+\\\%(\z1\|$\)+  end=+\z1\|$+  contains=dartSpecial,@Spell extend
syntax match   dartNumber           /\c\<\%(\d\+\%(e[+-]\=\d\+\)\=\|0b[01]\+\|0o\o\+\|0x\x\+\)\>/
syntax match   dartSpecial            contained "\v\\%(x\x\x|u%(\x{4}|\{\x{4,5}})|c\u|.)"

" Statement keywords - finish "nextgroup"
syntax keyword dartConditional    if skipwhite skipempty nextgroup=dartParenIfElse
syntax keyword dartConditional    else skipwhite skipempty nextgroup=dartCommentIfElse,dartIfElseBlock
syntax keyword dartConditional    switch skipwhite skipempty nextgroup=dartParenSwitch
syntax keyword dartException      throw
syntax keyword dartAsyncKeyword   async await

" exe 'syntax keyword dartReturn    return contained '.(exists('g:javascript_conceal_return')    ? 'conceal cchar='.g:javascript_conceal_return     : '').' skipwhite nextgroup=@dartExpression'

" Code blocks
" syntax region  dartParenIfElse        contained matchgroup=dartParensIfElse        start=/(/  end=/)/  contains=@dartAll skipwhite skipempty nextgroup=dartCommentIfElse,dartIfElseBlock extend fold
" syntax region  dartIfElseBlock        contained matchgroup=dartIfElseBraces        start=/{/  end=/}/  contains=@dartAll,dartBlock extend fold
syntax region dartBracket matchgroup=dartBrackets start=/\[/ end=/\]/ contains=@dartExpression extend fold
syntax region dartParen matchgroup=dartParens start=/(/ end=/)/ contains=@dartExpression extend fold
" syntax region  jsClassBlock         contained matchgroup=jsClassBraces         start=/{/  end=/}/  contains=jsClassFuncName,jsClassMethodType,jsArrowFunction,jsArrowFuncArgs,jsComment,jsGenerator,jsDecorator,jsClassProperty,jsClassPropertyComputed,jsClassStringKey,jsAsyncKeyword,jsNoise extend fold
syntax region dartClassBlock         contained matchgroup=dartClassBraces         start=/{/  end=/}/  contains=dartClassFuncName, dartClassMethodType,dartDecorators,dartNoise,dartComment,dartClassProperty extend fold
syntax region dartModuleGroup        contained matchgroup=dartModuleBraces        start=/{/ end=/}/   contains=dartModuleKeyword,dartModuleComma,dartModuleAs,dartComment skipwhite skipempty nextgroup=dartString fold

" Core libraries
if !exists('dart_corelib_highlight') || dart_corelib_highlight
  syntax keyword dartCoreClasses BidirectionalIterator Comparable DateTime
      \ Duration Expando Function Invocation Iterable Iterator List Map Match
      \ Object Pattern RegExp RuneIterator Runes Set StackTrace Stopwatch String
      \ StringBuffer StringSink Symbol Type
  syntax keyword dartCoreTypedefs   Comparator
  syntax keyword dartCoreExceptions AbstractClassInstantiationError
      \ ArgumentError AssertionError CastError ConcurrentModificationError
      \ Error Exception FallThroughError FormatException
      \ IntegerDivisionByZeroException NoSuchMethodError NullThrownError
      \ OutOfMemoryError RangeError RuntimeError StackOverflowError StateError
      \ TypeError UnimplementedError UnsupportedError
endif

" syntax cluster dartExpression  contains=dartBracket,dartParen,dartObject,dartTernaryIf,dartTaggedTemplate,dartTemplateString,dartString,dartRegexpString,dartNumber,dartFloat,dartOperator,dartOperatorKeyword,dartBooleanTrue,dartBooleanFalse,dartNull,dartFunction,dartArrowFunction,dartGlobalObjects,dartExceptions,dartFutureKeys,dartDomErrNo,dartDomNodeConsts,dartHtmlEvents,dartFuncCall,dartUndefined,dartNan,dartPrototype,dartBuiltins,dartNoise,dartClassDefinition,dartArrowFunction,dartArrowFuncArgs,dartParensError,dartComment,dartArguments,dartThis,dartSuper,dartDo,dartForAwait,dartAsyncKeyword,dartStatement,dartDot
" syntax cluster jsExpression  contains=jsBracket,jsParen,jsObject,jsTernaryIf,jsTaggedTemplate,jsTemplateString,jsString,jsRegexpString,jsNumber,jsFloat,jsOperator,jsOperatorKeyword,jsBooleanTrue,jsBooleanFalse,jsNull,jsFunction,jsArrowFunction,jsGlobalObjects,jsExceptions,jsFutureKeys,jsDomErrNo,jsDomNodeConsts,jsHtmlEvents,jsFuncCall,jsUndefined,jsNan,jsPrototype,jsBuiltins,jsNoise,jsClassDefinition,jsArrowFunction,jsArrowFuncArgs,jsParensError,jsComment,jsArguments,jsThis,jsSuper,jsDo,jsForAwait,jsAsyncKeyword,jsStatement,jsDot
" syntax cluster jsAll         contains=@jsExpression,jsStorageClass,jsConditional,jsRepeat,jsReturn,jsException,jsTry,jsNoise,jsBlockLabel
syntax cluster dartExpression  contains=dartBracket,dartParen,dartNumber,dartString,dartBooleanTrue,dartBooleanFalse,dartNull,dartNoise,dartComment,dartThis,dartAsyncKeyword,dartType
syntax cluster dartAll         contains=@dartExpression,dartConditional,dartReturn,dartException,dartNoise

" Syntax
highlight default link dartComment         Comment
highlight default link dartBooleanTrue     Boolean
highlight default link dartBooleanFalse    Boolean
highlight default link dartClassKeyword    Keyword
highlight default link dartExtendsKeyword  Keyword
highlight default link dartImport          Include
highlight default link dartExport          Include
highlight default link dartNoise           Noise
highlight default link dartOperatorKeyword dartOperator
highlight default link dartOperator        Operator
highlight default link dartReturn          Statement
highlight default link dartType            Type
highlight default link dartNull            Type
highlight default link dartThis            Special
highlight default link dartStorageClass    StorageClass
highlight default link dartClassMethodType Type
highlight default link dartFuncName        Function
highlight default link dartClassDefinition dartFuncName
highlight default link dartString          String
highlight default link dartException       Exception

highlight default link dartBrackets        Noise
highlight default link dartParens          Noise
highlight default link dartModuleBraces    Noise
highlight default link dartNoise           Noise
highlight default link dartClassNoise      Noise

highlight default link dartModuleAs        Include
highlight default link dartModuleComma     dartNoise
" highlight default link dartFrom            Include

highlight default link dartConditional     Conditional

highlight default link dartDecorators      PreProc

highlight default link dartCoreClasses     Type
highlight default link dartCoreTypedefs    Typedef
highlight default link dartCoreExceptions  Exception

highlight default link dartClassProperty   String
highlight default link dartClassPropType   String
