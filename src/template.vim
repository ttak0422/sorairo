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
{{ light_groups }}
{{ links }}
if has('nvim')
  {{ light_neovim_groups }}
  {{ neovim_links }}
  {{ light_neovim_term }}
else
  {{ light_vim_term }}
endif
