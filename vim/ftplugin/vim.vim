call nan#TwoSpace()
setlocal keywordprg=:help
setlocal omnifunc=syntaxcomplete#Complete

if expand('%') =~# 'nanplug/plugins.vim'
  let s:cpo_save = &cpoptions
  set cpoptions&vim

  nnoremap <buffer><silent> gx :<C-U>call nanplug#browse#gx()<CR>

  let &cpoptions = s:cpo_save
  unlet s:cpo_save
endif
