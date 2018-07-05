" plugin/plug-nvim-completion-manager.vim

augroup nanncm
  autocmd!
  " autocmd nanncm User CmBefore  echomsg 'nvim-completion-manager loading'
  " autocmd nanncm User CmSetup   echomsg 'nvim-completion-manager loaded'
augroup END

if !g:nan_use_completion || !nanplug#Exists('nvim-completion-manager')
  finish
endif

" wait 1ms before running the completion function, make sure typing is never
" clobbered
let g:cm_complete_start_delay = 1

let g:cm_refresh_length = [
      \   [1, 4],
      \   [7, 2],
      \   [9, 1],
      \ ]

" Delay loading NCM until InsertEnter
function s:StartNcm()
  " Hooks for setting up sources before loading NCM
  silent! doautocmd User CmBefore
  call plug#load('nvim-completion-manager')
  autocmd! nanncm InsertEnter
endfunction
autocmd nanncm InsertEnter * call s:StartNcm()

let s:cpo_save = &cpoptions
set cpoptions&vim

" Refresh list
imap <special><expr> <C-g> pumvisible()
      \ ? "\<Plug>(cm_force_refresh)"
      \ : "\<C-g>"

let &cpoptions = s:cpo_save
unlet s:cpo_save
