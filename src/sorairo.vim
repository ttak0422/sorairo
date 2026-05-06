" palette {{{
function! s:create_palette() abort

  let hue_base    = 240
  let hue_red     = 354
  let hue_green   = 101
  let hue_blue    = 205
  let hue_cyan    = 194
  let hue_magenta = 330
  let hue_purple  = 276
  let hue_yellow  =  45
  let hue_orange  =  29

  let g = {}

  " pgmnt#color#rgb(hue_base, 1.00, 0.99)
  let g.normal_bg = pgmnt#color#rgb(253, 253, 255)
  let g.normal_fg = pgmnt#color#hsl(hue_base, 0.15, 0.39)

  let g.white   = pgmnt#color#hsl(hue_base, 0.00, 0.93)
  let g.grey    = pgmnt#color#hsl(hue_base, 0.00, 0.40)
  let g.black   = pgmnt#color#hsl(hue_base, 0.00, 0.20)

  let g.red     = pgmnt#color#hsl(hue_red,     0.76, 0.65)
  let g.green   = pgmnt#color#hsl(hue_green,   0.47, 0.40)
  let g.blue    = pgmnt#color#hsl(hue_blue,    0.87, 0.44)
  let g.cyan    = pgmnt#color#hsl(hue_cyan,    0.36, 0.46)
  let g.magenta = pgmnt#color#hsl(hue_magenta, 0.60, 0.55)
  let g.purple  = pgmnt#color#hsl(hue_purple,  0.43, 0.61)
  let g.yellow  = pgmnt#color#hsl(hue_yellow,  0.64, 0.55)
  let g.orange  = pgmnt#color#hsl(hue_orange,  0.81, 0.54)

  let g.dark_white   = pgmnt#color#adjust_color(g.white,   {'saturation': -0.08, 'lightness': -0.15})
  let g.dark_grey    = pgmnt#color#adjust_color(g.grey,    {'saturation': -0.08, 'lightness': -0.12})
  let g.dark_black   = pgmnt#color#adjust_color(g.black,   {'saturation': -0.08, 'lightness': -0.12})
  let g.dark_red     = pgmnt#color#adjust_color(g.red,     {'saturation': -0.08, 'lightness': -0.12})
  let g.dark_green   = pgmnt#color#adjust_color(g.green,   {'saturation': -0.08, 'lightness': -0.12})
  let g.dark_blue    = pgmnt#color#adjust_color(g.blue,    {'saturation': -0.08, 'lightness': -0.12})
  let g.dark_cyan    = pgmnt#color#adjust_color(g.cyan,    {'saturation': -0.03, 'lightness': -0.10})
  let g.dark_magenta = pgmnt#color#adjust_color(g.magenta, {'saturation': -0.08, 'lightness': -0.12})
  let g.dark_purple  = pgmnt#color#adjust_color(g.purple,  {'saturation': -0.08, 'lightness': -0.12})
  let g.dark_yellow  = pgmnt#color#adjust_color(g.yellow,  {'saturation': -0.12, 'lightness': -0.10})
  let g.dark_orange  = pgmnt#color#adjust_color(g.orange,  {'saturation': -0.08, 'lightness': -0.12})

  let g.light_white   = pgmnt#color#adjust_color(g.white,   {'saturation': -0.05, 'lightness': +0.10})
  let g.light_grey    = pgmnt#color#adjust_color(g.grey,    {'saturation': -0.05, 'lightness': +0.10})
  let g.light_black   = pgmnt#color#adjust_color(g.black,   {'saturation': -0.05, 'lightness': +0.10})
  let g.light_red     = pgmnt#color#adjust_color(g.red,     {'saturation': -0.05, 'lightness': +0.10})
  let g.light_green   = pgmnt#color#adjust_color(g.green,   {'saturation': -0.05, 'lightness': +0.10})
  let g.light_blue    = pgmnt#color#adjust_color(g.blue,    {'saturation': -0.20, 'lightness': +0.18})
  let g.light_cyan    = pgmnt#color#adjust_color(g.cyan,    {'saturation': -0.02, 'lightness': +0.12})
  let g.light_magenta = pgmnt#color#adjust_color(g.magenta, {'saturation': -0.05, 'lightness': +0.10})
  let g.light_purple  = pgmnt#color#adjust_color(g.purple,  {'saturation': -0.05, 'lightness': +0.10})
  let g.light_yellow  = pgmnt#color#adjust_color(g.yellow,  {'saturation': -0.05, 'lightness': +0.10})
  let g.light_orange  = pgmnt#color#adjust_color(g.orange,  {'saturation': -0.05, 'lightness': +0.10})

  let g.red_tint_bg   = pgmnt#color#mix(g.red,   g.normal_bg, 0.15)
  let g.red_tint_fg   = pgmnt#color#mix(g.red,   g.normal_fg, 0.40)
  let g.green_tint_bg = pgmnt#color#mix(g.green, g.normal_bg, 0.15)
  let g.green_tint_fg = pgmnt#color#mix(g.green, g.normal_fg, 0.40)
  let g.blue_tint_bg  = pgmnt#color#mix(g.blue,  g.normal_bg, 0.15)
  let g.blue_tint_fg  = pgmnt#color#mix(g.blue,  g.normal_fg, 0.40)

  let g.dim_bg = pgmnt#color#adjust_color(
        \ g.normal_bg, {
        \   'saturation': -0.75,
        \   'lightness':  -0.02,
        \ })
  let g.dim_fg = pgmnt#color#adjust_color(
        \ g.normal_fg, {
        \   'saturation': -0.18,
        \   'lightness':  +0.26,
        \ })
  let g.dark_dim_bg  = pgmnt#color#adjust_color(g.dim_bg, {'saturation': -0.08, 'lightness': -0.12})
  let g.dark_dim_fg  = pgmnt#color#adjust_color(g.dim_fg, {'saturation': -0.08, 'lightness': -0.12})
  let g.light_dim_bg = pgmnt#color#adjust_color(g.dim_bg, {'saturation': -0.05, 'lightness': +0.10})
  let g.light_dim_fg = pgmnt#color#adjust_color(g.dim_fg, {'saturation': -0.05, 'lightness': +0.10})

  let g.cursorline_bg = pgmnt#color#adjust_color(
        \ g.normal_bg, {
        \   'saturation': -0.80,
        \   'lightness':  -0.10,
        \ })

  let g.term_colors = [
        \ g.normal_fg,
        \ g.red,
        \ g.green,
        \ g.yellow,
        \ g.blue,
        \ g.purple,
        \ g.cyan,
        \ g.cursorline_bg,
        \ pgmnt#color#adjust_color(g.normal_fg, {'saturation': +0.05, 'lightness': -0.05}),
        \ pgmnt#color#adjust_color(g.red,       {'saturation': +0.05, 'lightness': -0.05}),
        \ pgmnt#color#adjust_color(g.green,     {'saturation': +0.05, 'lightness': -0.05}),
        \ pgmnt#color#adjust_color(g.yellow,    {'saturation': +0.05, 'lightness': -0.05}),
        \ pgmnt#color#adjust_color(g.blue,      {'saturation': +0.05, 'lightness': -0.05}),
        \ pgmnt#color#adjust_color(g.purple,    {'saturation': +0.05, 'lightness': -0.05}),
        \ pgmnt#color#adjust_color(g.cyan,      {'saturation': +0.05, 'lightness': -0.05}),
        \ g.dim_fg,
        \ ]

  return g
