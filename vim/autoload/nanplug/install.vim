function! nanplug#install#Install() abort
  execute 'silent !curl -fLo '
        \ . g:nan#vim_dir . '/autoload/plug.vim '
        \ . 'https://raw.githubusercontent.com/'
        \ . 'junegunn/vim-plug/master/plug.vim'
endfunction