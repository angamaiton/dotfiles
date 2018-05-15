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