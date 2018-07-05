if !nanplug#IsLoaded('fzf.vim') | finish | endif

augroup nanfzf
  autocmd!
augroup END

let s:cpo_save = &cpoptions
set cpoptions&vim

" ============================================================================
" fzf.vim settings
" ============================================================================

" iTerm can pipe from a spawned FZF back to Vim
if !has('nvim') && $TERM_PROGRAM ==# 'iTerm.app'
  let g:fzf_launcher = g:nan#vim_dir . '/bin/vim-fzf'
endif

let g:fzf_command_prefix = 'FZF'

let g:fzf_layout = { 'down': 16 }

nnoremap <silent><special> \     :<C-U>FZFAg<CR>
nnoremap <silent><special> <A-b> :<C-U>FZFBuffers<CR>
nnoremap <silent><special> <A-f> :<C-U>FZFFiles<CR>
nnoremap <silent><special> <A-h> :<C-U>FZFHistory<CR>

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

let &cpoptions = s:cpo_save
unlet s:cpo_save
