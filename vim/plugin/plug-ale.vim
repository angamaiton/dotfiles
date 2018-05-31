  " ALE linting events

augroup nanale
  autocmd!

  if g:has_async
    let g:ale_lint_on_text_changed = 0
    autocmd CursorHold * call ale#Lint()
    autocmd CursorHoldI * call ale#Lint()
    autocmd InsertEnter * call ale#Lint()
    autocmd InsertLeave * call ale#Lint()
  else
    echoerr "Please install Neovim/Vim 8"
  endif
augroup END
