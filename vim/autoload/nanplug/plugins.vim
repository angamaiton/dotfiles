function! nanplug#plugins#LoadAll() abort
  " Notes on adding plugins:
  " - Absolutely do not use 'for' if the plugin provides an `ftdetect/`

  " ==========================================================================
  " Vim debugging
  " ==========================================================================

  " Show slow plugins
  Plug 'tweekmonster/startuptime.vim', { 'on': [ 'StartupTime' ] }

  " `:Bufferize messages` to get messages (or any :command) in a new buffer
  let g:bufferize_command = 'tabnew'
  Plug 'AndrewRadev/bufferize.vim', { 'on': [ 'Bufferize' ] }

  Plug 'cocopon/colorswatch.vim'
  Plug 'cocopon/pgmnt.vim'

  " Mostly for zS to debug highlight group (:Bufferize scriptnames is nicer
  " than :Scriptnames)
  Plug 'tpope/vim-scriptease'

  " ==========================================================================
  " Embedded filetype support
  " ==========================================================================

  " tyru/caw.vim, some others use this to determine inline embedded filetypes
  Plug 'Shougo/context_filetype.vim'

  Plug 'kana/vim-operator-user'

  Plug 'tomtom/tcomment_vim'
  " gcc to toggle comment
  " Plug 'tyru/caw.vim'
    " <Leader>s(a/r/d) to modify surrounding the pending operator
  Plug 'rhysd/vim-operator-surround', { 'on': [ '<Plug>(operator-surround' ] }
  " <Leader>c to toggle CamelCase/snak_e the pending operator
  Plug 'tyru/operator-camelize.vim', { 'on': [ '<Plug>(operator-camelize' ] }

  " ==========================================================================
  " File system, ctags
  " ==========================================================================

  Plug 'ludovicchabant/vim-gutentags', PlugIf(executable('ctags'))

  " ==========================================================================
  " Commands
  " ==========================================================================

  " gK to lookup
  Plug 'keith/investigate.vim'

  "Plug 'lambdalisue/gina.vim', PlugIf(exists('v:null'))

  " :Bdelete to preserve windows
  Plug 'moll/vim-bbye'

  Plug 'nathanaelkane/vim-indent-guides'

  Plug 'osyo-manga/vim-over', { 'on': [ 'OverCommandLine' ] }

  Plug 'sbdchd/neoformat'

  " Add file manip commands like Remove, Move, Rename, SudoWrite
  " Do not lazy load, tracks buffers
  Plug 'tpope/vim-eunuch'

  " <C-w>o to zoom in/out of a window
  "Plug 'dhruvasagar/vim-zoom'
  " Better zoom plugin, accounts for command window and doesn't use sessions
  Plug 'troydm/zoomwintab.vim'

  " in command mode, alt-f/b to go forward/back words
  Plug 'vim-utils/vim-husk'

  " clear search highlighting
  Plug 'pgdouyon/vim-evanesco'

  " ==========================================================================
  " Multiple languages
  " ==========================================================================

  Plug 'itchyny/vim-parenmatch'

  " special end syntax for various langs
  Plug 'tpope/vim-endwise'

  " ==========================================================================
  " Language: bash/shell/zsh
  " ==========================================================================

  " Upstreams
  Plug 'chrisbra/vim-sh-indent'
  Plug 'chrisbra/vim-zsh'

  " ==========================================================================
  " Language: Git
  " ==========================================================================

  " creates gitconfig, gitcommit, rebase
  " provides :DiffGitCached in gitcommit file type
  " vim 7.4-77 ships with 2013 version, this is newer
  Plug 'tpope/vim-git'

  " show diff when editing a COMMIT_EDITMSG
  Plug 'rhysd/committia.vim'

  Plug 'tpope/vim-fugitive'

  " ==========================================================================
  " Language: HTML, XML, and generators: mustache, handlebars
  " ==========================================================================

  " Syntax enhancements and htmlcomplete#CompleteTags function override
  "Plug 'othree/html5.vim'

  "Plug 'tpope/vim-haml'

  " Creates html.handlebars and other fts and sets syn
  Plug 'mustache/vim-mustache-handlebars'

  " ==========================================================================
  " Language: JavaScript and derivatives, JSON
  " ==========================================================================

  Plug 'elzr/vim-json'

  " TypeScript
  Plug 'leafgarland/typescript-vim'
  " Alternatively
  "Plug 'HerringtonDarkholme/yats.vim'

  " ==========================================================================
  " Language: Markdown, Pandoc
  " ==========================================================================

  " Override vim included markdown ft* and syntax
  "   " The git repo has a newer syntax file than the one that ships with vim
  Plug 'tpope/vim-markdown'

    " ==========================================================================
  " Language: Stylesheets
  " ==========================================================================

  " ----------------------------------------
  " Syntax
  " ----------------------------------------

  " Upstream Neovim uses https://github.com/genoma/vim-less
  "   - more groups
  "   - no conflict with vim-css-color

  "Plug 'groenewege/vim-less'
  " - the syntax file here is actually older than genoma
  " - creates less filetype
  " - Conflicts with vim-css-color

  " 1)  runtime css.vim provides @media syntax highlighting where hail2u
  "     doesn't JulesWang/css.vim was upstream for $VIMRUNTIME up until Vim 8
  "     - Only needed for old vim!!
  " 2)  hail2u extends vim's css highlighting
  "     - Super up-to-date with spec, after syntax that extends runtime
  " 3)  scss-syntax needs the 'for' since it has an ftdetect that doesn't check
  "     if the ft was already set. The result is that without 'for', the
  "     filetype will be set twice successively (and any autocommands will run
  "     twice), particularly in neovim which comes with tpope's (older) scss
  "     rumtimes.
  "     - Extra indent support
  "     - NeoVim comes with tpope's 2010 syntax that pulls in sass.vim and
  "       adds comment matching. sass.vim is okay, but doesn't have as many hi
  "       groups.
  " Plug 'JulesWang/css.vim', PlugIf(v:version <= 704)
  Plug 'hail2u/vim-css3-syntax'
  Plug 'cakebaker/scss-syntax.vim', { 'for': [ 'scss' ] }

  " Hex (et al) color highlighting
  "Plug 'Rykka/colorv.vim'    --  requires python
  "Plug 'chrisbra/Colorizer'  --  slower and not as complete but more features
  "                               like X11 colors and color translation for
  "                               degraded terminals
  Plug 'ap/vim-css-color'

  " ==========================================================================
  " Language: .tmux.conf
  " ==========================================================================

  Plug 'tmux-plugins/vim-tmux'

  " ==========================================================================
  " Language: VimL
  " ==========================================================================

  Plug 'machakann/vim-vimhelplint'

  " gf to go to where autoloaded function is defined
  Plug 'kana/vim-gf-user', { 'for': [ 'vim' ] }
  Plug 'sgur/vim-gf-autoload', { 'for': [ 'vim' ] }

  " Auto-prefix continuation lines with \
  Plug 'lambdalisue/vim-backslash'

  " ==========================================================================
  " TO SORT
  " ==========================================================================

  " Configurable statusline for Vim
  Plug 'itchyny/lightline.vim'
  Plug 'mgee/lightline-bufferline'

  " Command-line fuzzy finder and corresponding vim plugin
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all --no-update-rc --64' }
  Plug 'junegunn/fzf.vim'

  " Combine with netrw to create a delicious salad dressing
  Plug 'tpope/vim-vinegar'

  " For those of us too lazy to write our own autochdir plugins
  Plug 'airblade/vim-rooter'
  Plug 'mhinz/vim-signify'

  " --------------------------------------------------------------------------
  " Quickfix window
  " --------------------------------------------------------------------------

  Plug 'blueyed/vim-qf_resize'
  Plug 'romainl/vim-qf'

  if g:has_async
    Plug 'w0rp/ale'
  endif

  " ============================================================================
  " Themes
  " ============================================================================

  Plug 'rakr/vim-two-firewatch'

endfunction

function! PlugIf(condition, ...) abort
  let l:enabled = a:condition ? {} : { 'on': [], 'for': [] }
  return a:0 ? extend(l:enabled, a:000[0]) : l:enabled
endfunction

" Shortcut
function! WithCompl(...) abort
  return call('PlugIf', [ g:nan_use_completion ] + a:000)
endfunction


