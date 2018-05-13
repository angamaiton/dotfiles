function! nanplug#plugins#LoadAll() abort
  Plug 'rakr/vim-two-firewatch'
endfunction

function! PlugIf(condition, ...) abort
  let l:enabled = a:condition ? {} : { 'on': [], 'for': [] }
  return a:0 ? extend(l:enabled, a:000[0]) : l:enabled
endfunction