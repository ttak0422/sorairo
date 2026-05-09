" build with pgmnt.vim ({{ modified }})
if !has('gui_running') && &t_Co < 256
  finish
endif
hi clear
if exists('syntax_on')
  syntax reset
endif
set termguicolors
let g:colors_name = 'sorairo'
if &background ==# 'dark'
  {{ dark_groups }}
else
  {{ light_groups }}
endif
{{ links }}
if has('nvim')
  if &background ==# 'dark'
    {{ dark_neovim_groups }}
  else
    {{ light_neovim_groups }}
  endif
  {{ neovim_links }}
  if &background ==# 'dark'
    {{ dark_neovim_term }}
  else
    {{ light_neovim_term }}
  endif
else
  if &background ==# 'dark'
    {{ dark_vim_term }}
  else
    {{ light_vim_term }}
  endif
endif

command! SorairoPreview call sorairo#preview#open()
