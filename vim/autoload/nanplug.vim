" autoload/nanplug.vim

" ============================================================================
" vim-plug helpers
" ============================================================================

" Memory cache
" List of loaded plug names
let s:loaded = []

" @param  {String} name
" @return {Boolean} true if the plugin is installed
function! nanplug#Exists(name) abort
  return index(get(g:, 'plugs_order', []), a:name) > -1
endfunction

" @param  {String} name
" @return {String} path where plugin installed
function! nanplug#Dir(name) abort
  return nanplug#Exists(a:name) ? g:plugs[a:name].dir : ''
endfunction

" @param  {String} name
" @return {Boolean} true if the plugin is actually loaded
function! nanplug#IsLoaded(name) abort
  if index(s:loaded, a:name) > -1
    return 1
  endif

  let l:plug_dir = nanplug#Dir(a:name)
  if empty(l:plug_dir)  || !isdirectory(l:plug_dir)
    return 0
  endif

  let l:is_loaded = empty(l:plug_dir)
        \ ? 0
        \ : stridx(&runtimepath, l:plug_dir) > -1

  if l:is_loaded
    call add(s:loaded, a:name)
  endif

  return l:is_loaded
endfunction
