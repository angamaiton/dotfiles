" plugin/mappings.vim
scriptencoding utf-8

" cpoptions are reset but use <special> when mapping anyway
let s:cpo_save = &cpoptions
set cpoptions&vim

" ============================================================================
" Disable for reuse
" ============================================================================

" [n]gs normally waits for [n] seconds, totally useless
noremap   gs    <NOP>

" ============================================================================
" Commands
" ============================================================================

" In normal mode, jump to command mode with <CR>
" Don't map <CR>, it's a pain to unmap for various window types like quickfix
" where <CR> should jump to the entry, or NetRW or unite or fzf.
"nnoremap  <special>  <CR>  <Esc>:<C-U>

command! Q q

" nnoremap  <silent><special>  <Leader>eca
"       \ :<C-U>call nan#edit#EditClosest('.ignore')<CR>
" nnoremap  <silent><special>  <Leader>eci
"       \ :<C-U>call nan#edit#EditClosest('.gitignore')<CR>
" nnoremap  <silent><special>  <Leader>ecr
"       \ :<C-U>call nan#edit#EditClosest('README.md')<CR>

" nnoremap  <silent><special>  <Leader>era
"       \ :<C-U>call nan#edit#EditRoot('.ignore')<CR>
" nnoremap  <silent><special>  <Leader>eri
"       \ :<C-U>call nan#edit#EditRoot('.gitignore')<CR>
" nnoremap  <silent><special>  <Leader>erw
"       \ :<C-U>call nan#edit#EditRoot('webpack.config.js')<CR>
" nnoremap  <silent><special>  <Leader>erp
"       \ :<C-U>call nan#edit#EditRoot('package.json')<CR>
" nnoremap  <silent><special>  <Leader>err
"       \ :<C-U>call nan#edit#EditRoot('README.md')<CR>

" Not using $MYVIMRC since it varies based on (n)vim
nnoremap  <silent><special>  <Leader>evi
      \ :<C-U>edit $VDOTDIR/init.vim<CR>
nnoremap  <silent><special>  <Leader>evg
      \ :<C-U>edit $VDOTDIR/gvimrc<CR>
nnoremap  <silent><special>  <Leader>evr
      \ :<C-U>edit $VDOTDIR/vimrc<CR>
nnoremap  <silent><special>  <Leader>evp
      \ :<C-U>edit $VDOTDIR/autoload/nanplug/plugins.vim<CR>

nnoremap  <silent><special>  <Leader>em
      \ :<C-U>edit $VDOTDIR/plugin/mappings.vim<CR>
nnoremap  <silent><special>  <Leader>ez
      \ :<C-U>edit $ZDOTDIR/.zshrc<CR>

" ============================================================================
" Buffer manip
" ============================================================================

nnoremap <special>  <Leader>v :<C-U>vnew<CR>

" ----------------------------------------------------------------------------
" Prev buffer with <BS> backspace in normal (C-^ is kinda awkward)
" ----------------------------------------------------------------------------

nnoremap  <special>   <BS>  <C-^>

" ============================================================================
" Window manipulation
" See init.vim for neovim specific mappings (e.g. using <A-*>)
" ============================================================================

" ----------------------------------------------------------------------------
" Navigate with <C-arrow> (insert mode leaves user in normal)
" ----------------------------------------------------------------------------

nnoremap  <special>   <C-Up>      <C-w>k
nnoremap  <special>   <C-Down>    <C-w>j
nnoremap  <special>   <C-Left>    <C-w>h
nnoremap  <special>   <C-Right>   <C-w>l

" ----------------------------------------------------------------------------
" Resize (can take a count, eg. 2<S-Left>)
" ----------------------------------------------------------------------------

nnoremap  <special>   <S-Up>      <C-W>+
nnoremap  <special>   <S-Down>    <C-W>-
nnoremap  <special>   <S-Left>    <C-w><
nnoremap  <special>   <S-Right>   <C-w>>

silent! iunmap <S-Up>
silent! iunmap <S-Down>
silent! iunmap <S-Left>
silent! iunmap <S-Right>
imap      <special>   <S-Up>      <C-o><S-Up>
imap      <special>   <S-Down>    <C-o><S-Down>
imap      <special>   <S-Left>    <C-o><S-Left>
imap      <special>   <S-Right>   <C-o><S-Right>

" ============================================================================
" Mode and env
" ============================================================================

" ----------------------------------------------------------------------------
" Toggle visual/normal mode with space-space
" ----------------------------------------------------------------------------

nnoremap  <special> <Leader><Leader>  V
xnoremap  <special> <Leader><Leader>  <Esc>

" ----------------------------------------------------------------------------
" Back to normal mode
" ----------------------------------------------------------------------------

silent! iunmap jj
silent! cunmap jj
imap jj <Esc>
cmap jj <Esc>

