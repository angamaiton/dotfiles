let g:lightline = {
  \   'active': {
  \     'left': [['mode', 'paste'], ['readonly', 'filename', 'modified']]
  \   },
  \   'component_expand': {
  \     'buffers': 'lightline#bufferline#buffers'
  \   },
  \   'component_function': {
  \     'gitbranch': 'fugitive#head',
  \   },
  \   'component_type': {
  \     'buffers': 'tabsel',
  \   }
  \ }
