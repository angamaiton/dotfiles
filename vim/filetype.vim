if exists('g:did_load_filetypes_user') | finish | endif
let g:did_load_filetypes_user = 1

function! s:SetJSONorYAML() abort
  if getline(1) ==# '{'
    setfiletype json
    return
  endif
  setfiletype yaml
endfunction

function! s:SetByShebang() abort
  let l:shebang = getline(1)
  if l:shebang =~# '^#!.*/.*\s\+node\>' | setfiletype javascript | endif
  if l:shebang =~# '^#!.*/.*\s\+zsh\>' | setfiletype zsh | endif
endfunction

" For filetypes that can be detected by filename (option C in the docs for
" `new-filetype`)
" Use `autocmd!` so the original filetype autocmd for the given extension gets
" cleared (otherwise it will run, and then this one, possible causing two
" filetype events to execute in succession)
augroup filetypedetect
  autocmd! BufNewFile,BufRead * call s:SetByShebang()

  autocmd! BufNewFile,BufRead *.dump setfiletype sql
  " autocmd! BufNewFile,BufRead .flake8 setfiletype dosini
  autocmd! BufNewFile,BufRead *.gradle setfiletype groovy

  autocmd! BufNewFile,BufRead *.gitconfig setfiletype gitconfig

  " git branch description (opened via `git branch --edit-description`)
  autocmd! BufNewFile,BufRead BRANCH_DESCRIPTION
        \ setfiletype gitbranchdescription.markdown

  " marko templating, close enough to HTML
  autocmd! BufNewFile,BufRead *.marko setfiletype html.marko
  autocmd! BufNewFile,BufRead *.template setfiletype html

  autocmd! BufNewFile,BufRead .eslintrc,.stylelintrc call s:SetJSONorYAML()

  autocmd! BufNewFile,BufRead *.md setfiletype markdown

  autocmd! BufNewFile,BufRead *.plist setfiletype xml

  autocmd! BufNewFile,BufRead .babelrc,.bowerrc,.jshintrc setfiletype json
  autocmd! BufNewFile,BufRead *.tern-config,.tern-config setfiletype json

  autocmd! BufNewFile,BufRead .zprofile setfiletype zsh
augroup END
