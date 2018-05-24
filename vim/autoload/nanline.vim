scriptencoding utf-8

" ============================================================================
" Main
" ============================================================================

function! nanline#GetStatusLine(winnr) abort
  if empty(a:winnr) | return | endif

  let l:winnr = a:winnr > winnr('$') ? 1 : a:winnr
  let l:bufnr = winbufnr(l:winnr)
  let l:ww    = winwidth(l:winnr)
  let l:cwd   = getcwd(l:winnr)
  " let l:cwd   = has('nvim') ? getcwd(l:winnr) : getcwd()

  let l:x = {
        \   'bufnr': l:bufnr,
        \   'ww': l:ww,
        \ }

  let l:contents = ''

  " left side
  " MODE
  let l:contents .= '%#StatusLineNC# %3(' . nanline#Mode(l:winnr) . '%)'

  " right side
  " Leave 24 chars for search
  return l:contents
endfunction

" ============================================================================
" Output functions
" ============================================================================

" @param {String} content
" @param {String} [before]
" @param {String} [after]
" @return {String}
function! nanline#Format(...) abort
  let l:content = get(a:, 1, '')
  let l:before = get(a:, 2, '')
  let l:after = get(a:, 3, '')
  return empty(l:content) ? '' : l:before . l:content . l:after
endfunction

function! nanline#If(conditions, values) abort
  if has_key(a:conditions, 'winnr')
    if winnr() != a:conditions.winnr | return 0 | endif
  endif

  if has_key(a:conditions, 'ww')
    if a:values.ww < a:conditions.ww | return 0 | endif
  endif

  if has_key(a:conditions, 'normal')
    if !getbufvar(a:values.bufnr, '&buflisted') | return 0 | endif
  endif

  return 1
endfunction

" @return {String}
function! nanline#Mode(winnr) abort
  let l:modecolor = '%#StatusLineNC#'
  let l:modeflag = mode()

  return  l:modecolor . ' ' . l:modeflag . ' '
endfunction

" @return {String}
function! nanline#Ruler() abort
  return ' %5.(%c%) '
endfunction

" ============================================================================
" Utility
" ============================================================================

function! nanline#Init() abort
  set statusline=%!nanline#GetStatusLine(1)
  set showtabline=2
endfunction

" bound to <F12> - see ../plugin/mappings.vim
function! nanline#ToggleTabline() abort
  let &showtabline = &showtabline ? 0 : 2
endfunction
