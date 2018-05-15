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
" fzf fix
" https://github.com/junegunn/fzf/issues/809#issuecomment-273226434
" ============================================================================

let $FZF_DEFAULT_OPTS .= ' --no-height'

" ============================================================================
" Neovim-only mappings
" ============================================================================

" Special key to get back to vim
tnoremap <special> <C-b>      <C-\><C-n>

" Move between windows using Alt-
" Ctrl- works only outside of terminal buffers
tnoremap <special> <A-Up>     <C-\><C-n><C-w>k
tnoremap <special> <A-Down>   <C-\><C-n><C-w>j
tnoremap <special> <A-Left>   <C-\><C-n><C-w>h
tnoremap <special> <A-Right>  <C-\><C-n><C-w>l
nnoremap <special> <A-Up>     <C-w>k
nnoremap <special> <A-Down>   <C-w>j
nnoremap <special> <A-Left>   <C-w>h
nnoremap <special> <A-Right>  <C-w>l
nnoremap <special> <A-k>      <C-w>k
nnoremap <special> <A-j>      <C-w>j
nnoremap <special> <A-h>      <C-w>h
nnoremap <special> <A-l>      <C-w>l

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
