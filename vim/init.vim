" Potentially conditional?
" set termguicolors

let g:nan_nvim_dir = fnamemodify(resolve(expand('$MYVIMRC')), ':p:h')

" ============================================================================
" Settings
" ============================================================================

if $COLORTERM ==# 'truecolor'
  set termguicolors
endif

set inccommand=

" Breaking the rule here, but this looks useful
let g:terminal_scrollback_buffer_size = 100000

" ============================================================================
" Python setup
" Skips if python is not installed in a pyenv virtualenv
" ============================================================================

function! s:FindExecutable(paths) abort
  for l:path in a:paths
    let l:executable = glob(expand(l:path))
    if executable(l:executable) | return l:executable | endif
  endfor
  return ''
endfunction

" ----------------------------------------------------------------------------
" Python 2
" ----------------------------------------------------------------------------

let s:pyenv_py2 = s:FindExecutable([
      \   '$HOME/.asdf/shims/python2',
      \   '/usr/bin/python2',
      \ ])

if !empty(s:pyenv_py2)
  let g:python_host_prog  = s:pyenv_py2
else
  let g:loaded_python_provider = 1
endif


" ----------------------------------------------------------------------------
" Python 3
" ----------------------------------------------------------------------------

let s:pyenv_py3 = s:FindExecutable([
      \   '$HOME/.asdf/shims/python3',
      \   '/usr/bin/python3',
      \ ])

if !empty(s:pyenv_py3)
  let g:python3_host_prog  = s:pyenv_py3
else
  let g:loaded_python3_provider = 1
endif

execute 'source ' . g:nan_nvim_dir . '/vimrc'