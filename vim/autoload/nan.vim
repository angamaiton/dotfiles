" ============================================================================
" Buffer info
" ============================================================================

" @param {Int|String} bufnr or {expr} as in bufname()
" @return {Boolean}
function! nan#IsNonFile(bufnr) abort
  return getbufvar(a:bufnr, '&buftype') =~# '\v(nofile|quickfix|terminal)'
        \ || getbufvar(a:bufnr, '&filetype') =~# '\v(netrw)'
endfunction

" @param {Int} bufnr
" @return {Boolean}
function! nan#IsHelp(bufnr) abort
  return getbufvar(a:bufnr, '&buftype') ==# 'help'
endfunction

function! nan#IsEditable() abort
  return !(
        \ &readonly
        \ || &buftype =~# '\v(nofile|quickfix)'
        \ || &filetype =~# '\v(netrw)'
        \ )
endfunction

" ============================================================================
" Whitespace settings
" ============================================================================

function! nan#TwoSpace() abort
  setlocal expandtab shiftwidth=2 softtabstop=2
endfunction

function! nan#TwoTabs() abort
  setlocal noexpandtab shiftwidth=2 softtabstop=2
endfunction

function! nan#FourTabs() abort
  setlocal noexpandtab shiftwidth=2 softtabstop=0
endfunction

" ============================================================================
" Autocompletion
" ============================================================================

function! nan#InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
      return "\<Tab>"
  else
      return "\<C-p>"
  endif
endfunction
