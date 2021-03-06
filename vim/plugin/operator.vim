if !nanplug#Exists('vim-operator-user') | finish | endif

let s:cpo_save = &cpoptions
set cpoptions&vim

silent! unmap gc
silent! unmap gcc
silent! unmap gsc
silent! unmap gsa
silent! unmap gsd
silent! unmap gsr
silent! unmap <Leader>c

if nanplug#Exists('caw.vim')
  " By default works like tcomment_vim (instantly)
  let g:caw_operator_keymappings = 1

  nmap gc   <Plug>(caw:prefix)
  xmap gc   <Plug>(caw:prefix)

  nmap gcc   <Plug>(caw:hatpos:toggle)
  xmap gcc   <Plug>(caw:hatpos:toggle)

  map <silent>  gsc    <Plug>(caw:hatpos:toggle:operator)

  nmap <C-\> <Plug>(caw:hatpos:toggle)
  xmap <C-\> <Plug>(caw:hatpos:toggle)
endif

if nanplug#Exists('vim-operator-surround')
  map <silent>  gsa <Plug>(operator-surround-append)
  map <silent>  gsd <Plug>(operator-surround-delete)
  map <silent>  gsr <Plug>(operator-surround-replace)
endif

if nanplug#Exists('operator-camelize.vim')
  nmap <special> <Leader>c <Plug>(operator-camelize-toggle)
endif

if nanplug#Exists('tcomment_vim')
  nnoremap <C-\> :TComment<CR>
  vnoremap <C-\> :TComment<CR>
endif

let &cpoptions = s:cpo_save
unlet s:cpo_save
