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
  
endif

if nanplug#Exists('vim-operator-surround')
  map <silent>  gsa <Plug>(operator-surround-append)
  map <silent>  gsd <Plug>(operator-surround-delete)
  map <silent>  gsr <Plug>(operator-surround-replace)

  nmap <silent> gsdd <Plug>(operator-surround-delete)<Plug>(textobj-anyblock-a)
  nmap <silent> gsrr <Plug>(operator-surround-replace)<Plug>(textobj-anyblock-a)
endif

if nanplug#Exists('vim-operator-surround')
  nmap <special> <Leader>c <Plug>(operator-camelize-toggle)
endif