endfunction
" }}}

function! s:create_highlights(palette)
  let c = a:palette

  let groups = []
  let neovim_groups = []
  let links = []
  let neovim_links = []

  " highlight groups {{{
  call extend(groups, pgmnt#hi#group(
        \ [ 'ColorColumn' ], {
        \ 'guibg': c.dim_bg,
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'Conceal' ], {
        \ 'guifg': c.grey,
        \ 'gui': 'bold',
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'Cursor' ], {
        \ 'guifg': 'NONE',
        \ 'guibg': 'NONE',
        \ 'gui': 'reverse',
        \ }))
  call add(links, pgmnt#hi#link('lCursor', 'Cursor'))
  call add(links, pgmnt#hi#link('CursorIM', 'Cursor'))
  call add(links, pgmnt#hi#link('CursorColumn', 'CursorLine'))
  call extend(groups, pgmnt#hi#group(
        \ [ 'CursorLine' ], {
        \ 'guibg': c.dim_bg,
        \ 'cterm': 'NONE',
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'Directory' ], {
        \ 'guifg': c.light_green,
        \ 'guibg': 'NONE',
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'DiffAdd' ], {
        \ 'guifg': 'NONE',
        \ 'guibg': c.light_green,
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'DiffChange' ], {
        \ 'guifg': 'NONE',
        \ 'guibg': c.light_blue,
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'DiffDelete' ], {
        \ 'guifg': 'NONE',
        \ 'guibg': c.light_red,
        \ 'gui': 'NONE',
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'DiffText' ], {
        \ 'guifg': 'NONE',
        \ 'guibg': c.light_cyan,
        \ }))
  call add(links, pgmnt#hi#link('DiffTextAdd', 'DiffText'))
  call add(links, pgmnt#hi#link('TermCursor', 'Cursor'))
  call extend(groups, pgmnt#hi#group(
        \ [ 'ErrorMsg' ], {
        \ 'guifg': c.red,
        \ 'gui': 'bold,underline',
        \ 'guisp': c.red,
        \ }))
  call add(links, pgmnt#hi#link('OkMsg', 'MoreMsg'))
  call add(links, pgmnt#hi#link('StderrMsg', 'ErrorMsg'))
  call add(links, pgmnt#hi#link('StdoutMsg', 'MsgArea'))
  call add(links, pgmnt#hi#link('VertSplit', 'WinSeparator'))
  call extend(groups, pgmnt#hi#group(
        \ [ 'WinSeparator' ], {
        \ 'guifg': c.light_dim_fg,
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'Folded', 'FoldColumn' ], {
        \ 'guifg': c.grey,
        \ 'guibg': 'NONE',
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'SignColumn' ], {
        \ 'guifg': c.normal_fg,
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'IncSearch' ], {
        \ 'guifg': c.normal_bg,
        \ 'guibg': c.dark_yellow,
        \ }))
  call add(links, pgmnt#hi#link('Substitute', 'Search'))
  call extend(groups, pgmnt#hi#group(
        \ [ 'LineNr' ], {
        \ 'guifg': c.light_dim_fg,
        \ }))
  call add(links, pgmnt#hi#link('LineNrAbove', 'LineNr'))
  call add(links, pgmnt#hi#link('LineNrBelow', 'LineNr'))
  call extend(groups, pgmnt#hi#group(
        \ [ 'CursorLineNr' ], {
        \ 'guifg': c.light_dim_fg,
        \ 'gui': 'bold',
        \ 'cterm': 'bold',
        \ }))
  call add(links, pgmnt#hi#link('CursorLineFold', 'FoldColumn'))
  call add(links, pgmnt#hi#link('CursorLineSign', 'SignColumn'))
  call extend(groups, pgmnt#hi#group(
        \ [ 'MatchParen' ], {
        \ 'guifg': c.dim_fg,
        \ 'guibg': c.dim_bg,
        \ 'gui': 'bold',
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'ModeMsg' ], {
        \ 'guifg': c.normal_fg,
        \ 'gui': 'bold',
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'MsgArea' ], {
        \ 'guifg': c.dim_fg,
        \ }))
  call add(links, pgmnt#hi#link('MsgSeparator', 'StatusLine'))
  call extend(groups, pgmnt#hi#group(
        \ [ 'MoreMsg' ], {
        \ 'guifg': c.yellow,
        \ 'gui': 'bold',
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'NonText' ], {
        \ 'guifg': c.light_grey,
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'Normal' ], {
        \ 'guifg': c.normal_fg,
        \ 'guibg': c.normal_bg,
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'NormalFloat' ], {
        \ 'guifg': c.normal_fg,
        \ 'guibg': c.dim_bg,
        \ }))
  call add(links, pgmnt#hi#link('FloatBorder', 'NormalFloat'))
  call add(links, pgmnt#hi#link('FloatShadow', 'NormalFloat'))
  call add(links, pgmnt#hi#link('FloatShadowThrough', 'NormalFloat'))
  call extend(groups, pgmnt#hi#group(
        \ [ 'FloatTitle' ], {
        \ 'guifg': c.orange,
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'FloatFooter' ], {
        \ 'guifg': c.dim_fg,
        \ }))
  call add(links, pgmnt#hi#link('NormalNC', 'Normal'))
  call extend(groups, pgmnt#hi#group(
        \ [ 'Pmenu' ], {
        \ 'guifg': c.normal_fg,
        \ 'guibg': c.dim_bg,
        \ 'gui': 'NONE',
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'PmenuSel' ], {
        \ 'guifg': c.normal_bg,
        \ 'guibg': c.dark_blue,
        \ 'gui': 'bold',
        \ }))
  call add(links, pgmnt#hi#link('PmenuKind', 'Pmenu'))
  call add(links, pgmnt#hi#link('PmenuKindSel', 'PmenuSel'))
  call add(links, pgmnt#hi#link('PmenuExtra', 'Pmenu'))
  call add(links, pgmnt#hi#link('PmenuExtraSel', 'PmenuSel'))
  call extend(groups, pgmnt#hi#group(
        \ [ 'PmenuSbar' ], {
        \ 'guibg': c.dark_dim_bg,
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'PmenuThumb' ], {
        \ 'guibg': c.grey,
        \ }))
  call add(links, pgmnt#hi#link('PmenuMatch', 'Pmenu'))
  call add(links, pgmnt#hi#link('PmenuMatchSel', 'PmenuSel'))
  call add(links, pgmnt#hi#link('PmenuBorder', 'Pmenu'))
  call add(links, pgmnt#hi#link('PmenuShadow', 'Pmenu'))
  call add(links, pgmnt#hi#link('PmenuShadowThrough', 'Pmenu'))
  call extend(groups, pgmnt#hi#group(
        \ [ 'ComplMatchIns' ], {
        \ 'gui': 'bold',
        \ }))
  call add(links, pgmnt#hi#link('PreInsert', 'ComplMatchIns'))
  call add(links, pgmnt#hi#link('ComplHint', 'Comment'))
  call add(links, pgmnt#hi#link('ComplHintMore', 'MoreMsg'))
  call add(links, pgmnt#hi#link('Question', 'MoreMsg'))
  call extend(groups, pgmnt#hi#group(
        \ [ 'QuickFixLine' ], {
        \ 'guifg': c.normal_fg,
        \ 'guibg': 'NONE',
        \ 'gui': 'bold,underline',
        \ 'guisp': c.normal_fg,
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'Search' ], {
        \ 'guifg': c.normal_bg,
        \ 'guibg': c.blue,
        \ }))
  call add(links, pgmnt#hi#link('SnippetTabstop', 'Visual'))
  call add(links, pgmnt#hi#link('SnippetTabstopActive', 'Visual'))
  call extend(groups, pgmnt#hi#group(
        \ [ 'SpecialKey' ], {
        \ 'guifg': c.light_dim_fg,
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'SpellBad' ], {
        \ 'guifg': c.red,
        \ 'gui': 'undercurl',
        \ 'guisp': c.red,
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'SpellCap' ], {
        \ 'guifg': c.yellow,
        \ 'gui': 'undercurl',
        \ 'guisp': c.yellow,
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'SpellLocal' ], {
        \ 'guifg': c.cyan,
        \ 'gui': 'undercurl',
        \ 'guisp': c.cyan,
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'SpellRare' ], {
        \ 'guifg': c.magenta,
        \ 'gui': 'undercurl',
        \ 'guisp': c.magenta,
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'StatusLine' ], {
        \ 'guifg': c.dim_fg,
        \ 'guibg': c.dim_bg,
        \ 'gui': 'NONE',
        \ 'cterm': 'NONE',
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'StatusLineNC' ], {
        \ 'guifg': c.dark_dim_fg,
        \ 'guibg': c.dim_bg,
        \ 'gui': 'NONE',
        \ 'cterm': 'NONE',
        \ }))
  call add(links, pgmnt#hi#link('StatusLineTerm', 'StatusLine'))
  call add(links, pgmnt#hi#link('StatusLineTermNC', 'StatusLineNC'))
  call extend(groups, pgmnt#hi#group(
        \ [ 'TabLine', 'TabLineFill' ], {
        \ 'guifg': c.dim_fg,
        \ 'guibg': c.dim_bg,
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'TabLineSel' ], {
        \ 'guifg': c.dark_dim_fg,
        \ 'guibg': c.dark_dim_bg,
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'Title' ], {
        \ 'guifg': c.normal_fg,
        \ 'guibg': 'NONE',
        \ 'gui': 'bold',
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'Visual' ], {
        \ 'guibg': c.dark_dim_bg,
        \ }))
  call add(links, pgmnt#hi#link('VisualNOS', 'Visual'))
  call add(links, pgmnt#hi#link('CurSearch', 'IncSearch'))
  call extend(groups, pgmnt#hi#group(
        \ [ 'EndOfBuffer' ], {
        \ 'guifg': c.normal_bg,
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'WarningMsg' ], {
        \ 'guifg': c.yellow,
        \ 'gui': 'bold,underline',
        \ 'guisp': c.yellow,
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'Whitespace' ], {
        \ 'guifg': c.light_grey,
        \ }))
  call add(links, pgmnt#hi#link('WildMenu', 'PmenuSel'))
  call extend(groups, pgmnt#hi#group(
        \ [ 'WinBar' ], {
        \ 'guifg': c.dim_fg,
        \ 'guibg': 'NONE',
        \ 'gui': 'bold',
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'WinBarNC' ], {
        \ 'guifg': c.dim_fg,
        \ 'guibg': 'NONE',
        \ }))
  call add(links, pgmnt#hi#link('TermCursorNC', 'Cursor'))
  " }}}

  " syntax highlighting {{{
  call extend(groups, pgmnt#hi#group(
        \ [ 'Comment' ], {
        \ 'guifg': c.dim_fg,
        \ 'gui': 'italic',
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'Constant' ], {
        \ 'guifg': c.dark_yellow,
        \ 'gui': 'bold',
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'String' ], {
        \ 'guifg': c.green,
        \ }))
  call add(links, pgmnt#hi#link('Character', 'String'))
  call extend(groups, pgmnt#hi#group(
        \ [ 'Number' ], {
        \ 'guifg': c.magenta,
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'Boolean' ], {
        \ 'guifg': c.magenta,
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'Float' ], {
        \ 'guifg': c.magenta,
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'Identifier' ], {
        \ 'guifg': c.magenta,
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'Function' ], {
        \ 'guifg': c.orange,
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'Statement' ], {
        \ 'guifg': c.red,
        \ 'gui': 'italic',
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'Conditional', 'Repeat' ], {
        \ 'guifg': c.red,
        \ }))
  call add(links, pgmnt#hi#link('Label', 'Keyword'))
  call extend(groups, pgmnt#hi#group(
        \ [ 'Operator' ], {
        \ 'guifg': c.yellow,
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'Keyword', 'Exception' ], {
        \ 'guifg': c.red,
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'PreProc', 'Include', 'Define' ], {
        \ 'guifg': c.magenta,
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'Macro' ], {
        \ 'guifg': c.cyan,
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'PreCondit' ], {
        \ 'guifg': c.magenta,
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'Type' ], {
        \ 'guifg': c.blue,
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'StorageClass' ], {
        \ 'guifg': c.orange,
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'Structure' ], {
        \ 'guifg': c.yellow,
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'Typedef' ], {
        \ 'guifg': c.orange,
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'Special' ], {
        \ 'guifg': c.yellow,
        \ }))
  call add(links, pgmnt#hi#link('SpecialChar', 'Special'))
  call add(links, pgmnt#hi#link('Tag', 'Special'))
  call extend(groups, pgmnt#hi#group(
        \ [ 'Delimiter' ], {
        \ 'guifg': c.normal_fg,
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'SpecialComment' ], {
        \ 'guifg': c.grey,
        \ 'gui': 'italic',
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'Debug' ], {
        \ 'guifg': c.yellow,
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'Underlined' ], {
        \ 'gui': 'underline',
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'Ignore' ], {
        \ 'guifg': c.grey,
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'Error' ], {
        \ 'guifg': c.dark_red,
        \ 'guibg': 'NONE',
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'Todo' ], {
        \ 'guifg': c.dark_magenta,
        \ 'gui': 'italic',
        \ }))
  call add(links, pgmnt#hi#link('Added', 'DiffAdd'))
  call add(links, pgmnt#hi#link('Changed', 'DiffChange'))
  call add(links, pgmnt#hi#link('Removed', 'DiffDelete'))
  " }}}

  " lsp highlight groups {{{
  call extend(groups, pgmnt#hi#group(
        \ [ 'LspReferenceText' ], {
        \ 'guifg': c.normal_bg,
        \ 'guibg': c.dark_orange,
        \ }))
  call add(links, pgmnt#hi#link('LspReferenceRead', 'LspReferenceText'))
  call extend(groups, pgmnt#hi#group(
        \ [ 'LspReferenceWrite' ], {
        \ 'guifg': c.normal_bg,
        \ 'guibg': c.dark_orange,
        \ 'gui': 'underline',
        \ }))
  call add(links, pgmnt#hi#link('LspReferenceTarget', 'LspReferenceText'))
  call extend(groups, pgmnt#hi#group(
        \ [ 'LspInlayHint' ], {
        \ 'guifg': c.grey,
        \ }))
  call add(links, pgmnt#hi#link('LspCodeLens', 'LspInlayHint'))
  call add(links, pgmnt#hi#link('LspCodeLensSeparator', 'LspInlayHint'))
  call add(links, pgmnt#hi#link('LspSignatureActiveParameter', 'Visual'))
  " }}}

  " diagnostic highlights {{{
  call extend(groups, pgmnt#hi#group(
        \ [ 'DiagnosticError' ], {
        \ 'guifg': c.dark_red,
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'DiagnosticWarn' ], {
        \ 'guifg': c.dark_yellow,
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'DiagnosticInfo' ], {
        \ 'guifg': c.dark_blue,
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'DiagnosticHint' ], {
        \ 'guifg': c.dark_cyan,
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'DiagnosticOk' ], {
        \ 'guifg': c.dark_green,
        \ }))
  call add(links, pgmnt#hi#link('DiagnosticVirtualTextError', 'DiagnosticError'))
  call add(links, pgmnt#hi#link('DiagnosticVirtualTextWarn', 'DiagnosticWarn'))
  call add(links, pgmnt#hi#link('DiagnosticVirtualTextInfo', 'DiagnosticInfo'))
  call add(links, pgmnt#hi#link('DiagnosticVirtualTextHint', 'DiagnosticHint'))
  call add(links, pgmnt#hi#link('DiagnosticVirtualTextOk', 'DiagnosticOk'))
  call add(links, pgmnt#hi#link('DiagnosticVirtualLinesError', 'DiagnosticError'))
  call add(links, pgmnt#hi#link('DiagnosticVirtualLinesWarn', 'DiagnosticWarn'))
  call add(links, pgmnt#hi#link('DiagnosticVirtualLinesInfo', 'DiagnosticInfo'))
  call add(links, pgmnt#hi#link('DiagnosticVirtualLinesHint', 'DiagnosticHint'))
  call add(links, pgmnt#hi#link('DiagnosticVirtualLinesOk', 'DiagnosticOk'))
  call extend(groups, pgmnt#hi#group(
        \ [ 'DiagnosticUnderlineError' ], {
        \ 'gui': 'undercurl',
        \ 'guisp': c.dark_red,
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'DiagnosticUnderlineWarn' ], {
        \ 'gui': 'undercurl',
        \ 'guisp': c.dark_yellow,
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'DiagnosticUnderlineInfo' ], {
        \ 'gui': 'undercurl',
        \ 'guisp': c.dark_blue,
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'DiagnosticUnderlineHint' ], {
        \ 'gui': 'undercurl',
        \ 'guisp': c.dark_cyan,
        \ }))
  call extend(groups, pgmnt#hi#group(
        \ [ 'DiagnosticUnderlineOk' ], {
        \ 'gui': 'undercurl',
        \ 'guisp': c.dark_green,
        \ }))
  call add(links, pgmnt#hi#link('DiagnosticFloatingError', 'DiagnosticError'))
  call add(links, pgmnt#hi#link('DiagnosticFloatingWarn', 'DiagnosticWarn'))
  call add(links, pgmnt#hi#link('DiagnosticFloatingInfo', 'DiagnosticInfo'))
  call add(links, pgmnt#hi#link('DiagnosticFloatingHint', 'DiagnosticHint'))
  call add(links, pgmnt#hi#link('DiagnosticFloatingOk', 'DiagnosticOk'))
  call add(links, pgmnt#hi#link('DiagnosticSignError', 'DiagnosticError'))
  call add(links, pgmnt#hi#link('DiagnosticSignWarn', 'DiagnosticWarn'))
  call add(links, pgmnt#hi#link('DiagnosticSignInfo', 'DiagnosticInfo'))
  call add(links, pgmnt#hi#link('DiagnosticSignHint', 'DiagnosticHint'))
  call add(links, pgmnt#hi#link('DiagnosticSignOk', 'DiagnosticOk'))
  call extend(groups, pgmnt#hi#group(
        \ [ 'DiagnosticDeprecated' ], {
        \ 'guifg': c.dark_red,
        \ 'gui': 'strikethrough',
        \ 'guisp': c.dark_red,
        \ }))
  call add(links, pgmnt#hi#link('DiagnosticUnnecessary', 'DiagnosticUnderlineHint'))
  " }}}

  " treesitter highlight groups {{{
  call extend(neovim_groups, pgmnt#hi#group(
        \ [ '@variable' ], {
        \ 'guifg': c.normal_fg,
        \ }))
  call add(neovim_links, pgmnt#hi#link('@variable.builtin', '@variable'))
  call extend(neovim_groups, pgmnt#hi#group(
        \ [ '@variable.parameter' ], {
        \ 'guifg': c.magenta,
        \ }))
  call add(neovim_links, pgmnt#hi#link('@variable.parameter.builtin', '@variable.parameter'))
  call extend(neovim_groups, pgmnt#hi#group(
        \ [ '@variable.member' ], {
        \ 'guifg': c.normal_fg,
        \ 'gui': 'italic',
        \ }))
  call extend(neovim_groups, pgmnt#hi#group(
        \ [ '@constant' ], {
        \ 'guifg': c.dark_yellow,
        \ 'gui': 'bold',
        \ }))
  call add(neovim_links, pgmnt#hi#link('@constant.builtin', '@constant'))
  call add(neovim_links, pgmnt#hi#link('@constant.macro', '@constant'))
  call extend(neovim_groups, pgmnt#hi#group(
        \ [ '@module' ], {
        \ 'guifg': c.light_magenta,
        \ }))
  call add(neovim_links, pgmnt#hi#link('@module.builtin', '@module'))
  call add(neovim_links, pgmnt#hi#link('@label', 'Label'))
  call add(neovim_links, pgmnt#hi#link('@string', 'String'))
  call add(neovim_links, pgmnt#hi#link('@string.documentation', 'Comment'))
  call extend(neovim_groups, pgmnt#hi#group(
        \ [ '@string.regexp' ], {
        \ 'guifg': c.dark_orange,
        \ }))
  call extend(neovim_groups, pgmnt#hi#group(
        \ [ '@string.escape' ], {
        \ 'guifg': c.dark_orange,
        \ 'gui': 'bold',
        \ }))
  call add(neovim_links, pgmnt#hi#link('@string.special', 'Special'))
  call extend(neovim_groups, pgmnt#hi#group(
        \ [ '@string.special.symbol' ], {
        \ 'guifg': c.green,
        \ 'gui': 'bold',
        \ }))
  call extend(neovim_groups, pgmnt#hi#group(
        \ [ '@string.special.path' ], {
        \ 'guifg': c.green,
        \ 'gui': 'underline',
        \ }))
  call add(neovim_links, pgmnt#hi#link('@string.special.url', '@string.special.path'))
  call add(neovim_links, pgmnt#hi#link('@character', 'Character'))
  call add(neovim_links, pgmnt#hi#link('@character.special', 'SpecialChar'))
  call add(neovim_links, pgmnt#hi#link('@boolean', 'Boolean'))
  call add(neovim_links, pgmnt#hi#link('@number', 'Number'))
  call add(neovim_links, pgmnt#hi#link('@number.float', 'Number'))
  call add(neovim_links, pgmnt#hi#link('@type', 'Type'))
  call add(neovim_links, pgmnt#hi#link('@type.builtin', '@type'))
  call add(neovim_links, pgmnt#hi#link('@type.definition', '@type'))
  call extend(neovim_groups, pgmnt#hi#group(
        \ [ '@attribute' ], {
        \ 'guifg': c.cyan,
        \ }))
  call add(neovim_links, pgmnt#hi#link('@attribute.builtin', '@attribute'))
  call add(neovim_links, pgmnt#hi#link('@property', '@variable.member'))
  call add(neovim_links, pgmnt#hi#link('@function', 'Function'))
  call add(neovim_links, pgmnt#hi#link('@function.builtin', '@function'))
  call add(neovim_links, pgmnt#hi#link('@function.call', '@function'))
  call add(neovim_links, pgmnt#hi#link('@function.macro', 'Macro'))
  call add(neovim_links, pgmnt#hi#link('@function.method', '@function'))
  call add(neovim_links, pgmnt#hi#link('@function.method.call', '@function.method'))
  call add(neovim_links, pgmnt#hi#link('@constructor', 'Identifier'))
  call add(neovim_links, pgmnt#hi#link('@operator', 'Operator'))
  call add(neovim_links, pgmnt#hi#link('@keyword', 'Keyword'))
  call add(neovim_links, pgmnt#hi#link('@keyword.coroutine', '@keyword'))
  call add(neovim_links, pgmnt#hi#link('@keyword.function', '@keyword'))
  call add(neovim_links, pgmnt#hi#link('@keyword.operator', 'Operator'))
  call add(neovim_links, pgmnt#hi#link('@keyword.import', 'PreProc'))
  call add(neovim_links, pgmnt#hi#link('@keyword.type', 'Structure'))
  call add(neovim_links, pgmnt#hi#link('@keyword.modifier', 'StorageClass'))
  call add(neovim_links, pgmnt#hi#link('@keyword.repeat', 'Repeat'))
  call add(neovim_links, pgmnt#hi#link('@keyword.return', '@keyword'))
  call add(neovim_links, pgmnt#hi#link('@keyword.debug', 'Debug'))
  call add(neovim_links, pgmnt#hi#link('@keyword.exception', 'Exception'))
  call add(neovim_links, pgmnt#hi#link('@keyword.conditional', 'Conditional'))
  call add(neovim_links, pgmnt#hi#link('@keyword.conditional.ternary', 'Conditional'))
  call add(neovim_links, pgmnt#hi#link('@keyword.directive', 'PreProc'))
  call add(neovim_links, pgmnt#hi#link('@keyword.directive.define', 'Define'))
  call extend(neovim_groups, pgmnt#hi#group(
        \ [ '@punctuation.delimiter', '@punctuation.bracket' ], {
        \ 'guifg': c.dark_magenta,
        \ }))
  call add(neovim_links, pgmnt#hi#link('@punctuation.special', 'Special'))
  call add(neovim_links, pgmnt#hi#link('@comment', 'Comment'))
  call add(neovim_links, pgmnt#hi#link('@comment.documentation', 'SpecialComment'))
  call extend(neovim_groups, pgmnt#hi#group(
        \ [ '@comment.error' ], {
        \ 'guifg': c.normal_bg,
        \ 'guibg': c.light_red,
        \ }))
  call extend(neovim_groups, pgmnt#hi#group(
        \ [ '@comment.warning' ], {
        \ 'guifg': c.normal_bg,
        \ 'guibg': c.light_yellow,
        \ }))
  call extend(neovim_groups, pgmnt#hi#group(
        \ [ '@comment.todo' ], {
        \ 'guifg': c.normal_bg,
        \ 'guibg': c.light_cyan,
        \ }))
  call extend(neovim_groups, pgmnt#hi#group(
        \ [ '@comment.note' ], {
        \ 'guifg': c.normal_bg,
        \ 'guibg': c.light_blue,
        \ }))
  call extend(neovim_groups, pgmnt#hi#group(
        \ [ '@markup.strong' ], {
        \ 'gui': 'bold',
        \ }))
  call extend(neovim_groups, pgmnt#hi#group(
        \ [ '@markup.italic' ], {
        \ 'gui': 'italic',
        \ }))
  call extend(neovim_groups, pgmnt#hi#group(
        \ [ '@markup.strikethrough' ], {
        \ 'gui': 'strikethrough',
        \ }))
  call add(neovim_links, pgmnt#hi#link('@markup.underline', 'Underlined'))
  call add(neovim_links, pgmnt#hi#link('@markup.heading', 'Title'))
  call add(neovim_links, pgmnt#hi#link('@markup.heading.1', '@markup.heading.1.markdown'))
  call add(neovim_links, pgmnt#hi#link('@markup.heading.2', '@markup.heading.2.markdown'))
  call add(neovim_links, pgmnt#hi#link('@markup.heading.3', '@markup.heading.3.markdown'))
  call add(neovim_links, pgmnt#hi#link('@markup.heading.4', '@markup.heading.4.markdown'))
  call add(neovim_links, pgmnt#hi#link('@markup.heading.5', '@markup.heading.5.markdown'))
  call add(neovim_links, pgmnt#hi#link('@markup.heading.6', '@markup.heading.6.markdown'))
  call extend(neovim_groups, pgmnt#hi#group(
        \ [ '@markup.heading.1.markdown' ], {
        \ 'guifg': c.dark_blue,
        \ 'gui': 'bold',
        \ }))
  call extend(neovim_groups, pgmnt#hi#group(
        \ [ '@markup.heading.2.markdown' ], {
        \ 'guifg': c.dark_orange,
        \ 'gui': 'bold',
        \ }))
  call extend(neovim_groups, pgmnt#hi#group(
        \ [ '@markup.heading.3.markdown' ], {
        \ 'guifg': c.dark_green,
        \ 'gui': 'bold',
        \ }))
  call extend(neovim_groups, pgmnt#hi#group(
        \ [ '@markup.heading.4.markdown' ], {
        \ 'guifg': c.dark_cyan,
        \ 'gui': 'bold',
        \ }))
  call extend(neovim_groups, pgmnt#hi#group(
        \ [ '@markup.heading.5.markdown' ], {
        \ 'guifg': c.dark_magenta,
        \ 'gui': 'bold',
        \ }))
  call extend(neovim_groups, pgmnt#hi#group(
        \ [ '@markup.heading.6.markdown' ], {
        \ 'guifg': c.dark_purple,
        \ 'gui': 'bold',
        \ }))
  call add(neovim_links, pgmnt#hi#link('@markup.quote', 'Special'))
  call add(neovim_links, pgmnt#hi#link('@markup.math', 'Special'))
  call add(neovim_links, pgmnt#hi#link('@markup.link', 'Underlined'))
  call add(neovim_links, pgmnt#hi#link('@markup.link.label', 'Special'))
  call add(neovim_links, pgmnt#hi#link('@markup.link.url', 'Special'))
  call add(neovim_links, pgmnt#hi#link('@markup.raw', 'String'))
  call add(neovim_links, pgmnt#hi#link('@markup.raw.block', '@markup.raw'))
  call add(neovim_links, pgmnt#hi#link('@markup.list', 'Special'))
  call add(neovim_links, pgmnt#hi#link('@markup.list.checked', '@markup.list'))
  call add(neovim_links, pgmnt#hi#link('@markup.list.unchecked', '@markup.list'))
  call extend(neovim_groups, pgmnt#hi#group(
        \ [ '@diff.plus' ], {
        \ 'guifg': c.light_green,
        \ 'gui': 'bold',
        \ }))
  call extend(neovim_groups, pgmnt#hi#group(
        \ [ '@diff.minus' ], {
        \ 'guifg': c.light_red,
        \ 'gui': 'bold',
        \ }))
  call extend(neovim_groups, pgmnt#hi#group(
        \ [ '@diff.delta' ], {
        \ 'guifg': c.light_blue,
        \ 'gui': 'bold',
        \ }))
  call add(neovim_links, pgmnt#hi#link('@tag', 'Tag'))
  call add(neovim_links, pgmnt#hi#link('@tag.builtin', '@tag'))
  call add(neovim_links, pgmnt#hi#link('@tag.attribute', '@property'))
  call add(neovim_links, pgmnt#hi#link('@tag.delimiter', 'Delimiter'))
  " }}}

  " lsp semantic highlight groups {{{
  call add(neovim_links, pgmnt#hi#link('@lsp.type.class', 'Type'))
  call add(neovim_links, pgmnt#hi#link('@lsp.type.comment', 'Comment'))
  call add(neovim_links, pgmnt#hi#link('@lsp.type.decorator', '@attribute'))
  call add(neovim_links, pgmnt#hi#link('@lsp.type.enum', 'Type'))
  call add(neovim_links, pgmnt#hi#link('@lsp.type.enumMember', 'Constant'))
  call add(neovim_links, pgmnt#hi#link('@lsp.type.event', 'Identifier'))
  call add(neovim_links, pgmnt#hi#link('@lsp.type.function', 'Function'))
  call add(neovim_links, pgmnt#hi#link('@lsp.type.interface', 'Type'))
  call add(neovim_links, pgmnt#hi#link('@lsp.type.keyword', 'Keyword'))
  call add(neovim_links, pgmnt#hi#link('@lsp.type.macro', 'Macro'))
  call add(neovim_links, pgmnt#hi#link('@lsp.type.method', 'Function'))
  call add(neovim_links, pgmnt#hi#link('@lsp.type.modifier', 'StorageClass'))
  call add(neovim_links, pgmnt#hi#link('@lsp.type.namespace', '@module'))
  call add(neovim_links, pgmnt#hi#link('@lsp.type.number', 'Number'))
  call add(neovim_links, pgmnt#hi#link('@lsp.type.operator', 'Operator'))
  call add(neovim_links, pgmnt#hi#link('@lsp.type.parameter', '@variable.parameter'))
  call add(neovim_links, pgmnt#hi#link('@lsp.type.property', '@property'))
  call add(neovim_links, pgmnt#hi#link('@lsp.type.regexp', '@string.regexp'))
  call add(neovim_links, pgmnt#hi#link('@lsp.type.string', 'String'))
  call add(neovim_links, pgmnt#hi#link('@lsp.type.struct', 'Structure'))
  call add(neovim_links, pgmnt#hi#link('@lsp.type.type', 'Type'))
  call add(neovim_links, pgmnt#hi#link('@lsp.type.typeParameter', 'Type'))
  call add(neovim_links, pgmnt#hi#link('@lsp.type.variable', '@variable'))
  call add(neovim_links, pgmnt#hi#link('@lsp.mod.abstract', 'StorageClass'))
  call add(neovim_links, pgmnt#hi#link('@lsp.mod.async', '@keyword.coroutine'))
  call add(neovim_links, pgmnt#hi#link('@lsp.mod.declaration', '@lsp.mod.definition'))
  call add(neovim_links, pgmnt#hi#link('@lsp.mod.defaultLibrary', '@variable.builtin'))
  call add(neovim_links, pgmnt#hi#link('@lsp.mod.definition', 'Identifier'))
  call add(neovim_links, pgmnt#hi#link('@lsp.mod.deprecated', 'DiagnosticDeprecated'))
  call add(neovim_links, pgmnt#hi#link('@lsp.mod.documentation', 'SpecialComment'))
  call add(neovim_links, pgmnt#hi#link('@lsp.mod.modification', 'Identifier'))
  call add(neovim_links, pgmnt#hi#link('@lsp.mod.readonly', 'Constant'))
  call add(neovim_links, pgmnt#hi#link('@lsp.mod.static', 'StorageClass'))
  " }}}

  " terminal {{{
  let quoted_term_colors = map(
        \ c.term_colors,
        \ '"''" . v:val . "''"')

  let vim_term = printf(
        \ 'let g:terminal_ansi_colors = [%s]',
        \ join(quoted_term_colors, ', ')
        \ )
  let neovim_term = map(
        \ copy(quoted_term_colors),
        \ '"let g:terminal_color_" . v:key . " = " . v:val')
  " }}}

  " plugins {{{
  " nvim-notify
  call extend(neovim_groups, pgmnt#hi#group(
        \ [ 'NotifyERRORBorder' ], {
        \ 'guifg': c.dark_red,
        \ }))
  call extend(neovim_groups, pgmnt#hi#group(
        \ [ 'NotifyWARNBorder' ], {
        \ 'guifg': c.dark_yellow,
        \ }))
  call extend(neovim_groups, pgmnt#hi#group(
        \ [ 'NotifyINFOBorder' ], {
        \ 'guifg': c.dark_blue,
        \ }))
  call extend(neovim_groups, pgmnt#hi#group(
        \ [ 'NotifyDEBUGBorder' ], {
        \ 'guifg': c.dark_cyan,
        \ }))
  call extend(neovim_groups, pgmnt#hi#group(
        \ [ 'NotifyTRACEBorder' ], {
        \ 'guifg': c.dark_cyan,
        \ }))
  call extend(neovim_groups, pgmnt#hi#group(
        \ [ 'NotifyERRORIcon', 'NotifyERRORTitle' ], {
        \ 'guifg': c.red,
        \ }))
  call extend(neovim_groups, pgmnt#hi#group(
        \ [ 'NotifyWARNIcon', 'NotifyWARNTitle' ], {
        \ 'guifg': c.yellow,
        \ }))
  call extend(neovim_groups, pgmnt#hi#group(
        \ [ 'NotifyINFOIcon', 'NotifyINFOTitle' ], {
        \ 'guifg': c.blue,
        \ }))
  call extend(neovim_groups, pgmnt#hi#group(
        \ [ 'NotifyDEBUGIcon', 'NotifyDEBUGTitle' ], {
        \ 'guifg': c.cyan,
        \ }))
  call extend(neovim_groups, pgmnt#hi#group(
        \ [ 'NotifyTRACEIcon', 'NotifyTRACETitle' ], {
        \ 'guifg': c.cyan,
        \ }))
  call add(neovim_links, pgmnt#hi#link('NotifyERRORBody', 'Normal'))
  call add(neovim_links, pgmnt#hi#link('NotifyWARNBody', 'Normal'))
  call add(neovim_links, pgmnt#hi#link('NotifyINFOBody', 'Normal'))
  call add(neovim_links, pgmnt#hi#link('NotifyDEBUGBody', 'Normal'))
  call add(neovim_links, pgmnt#hi#link('NotifyTRACEBody', 'Normal'))
  " gitsigns.nvim
  call extend(neovim_groups, pgmnt#hi#group(
        \ ['GitSignsAdd'], {
        \ 'guifg': c.light_green,
        \ 'guibg': 'NONE',
        \ }))
  call extend(neovim_groups, pgmnt#hi#group(
        \ ['GitSignsChange'], {
        \ 'guifg': c.light_blue,
        \ 'guibg': 'NONE',
        \ }))
  call extend(neovim_groups, pgmnt#hi#group(
        \ ['GitSignsDelete'], {
        \ 'guifg': c.light_red,
        \ 'guibg': 'NONE',
        \ }))
  call extend(neovim_groups, pgmnt#hi#group(
        \ ['GitSignsAddInline'], {
        \ 'guifg': c.white,
        \ 'guibg': c.light_green,
        \ 'gui': 'bold',
        \ }))
  call extend(neovim_groups, pgmnt#hi#group(
        \ ['GitSignsChangeInline'], {
        \ 'guifg': c.white,
        \ 'guibg': c.light_blue,
        \ 'gui': 'bold',
        \ }))
  call extend(neovim_groups, pgmnt#hi#group(
        \ ['GitSignsDeleteInline'], {
        \ 'guifg': c.white,
        \ 'guibg': c.light_red,
        \ 'gui': 'bold',
        \ }))
  call extend(neovim_groups, pgmnt#hi#group(
        \ ['GitSignsAddPreview'], {
        \ 'guifg': c.light_green,
        \ 'guibg': 'NONE',
        \ }))
  call extend(neovim_groups, pgmnt#hi#group(
        \ ['GitSignsDeletePreview'], {
        \ 'guifg': c.light_red,
        \ 'guibg': 'NONE',
        \ }))
  " }}}

  return {
        \ 'groups': groups,
        \ 'neovim_groups': neovim_groups,
        \ 'vim_term': vim_term,
        \ 'neovim_term': neovim_term,
        \ 'links': links,
        \ 'neovim_links': neovim_links,
        \ }
endfunction

function! s:create_context()
  let l = s:create_highlights(s:create_palette())
  let links = l.links
  let neovim_links = l.neovim_links

  return {
        \ 'modified': strftime('%Y-%m-%d %H:%M%z'),
        \ 'light_groups': l.groups,
        \ 'light_neovim_groups': l.neovim_groups,
        \ 'light_vim_term': l.vim_term,
        \ 'light_neovim_term': l.neovim_term,
        \ 'links': links,
        \ 'neovim_links': neovim_links,
        \ }
endfunction

call pgmnt#compile(s:create_context(), {
      \ 'output': expand('<sfile>:p:h') . '/../colors/sorairo.vim',
      \ 'template': expand('<sfile>:p:h') . '/template.vim',
      \ })
