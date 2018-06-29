" autoload/nanplug/plugins.vim

function! nanplug#plugins#LoadAll() abort

  Plug 'tweekmonster/startuptime.vim', { 'on': [ 'StartupTime' ] }

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

  Plug 'tpope/vim-fugitive'

  " Statusline
  Plug 'itchyny/lightline.vim'

  " Formatting
  Plug 'sbdchd/neoformat'

  " Git
  Plug 'tpope/vim-fugitive'

  " :Bdelete to preserve windows
  Plug 'moll/vim-bbye'

  " in command mode, alt-f/b to go forward/back words
  Plug 'vim-utils/vim-husk'

  " ==========================================================================
  " Embedded filetype support
  " ==========================================================================

  " tyru/caw.vim, some others use this to determine inline embedded filetypes
  Plug 'Shougo/context_filetype.vim'

  " ==========================================================================
  " Input, syntax, spacing
  " ==========================================================================

  " highlight matching html tag
  Plug 'gregsexton/MatchTag'

  " add gS on char to smart split lines at char, like comma lists and html tags
  Plug 'AndrewRadev/splitjoin.vim'

  " Compatible with Neovim or Vim with this patch level
  " Plug 'neomake/neomake', PlugIf(has('patch-7.4.503'))

  Plug 'w0rp/ale'

  " automatically clear search highlight; TODO: implement without plugin
  Plug 'pgdouyon/vim-evanesco'

  Plug 'junegunn/vim-easy-align'

  Plug 'mattn/emmet-vim'

  " Insert a paired parenthesis, bracket, etc.
  Plug 'jiangmiao/auto-pairs'
  " More conservative version – only works when pressing Enter
  " Plug 'rstacruz/vim-closer'

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

  Plug 'kana/vim-operator-user'
  " gcc to toggle comment
  Plug 'tyru/caw.vim', { 'on': [ '<Plug>(caw' ] }
  " <Leader>s(a/r/d) to modify surrounding the pending operator
  Plug 'rhysd/vim-operator-surround', { 'on': [ '<Plug>(operator-surround' ] }
  " <Leader>c to toggle CamelCase/snak_e the pending operator
  Plug 'tyru/operator-camelize.vim', { 'on': [ '<Plug>(operator-camelize' ] }

  " ==========================================================================
  " Completion
  " ==========================================================================

  " The language client completion is a bit slow to kick in, but it works
  " Plug 'autozimu/LanguageClient-neovim', WithCompl({
  "       \   'branch': 'next',
  "       \   'do': 'bash ./install.sh',
  "       \ })

  " Main completion engine, bound to <C-o>
  " Does not start until InsertEnter, so we can set up sources, then load
  " them, then load NCM
  " Plug 'roxma/nvim-completion-manager', WithCompl({ 'on': [] })
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

  " Plug 'Shougo/neco-syntax', WithCompl()

  " --------------------------------------------------------------------------
  " Completion: Snippet engine
  " --------------------------------------------------------------------------

  Plug 'Shougo/neosnippet', WithCompl()
  Plug 'Shougo/neosnippet-snippets', WithCompl()
  Plug 'honza/vim-snippets', WithCompl()

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

  " Plug 'calebeby/ncm-css', WithCompl()

  " --------------------------------------------------------------------------
  " Completion: Swift
  " --------------------------------------------------------------------------

  " Causes errors; potentially debug
  " Plug 'landaire/deoplete-swift', WithCompl()

  Plug 'mitsuse/autocomplete-swift'

  " ==========================================================================
  " Language: bash/zsh
  " ==========================================================================

  Plug 'chrisbra/vim-sh-indent'
  Plug 'chrisbra/vim-zsh'

  " ==========================================================================
  " Language: Crystal
  " ==========================================================================

  Plug 'rhysd/vim-crystal'

  " ==========================================================================
  " Language: Dart
  " ==========================================================================

  Plug 'dart-lang/dart-vim-plugin'

  " --------------------------------------------------------------------------
  " Language: JavaScript
  " --------------------------------------------------------------------------

  Plug 'neoclide/vim-jsx-improve'

  " ==========================================================================
  " Language: Markdown
  " ==========================================================================

  " Plug 'tpope/vim-markdown'
  Plug 'gabrielelana/vim-markdown'

  " ==========================================================================
  " Language: Swift
  " ==========================================================================

  Plug 'keith/swift.vim'

  " ==========================================================================
  " Language: VimL
  " ==========================================================================

  " Can't use <Enter> anymore if this is installed; why?
  " Plug 'lambdalisue/vim-backslash'


  " Comments
  " Plug 'tomtom/tcomment_vim'

endfunction

function! PlugIf(condition, ...) abort
  let l:enabled = a:condition ? {} : { 'on': [], 'for': [] }
  return a:0 ? extend(l:enabled, a:000[0]) : l:enabled
endfunction

" Shortcut
function! WithCompl(...) abort
  return call('PlugIf', [ g:nan_use_completion ] + a:000)
endfunction


