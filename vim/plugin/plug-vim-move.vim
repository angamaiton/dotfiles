if !nanplug#Exists('vim-move') | finish | endif

augroup nanvimmove
  autocmd!
augroup END

" Use <C-j/k> to bubble
let g:move_key_modifier = 'C'

" Don't reindent after each move
let g:move_auto_indent = 0

function! s:Unmap() abort
  if nan#IsEditable() | return | endif


  let s:cpo_save = &cpoptions
  set cpoptions&vim

  " Have to <NOP> these since the vim-move mappings are not <buffer> local
  silent! nnoremap <buffer> <C-j> <NOP>
  silent! nnoremap <buffer> <C-k> <NOP>
  silent! vnoremap <buffer> <C-j> <NOP>
  silent! vnoremap <buffer> <C-k> <NOP>

  let &cpoptions = s:cpo_save
  unlet s:cpo_save
endfunction

autocmd nanvimmove BufWinEnter * call s:Unmap()
