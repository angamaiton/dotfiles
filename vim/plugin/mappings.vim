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


nnoremap \ :Ag<CR>
nnoremap <C-P> :Files<CR>

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
noremap <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>