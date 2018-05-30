" autoload/nanplug/plugins.vim

function! nanplug#plugins#LoadAll() abort
  " ==========================================================================
  " Colorscheme
  " ==========================================================================

  Plug 'rakr/vim-two-firewatch'

  " ==========================================================================
  " Commands
  " ==========================================================================

  let l:fzfable = !empty(g:fzf_dir)
      \ && v:version >= 704
      \ && (has('nvim') || $TERM_PROGRAM ==# 'iTerm.app')
  if !empty(g:fzf_dir)
    Plug g:fzf_dir, PlugIf(l:fzfable)
    Plug 'junegunn/fzf.vim', PlugIf(l:fzfable)
  endif

  " gK to lookup
  Plug 'keith/investigate.vim'

  " netrw
  Plug 'tpope/vim-vinegar'

  " ==========================================================================
  " Input, syntax, spacing
  " ==========================================================================

  " highlight matching html tag
  Plug 'gregsexton/MatchTag'

  " add gS on char to smart split lines at char, like comma lists and html tags
  Plug 'AndrewRadev/splitjoin.vim'

  " Compatible with Neovim or Vim with this patch level
  Plug 'neomake/neomake', PlugIf(has('patch-7.4.503'))

  " ==========================================================================
  " Editing keys
  " ==========================================================================

  Plug 'tpope/vim-unimpaired'

  " . command after plugins
  Plug 'tpope/vim-repeat'

  " A-k/A-j to move current line up/down
  Plug 'matze/vim-move'

  " HR with <Leader>f[CHAR]
  " (that FUCKING comment box)
  Plug g:nan#vim_dir . '/mine/vim-hr'

  " ==========================================================================
  " Completion
  " ==========================================================================

  " The language client completion is a bit slow to kick in, but it works
  Plug 'autozimu/LanguageClient-neovim', WithCompl({
        \   'branch': 'next',
        \   'do': 'bash ./install.sh',
        \ })

  " Main completion engine, bound to <C-o>
  " Does not start until InsertEnter, so we can set up sources, then load
  " them, then load NCM
  Plug 'roxma/nvim-completion-manager', WithCompl({ 'on': [] })

  " --------------------------------------------------------------------------
  " NCM functionality: Includes
  " --------------------------------------------------------------------------

  " Include completion, include tags
  " For what langs are supported, see:
  " https://github.com/Shougo/neoinclude.vim/blob/master/autoload/neoinclude.vim
  " Note: NCM Errors when can't find b:node_root (from moll/vim-node)
  Plug 'Shougo/neoinclude.vim', WithCompl()

  " --------------------------------------------------------------------------
  " Completion: CSS
  " --------------------------------------------------------------------------

  Plug 'calebeby/ncm-css', WithCompl()

endfunction

function! PlugIf(condition, ...) abort
  let l:enabled = a:condition ? {} : { 'on': [], 'for': [] }
  return a:0 ? extend(l:enabled, a:000[0]) : l:enabled
endfunction

" Shortcut
function! WithCompl(...) abort
  return call('PlugIf', [ g:nan_use_completion ] + a:000)
endfunction


