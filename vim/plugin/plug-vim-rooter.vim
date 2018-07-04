if !nanplug#IsLoaded('neosnippet') | finish | endif

let s:cpo_save = &cpoptions
set cpoptions&vim


let g:rooter_change_directory_for_non_project_files = 'current'

let g:rooter_silent_chdir = 1

let &cpoptions = s:cpo_save
unlet s:cpo_save

