function! nanplug#plugins#LoadAll() abort
  " ============================================================================
  " Bundles
  " ============================================================================

  " Configurable statusline for Vim
  Plug 'itchyny/lightline.vim'

  " Command-line fuzzy finder and corresponding vim plugin
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all --no-update-rc --64' }
  Plug 'junegunn/fzf.vim'

  " Combine with netrw to create a delicious salad dressing
  Plug 'tpope/vim-vinegar'

  " ============================================================================
  " Themes
  " ============================================================================

  Plug 'rakr/vim-two-firewatch'

endfunction

function! PlugIf(condition, ...) abort
  let l:enabled = a:condition ? {} : { 'on': [], 'for': [] }
  return a:0 ? extend(l:enabled, a:000[0]) : l:enabled
endfunction