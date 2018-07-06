" plugin/textobj.vim
"
" vim-textobj-user text objects
" These are lazy loaded so we need the bindings to trigger the <Plug>
"
"
if !nanplug#IsLoaded('vim-textobj-user') | finish | endif

let s:cpo_save = &cpoptions
set cpoptions&vim

" " ============================================================================
"
" function! s:MapTextobj(obj) abort
"   let l:char = a:obj[0]
"   execute 'omap a' . l:char . ' <Plug>(textobj-' . a:obj . '-a)'
"   execute 'xmap a' . l:char . ' <Plug>(textobj-' . a:obj . '-a)'
"   execute 'omap i' . l:char . ' <Plug>(textobj-' . a:obj . '-i)'
"   execute 'xmap i' . l:char . ' <Plug>(textobj-' . a:obj . '-i)'
" endfunction
"
" for s:obj in [
"       \   'function',
"       \   'line'
"       \ ]
"   if nanplug#Exists('vim-textobj-' . s:obj)
"     call s:MapTextobj(s:obj)
"   endif
" endfor

if nanplug#Exists('vim-textobj-function')
  omap af <Plug>(textobj-function-a)
  omap if <Plug>(textobj-function-i)
  xmap af <Plug>(textobj-function-a)
  xmap if <Plug>(textobj-function-i)
endif

if nanplug#Exists('vim-textobj-line')
  omap al <Plug>(textobj-line-a)
  omap il <Plug>(textobj-line-i)
  xmap al <Plug>(textobj-line-a)
  xmap il <Plug>(textobj-line-i)
endif

let g:textobj_lastpaste_no_default_keymappings = 1
if nanplug#Exists('textobj-lastpaste')
  omap iP <Plug>(textobj-lastpaste-i)
  xmap iP <Plug>(textobj-lastpaste-i)
endif
"
" " Overrides for plugin/mappings.vim when textobj available
" if nanplug#Exists('vim-textobj-indent')
"   " Auto select indent-level and sort
"   silent! nunmap <Leader>s
"   nmap <special> <Leader>s   vii:!sort<CR>
" endif
"
" " ============================================================================

let &cpoptions = s:cpo_save
unlet s:cpo_save