" ----------------------------------------------------------------------------
" Unfuck my screen
" https://bitbucket.org/sjl/dotfiles/src/2c4aba25376c6c5cb5d4610cf80109d99b610505/vim/vimrc?at=default#cl-444
" ----------------------------------------------------------------------------

nnoremap <silent> U :<C-U>:diffupdate<CR>:syntax sync fromstart<CR><C-L>

" ----------------------------------------------------------------------------
" cd to current buffer's git root
" ----------------------------------------------------------------------------

" nnoremap <silent><special>   <Leader>cr
"      \ :<C-U>execute 'cd! ' . nan#project#GetRoot()<CR>

" ----------------------------------------------------------------------------
" cd to current buffer path
" ----------------------------------------------------------------------------

nnoremap <silent><special>   <Leader>cd
      \ :<C-U>cd! %:h<CR>

" ----------------------------------------------------------------------------
" go up a level
" ----------------------------------------------------------------------------

nnoremap <silent><special>   <Leader>..
      \ :<C-U>cd! ..<CR>

" ============================================================================
" Editing
" ============================================================================

" ----------------------------------------------------------------------------
" Quickly apply macro q
" ----------------------------------------------------------------------------

nnoremap  <special> <Leader>q   @q

" ----------------------------------------------------------------------------
" Map the arrow keys to be based on display lines, not physical lines
" ----------------------------------------------------------------------------

vnoremap  <special>   <Down>      gj
vnoremap  <special>   <Up>        gk

" ----------------------------------------------------------------------------
" Start/EOL
" ----------------------------------------------------------------------------

" Easier to type, and I never use the default behavior.
" From https://bitbucket.org/sjl/dotfiles/
" default is {count}from top line in visible window
noremap   H   ^
" default is {count}from last line in visible window
noremap   L   g_

" ----------------------------------------------------------------------------
" Reselect visual block after indent
" ----------------------------------------------------------------------------

xnoremap  <   <gv
xnoremap  >   >gv

" ----------------------------------------------------------------------------
" <Tab> indents in visual mode (recursive map to the above)
" ----------------------------------------------------------------------------

silent! vunmap <Tab>
silent! vunmap <S-Tab>
vmap <special> <Tab>     >
vmap <special> <S-Tab>   <

" ----------------------------------------------------------------------------
" Sort lines (use unix sort)
" https://bitbucket.org/sjl/dotfiles/src/2c4aba25376c6c5cb5d4610cf80109d99b610505/vim/vimrc?at=default#cl-288
" ----------------------------------------------------------------------------

" Auto select paragraph (bounded by blank lines) and sort
nnoremap  <special> <Leader>s   vip:!sort<CR>

" Sort selection (no clear since in visual)
xnoremap  <special> <Leader>s   :!sort<CR>

" ----------------------------------------------------------------------------
" Uppercase / lowercase word
" ----------------------------------------------------------------------------

" mark Q, visual, inner-word case, back to mark (don't change cursor position)
nnoremap  <special> <Leader>l   viwu
nnoremap  <special> <Leader>u   viwU

" ----------------------------------------------------------------------------
" Join lines without space (and go to first char line that was merged up)
" ----------------------------------------------------------------------------

nnoremap  <special> <Leader>j   VjgJl

" ----------------------------------------------------------------------------
" Intentional system clipboard
" ----------------------------------------------------------------------------

nnoremap <special> <C-p> "*p
vnoremap <special> <C-p> "*p

nnoremap <special> <C-y> "*y
xnoremap <special> <C-y> "*y

" ----------------------------------------------------------------------------
" Silent delete to black hole
" ----------------------------------------------------------------------------

nnoremap sx "_x
nnoremap sd "_d
nnoremap sD "_D

" ============================================================================

nnoremap \ :Ag<CR>
nnoremap <C-P> :Files<CR>

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
" noremap <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>

" ----------------------------------------------------------------------------
" Miscellaneous Thoughtbot bindings
" ----------------------------------------------------------------------------

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Comment/un-comment like Sublime
nnoremap <C-\> :TComment<CR>
vnoremap <C-\> :TComment<CR>

" No longer require tabbing with C-n/C-p
inoremap <Tab> <C-r>=nan#InsertTabWrapper()<CR>
inoremap <S-Tab> <C-n>

" ----------------------------------------------------------------------------
" Miscellaneous personal settings (to sort, EXPERIMENTAL)
" ----------------------------------------------------------------------------

nnoremap <C-s> :w<CR>
nnoremap <C-q> :q<CR>
nnoremap <C-S-q> :qa<CR>

inoremap <C-s> <ESC>:w<CR>
inoremap <C-q> <ESC>:q<CR>
inoremap <C-S-q> <ESC>:qa<CR>

nnoremap <F12> :call nanline#ToggleTabline()<CR>

let &cpoptions = s:cpo_save
unlet s:cpo_save
