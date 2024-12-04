" build with pgmnt.vim ({{ modified }})
if !has('gui_running') && &t_Co < 256
  finish
endif
hi clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name = 'sorairo'
{{ groups }}
{{ links }}
if has('nvim')
  {{ neovim_groups }}
  {{ neovim_links }}
  {{ neovim_term }}
else
  {{ vim_term }}
endif
