let s:palette = {
  \ 'white': '#ffffff',
  \ 'prm0': '#000000',
  \ 'prm1': '#73739b',
  \ 'sub0': '#ff0000',
  \ 'sub1': '#f1f1f3',
  \ 'sub2': '#e4e4e6',
  \ 'grey0': '#666666',
  \ 'grey1': '#777777',
  \ 'grey2': '#888888',
  \ 'blue0': '#1d79c0',
  \ 'blue1': '#218bdd',
  \ 'blue2': '#26a0fe',
  \ 'cyan0': '#568496',
  \ 'cyan1': '#6ca5bc',
  \ 'cyan2': '#87ceeb',
  \ 'magenta0': '#b14a7c',
  \ 'magenta1': '#cc5490',
  \ 'magenta2': '#ff69b4',
  \ 'purple0': '#901dd8',
  \ 'purple1': '#9c1fea',
  \ 'purple2': '#a922ff',
  \ 'red0': '#dd4848',
  \ 'red1': '#ec4d4d',
  \ 'red2': '#fd5252',
  \ 'green0': '#359735',
  \ 'green1': '#42b042',
  \ 'green2': '#4ddb4d',
  \ 'yellow0': '#d7ba5c',
  \ 'yellow1': '#eccb65',
  \ 'yellow2': '#ffdf64',
  \ 'brown0': '#b85830',
  \ 'brown1': '#dd713e',
  \ 'brown2': '#fc8146',
  \ }

function! s:create() abort
  let c = s:palette

  let term_colors = [
        \ c.sub0,
        \ c.red1,
        \ c.green1,
        \ c.yellow1,
        \ c.blue1,
        \ c.magenta1,
        \ c.cyan1,
        \ c.prm0,
        \ c.grey1,
        \ c.red0,
        \ c.green0,
        \ c.yellow0,
        \ c.blue0,
        \ c.magenta0,
        \ c.cyan0,
        \ c.prm1
        \ ]

  let groups = []
  let links = []
  let neovim_groups = []
  let neovim_links = []

  " builtin {{{
  call extend(groups, pgmnt#hi#group('ColorColumn', {
        \ 'guibg': c.sub1,
        \ }))
  call extend(groups, pgmnt#hi#group('Conceal', {
        \ 'guifg': c.grey1,
        \ 'gui': 'bold',
        \ }))
  call extend(groups, pgmnt#hi#group('Cursor', {
        \ 'guifg': 'NONE',
        \ 'guibg': 'NONE',
        \ 'gui': 'reverse',
        \ }))
  call add(links, pgmnt#hi#link('lCursor', 'Cursor'))
  call add(links, pgmnt#hi#link('CursorIM', 'Cursor'))
  call add(links, pgmnt#hi#link('CursorColumn', 'CursorLine'))
  call extend(groups, pgmnt#hi#group('CursorLine', {
        \ 'guibg': c.sub1,
        \ 'cterm': 'NONE',
        \ }))
  call extend(groups, pgmnt#hi#group('Directory', {
        \ 'guifg': c.green0,
        \ }))
  call extend(groups, pgmnt#hi#group('DiffAdd', {
        \ 'guifg': c.green2,
        \ 'guibg': c.sub0,
        \ 'gui': 'NONE',
        \ }))
  call extend(groups, pgmnt#hi#group('DiffChange', {
        \ 'guifg': c.blue2,
        \ 'guibg': c.sub0,
        \ 'gui': 'NONE',
        \ }))
  call extend(groups, pgmnt#hi#group('DiffDelete', {
        \ 'guifg': c.red2,
        \ 'guibg': c.sub0,
        \ 'gui': 'NONE',
        \ }))
  call extend(groups, pgmnt#hi#group('DiffText', {
        \ 'guifg': c.cyan2,
        \ 'guibg': c.sub0,
        \ 'gui': 'NONE',
        \ }))
  call add(links, pgmnt#hi#link('Added', 'DiffAdd'))
  call add(links, pgmnt#hi#link('Changed', 'DiffChanged'))
  call add(links, pgmnt#hi#link('Removed', 'DiffDelete'))
  call extend(groups, pgmnt#hi#group('EndOfBuffer', {
        \ 'guifg': c.sub0,
        \ }))
  call add(links, pgmnt#hi#link('TermCursor', 'Cursor'))
  call extend(groups, pgmnt#hi#group('TermCursorNC', {
        \ 'guifg': 'NONE',
        \ 'guibg': 'NONE',
        \ }))
  call extend(groups, pgmnt#hi#group('ErrorMsg', {
        \ 'guifg': c.red1,
        \ 'gui': 'bold,underline',
        \ }))
  call extend(groups, pgmnt#hi#group('WinSeparator', {
        \ 'guifg': c.sub2,
        \ 'guibg': 'NONE',
        \ }))
  call extend(groups, pgmnt#hi#group('Folded', {
        \ 'guifg': c.grey1,
        \ 'guibg': 'NONE',
        \ }))
  call extend(groups, pgmnt#hi#group('FoldColumn', {
        \ 'guifg': c.grey1,
        \ 'guibg': 'NONE',
        \ }))
  call extend(groups, pgmnt#hi#group('SignColumn', {
        \ 'guifg': c.prm0,
        \ }))
  call extend(groups, pgmnt#hi#group('Search', {
        \ 'guifg': c.sub0,
        \ 'guibg': c.blue2,
        \ }))
  call add(links, pgmnt#hi#link('CurSearch', 'IncSearch'))
  call extend(groups, pgmnt#hi#group('IncSearch', {
        \ 'guifg': c.grey0,
        \ 'guibg': c.yellow2,
        \ }))
  call add(links, pgmnt#hi#link('Substitute', 'Search'))
  call extend(groups, pgmnt#hi#group('LineNr', {
        \ 'guifg': c.grey2,
        \ }))
  call extend(groups, pgmnt#hi#group('CursorLineNr', {
        \ 'guifg': c.grey1,
        \ 'cterm': 'NONE',
        \ }))
  call extend(groups, pgmnt#hi#group('MatchParen', {
        \ 'guibg': c.sub2,
        \ 'gui': 'bold',
        \ }))
  call extend(groups, pgmnt#hi#group('ModeMsg', {
        \ 'guifg': c.prm0,
        \ 'gui': 'bold',
        \ }))
  call extend(groups, pgmnt#hi#group('MsgSeparator', {
        \ 'guibg': c.sub2,
        \ }))
  call extend(groups, pgmnt#hi#group('MoreMsg', {
        \ 'guifg': c.yellow1,
        \ 'gui': 'bold',
        \ }))
  call extend(groups, pgmnt#hi#group('NonText', {
        \ 'guifg': c.grey2,
        \ }))
  call extend(groups, pgmnt#hi#group('Normal', {
        \ 'guifg': c.prm0,
        \ 'guibg': c.sub0,
        \ }))
  call extend(groups, pgmnt#hi#group('NormalFloat', {
        \ 'guifg': c.prm0,
        \ 'guibg': c.sub1,
        \ }))
  call extend(groups, pgmnt#hi#group('FloatTitle', {
        \ 'guifg': c.blue0,
        \ 'guibg': c.sub1,
        \ 'gui': 'bold',
        \ }))
  call extend(groups, pgmnt#hi#group('FloatFooter', {
        \ 'guifg': c.blue1,
        \ 'guibg': c.sub1,
        \ }))
  call add(links, pgmnt#hi#link('NormalNC', 'Normal'))
  call extend(groups, pgmnt#hi#group('Pmenu', {
        \ 'guifg': c.prm1,
        \ 'guibg': c.sub1,
        \ }))
  call extend(groups, pgmnt#hi#group('PmenuSel', {
        \ 'guifg': c.sub0,
        \ 'guibg': c.blue1,
        \ }))
  call extend(groups, pgmnt#hi#group('PmenuSbar', {
        \ 'guibg': c.sub2,
        \ }))
  call extend(groups, pgmnt#hi#group('PmenuThumb', {
        \ 'guibg': c.grey2,
        \ }))
  call add(links, pgmnt#hi#link('Question', 'MoreMsg'))
  call extend(groups, pgmnt#hi#group('QuickFixLine', {
        \ 'guifg': c.magenta1,
        \ 'guibg': c.sub1,
        \ }))
  call extend(groups, pgmnt#hi#group('SpecialKey', {
        \ 'guifg': c.prm1,
        \ }))
  call extend(groups, pgmnt#hi#group('SpellBad', {
        \ 'guifg': c.red1,
        \ 'gui': 'undercurl',
        \ 'guisp': c.red1,
        \ }))
  call extend(groups, pgmnt#hi#group('SpellCap', {
        \ 'guifg': c.blue1,
        \ 'gui': 'undercurl',
        \ 'guisp': c.blue1,
        \ }))
  call extend(groups, pgmnt#hi#group('SpellLocal', {
        \ 'guifg': c.cyan1,
        \ 'gui': 'undercurl',
        \ 'guisp': c.cyan1,
        \ }))
  call extend(groups, pgmnt#hi#group('SpellRare', {
        \ 'guifg': c.magenta1,
        \ 'gui': 'undercurl',
        \ 'guisp': c.magenta1,
        \ }))
  call extend(groups, pgmnt#hi#group('StatusLine', {
        \ 'guifg': c.grey0,
        \ 'guibg': c.sub1,
        \ }))
  call extend(groups, pgmnt#hi#group('StatusLineNC', {
        \ 'guifg': c.grey2,
        \ 'guibg': c.sub1,
        \ }))
  call extend(groups, pgmnt#hi#group('TabLine', {
        \ 'guifg': c.prm1,
        \ 'guibg': c.sub1,
        \ }))
  call extend(groups, pgmnt#hi#group('TablineFill', {
        \ 'guifg': c.prm1,
        \ 'guibg': c.sub1,
        \ }))
  call extend(groups, pgmnt#hi#group('TabLineSel', {
        \ 'guifg': c.prm0,
        \ 'guibg': c.sub0,
        \ 'gui': 'bold',
        \ }))
  call extend(groups, pgmnt#hi#group('Title', {
        \ 'guifg': c.prm0,
        \ 'guibg': 'NONE',
        \ 'gui': 'bold',
        \ }))
  call extend(groups, pgmnt#hi#group('Visual', {
        \ 'guibg': c.sub2,
        \ }))
  call extend(groups, pgmnt#hi#group('VisualNOS', {
        \ 'guibg': c.sub2,
        \ }))
  call extend(groups, pgmnt#hi#group('WarningMsg', {
        \ 'guifg': c.yellow1,
        \ 'gui': 'bold',
        \ }))
  call extend(groups, pgmnt#hi#group('Whitespace', {
        \ 'guifg': c.grey2,
        \ }))
  call add(links, pgmnt#hi#link('WildMenu', 'PmenuSel'))
  call extend(groups, pgmnt#hi#group('WinBar', {
        \ 'guifg': c.prm1,
        \ 'guibg': 'NONE',
        \ 'gui': 'NONE',
        \ }))
  call extend(groups, pgmnt#hi#group('WinBarNC', {
        \ 'guifg': c.prm1,
        \ 'guibg': 'NONE',
        \ 'gui': 'NONE',
        \ }))
  " }}}
  " syntax {{{
  call extend(groups, pgmnt#hi#group('Comment', {
        \ 'guifg': c.grey0,
        \ 'gui': 'italic',
        \ }))
  call extend(groups, pgmnt#hi#group('Constant', {
        \ 'guifg': c.cyan0,
        \ }))
  call extend(groups, pgmnt#hi#group('String', {
        \ 'guifg': c.green0,
        \ }))
  call add(links, pgmnt#hi#link('Character', 'String'))
  call extend(groups, pgmnt#hi#group('Number', {
        \ 'guifg': c.magenta0,
        \ }))
  call extend(groups, pgmnt#hi#group('Boolean', {
        \ 'guifg': c.magenta0,
        \ }))
  call add(links, pgmnt#hi#link('Float', 'Number'))
  call extend(groups, pgmnt#hi#group('Identifier', {
        \ 'guifg': c.blue0,
        \ }))
  call extend(groups, pgmnt#hi#group('Function', {
        \ 'guifg': c.green0,
        \ }))
  call extend(groups, pgmnt#hi#group('Statement', {
        \ 'guifg': c.red0,
        \ 'gui': 'italic',
        \ }))
  call extend(groups, pgmnt#hi#group('Conditional', {
        \ 'guifg': c.red0,
        \ }))
  call extend(groups, pgmnt#hi#group('Repeat', {
        \ 'guifg': c.red0,
        \ }))
  call extend(groups, pgmnt#hi#group('Label', {
        \ 'guifg': c.yellow0,
        \ }))
  call extend(groups, pgmnt#hi#group('Operator', {
        \ 'guifg': c.yellow0,
        \ }))
  call extend(groups, pgmnt#hi#group('Keyword', {
        \ 'guifg': c.red0,
        \ }))
  call extend(groups, pgmnt#hi#group('Exception', {
        \ 'guifg': c.red0,
        \ }))
  call extend(groups, pgmnt#hi#group('PreProc', {
        \ 'guifg': c.magenta0,
        \ }))
  call extend(groups, pgmnt#hi#group('Macro', {
        \ 'guifg': c.cyan0,
        \ }))
  call extend(groups, pgmnt#hi#group('Type', {
        \ 'guifg': c.yellow0,
        \ }))
  call extend(groups, pgmnt#hi#group('StorageClass', {
        \ 'guifg': c.yellow0,
        \ }))
  call extend(groups, pgmnt#hi#group('Structure', {
        \ 'guifg': c.yellow0,
        \ }))
  call extend(groups, pgmnt#hi#group('Special', {
        \ 'guifg': c.yellow0,
        \ }))
  call add(links, pgmnt#hi#link('SpecialChar', 'Special'))
  call extend(groups, pgmnt#hi#group('Tag', {
        \ 'guifg': c.yellow0,
        \ }))
  call extend(groups, pgmnt#hi#group('Delimiter', {
        \ 'guifg': c.prm0,
        \ }))
  call extend(groups, pgmnt#hi#group('SpecialComment', {
        \ 'guifg': c.grey1,
        \ 'gui': 'italic',
        \ }))
  call extend(groups, pgmnt#hi#group('Debug', {
        \ 'guifg': c.yellow0,
        \ }))
  call extend(groups, pgmnt#hi#group('Underlined', {
        \ 'gui': 'underline',
        \ }))
  call extend(groups, pgmnt#hi#group('Ignore', {
        \ 'guifg': c.grey1,
        \ }))
  call extend(groups, pgmnt#hi#group('Error', {
        \ 'guifg': c.red0,
        \ 'guibg': 'NONE',
        \ }))
  call extend(groups, pgmnt#hi#group('Todo', {
        \ 'guifg': c.magenta0,
        \ 'gui': 'italic',
        \ }))
  " }}}
  " diagnostics {{{
  call extend(groups, pgmnt#hi#group('DiagnosticError', {
        \ 'guifg': c.red0,
        \ }))
  call extend(groups, pgmnt#hi#group('DiagnosticWarn', {
        \ 'guifg': c.yellow0,
        \ }))
  call extend(groups, pgmnt#hi#group('DiagnosticInfo', {
        \ 'guifg': c.blue0,
        \ }))
  call extend(groups, pgmnt#hi#group('DiagnosticHint', {
        \ 'guifg': c.cyan0,
        \ }))
  call extend(groups, pgmnt#hi#group('DiagnosticOk', {
        \ 'guifg': c.green0,
        \ }))
  call extend(groups, pgmnt#hi#group('DiagnosticUnderlineError', {
        \ 'guifg': c.red1,
        \ 'gui': 'underline',
        \ }))
  call extend(groups, pgmnt#hi#group('DiagnosticUnderlineWarn', {
        \ 'guifg': c.yellow1,
        \ 'gui': 'underline',
        \ }))
  call extend(groups, pgmnt#hi#group('DiagnosticUnderlineInfo', {
        \ 'guifg': c.blue1,
        \ 'gui': 'underline',
        \ }))
  call extend(groups, pgmnt#hi#group('DiagnosticUnderlineHint', {
        \ 'guifg': c.cyan1,
        \ 'gui': 'underline',
        \ }))
  call extend(groups, pgmnt#hi#group('DiagnosticUnderlineOk', {
        \ 'guifg': c.green1,
        \ 'gui': 'underline',
        \ }))
  " }}}
  " treesitter (nvim) {{{
  " Identifier
  call extend(neovim_groups, pgmnt#hi#group('@variable', {
        \ 'guifg': c.prm0,
        \ }))
  call extend(neovim_groups, pgmnt#hi#group('@variable.builtin', {
        \ 'guifg': c.purple0,
        \ 'gui': 'italic',
        \ }))
  call extend(neovim_groups, pgmnt#hi#group('@variable.parameter', {
        \ 'guifg': c.magenta0,
        \ }))
  call add(neovim_links, pgmnt#hi#link('@variable.parameter.builtin', 'Special'))
  call add(neovim_links, pgmnt#hi#link('@constant', 'Constant'))
  call add(neovim_links, pgmnt#hi#link('@constant.builtin', 'Special'))
  call add(neovim_links, pgmnt#hi#link('@module', 'Structure'))
  call add(neovim_links, pgmnt#hi#link('@module.builtin', 'Structure'))
  call add(neovim_links, pgmnt#hi#link('@label', 'Label'))
  " Literals
  call add(neovim_links, pgmnt#hi#link('@string', 'String'))
  call extend(neovim_groups, pgmnt#hi#group('@string.regexp', {
        \ 'guifg': c.brown0,
        \ }))
  call extend(neovim_groups, pgmnt#hi#group('@string.escape', {
        \ 'guifg': c.brown0,
        \ 'gui': 'bold',
        \ }))
  call add(neovim_links, pgmnt#hi#link('@string.special', 'SpecialChar'))
  call extend(neovim_groups, pgmnt#hi#group('@string.special.symbol', {
        \ 'guifg': c.blue0,
        \ }))
  call extend(neovim_groups, pgmnt#hi#group('@string.special.url', {
        \ 'guifg': c.blue0,
        \ 'gui': 'undercurl',
        \ }))
  call add(neovim_links, pgmnt#hi#link('@character', 'Character'))
  call add(neovim_links, pgmnt#hi#link('@character.special', 'SpecialChar'))
  call add(neovim_links, pgmnt#hi#link('@boolean', 'Boolean'))
  call add(neovim_links, pgmnt#hi#link('@number', 'Number'))
  call add(neovim_links, pgmnt#hi#link('@number.float', 'Number'))
  " Types
  call add(neovim_links, pgmnt#hi#link('@type', 'Type'))
  call add(neovim_links, pgmnt#hi#link('@type.builtin', 'Special'))
  call add(neovim_links, pgmnt#hi#link('@attribute', 'Constant'))
  call add(neovim_links, pgmnt#hi#link('@attribute.builtin', 'Special'))
  call add(neovim_links, pgmnt#hi#link('@property', 'Identifier'))
  " Functions
  call add(neovim_links, pgmnt#hi#link('@function', 'Function'))
  call add(neovim_links, pgmnt#hi#link('@function.builtin', 'Special'))
  call extend(neovim_groups, pgmnt#hi#group('@constructor', {
        \ 'guifg': c.yellow0,
        \ }))
  call add(neovim_links, pgmnt#hi#link('@operator', 'Operator'))
  " Keywords
  call add(neovim_links, pgmnt#hi#link('@keyword', 'Keyword'))
  call extend(neovim_groups, pgmnt#hi#group('@keyword.operator', {
        \ 'guifg': c.yellow0,
        \ 'gui': 'bold',
        \ }))
  call add(neovim_links, pgmnt#hi#link('@keyword.import', 'PreProc'))
  " Punctuation
  call extend(neovim_groups, pgmnt#hi#group('@punctuation.delimiters', {
        \ 'guifg': c.magenta0,
        \ }))
  call extend(neovim_groups, pgmnt#hi#group('@punctuation.bracket', {
        \ 'guifg': c.magenta0,
        \ }))
  call extend(neovim_groups, pgmnt#hi#group('@punctuation.special', {
        \ 'guifg': c.magenta0,
        \ }))
  " Comments
  call add(neovim_links, pgmnt#hi#link('@comment', 'Comment'))
  call extend(neovim_groups, pgmnt#hi#group('@comment.error', {
        \ 'guifg': c.prm0,
        \ 'guibg': c.red2,
        \ 'gui': 'bold',
        \ }))
  call extend(neovim_groups, pgmnt#hi#group('@comment.warning', {
        \ 'guifg': c.prm0,
        \ 'guibg': c.yellow2,
        \ 'gui': 'bold',
        \ }))
  call add(neovim_links, pgmnt#hi#link('@comment.todo', 'Todo'))
  call extend(neovim_groups, pgmnt#hi#group('@comment.note', {
        \ 'guifg': c.prm0,
        \ 'guibg': c.blue2,
        \ 'gui': 'bold',
        \ }))
  " }}}

  " terminal {{{
  let quoted_term_colors = map(
        \ term_colors,
        \ '"''" . v:val . "''"')

  let neovim_term = map(
        \ copy(quoted_term_colors),
        \ '"let g:terminal_color_" . v:key . " = " . v:val')
  let vim_term = printf(
        \ 'let g:terminal_ansi_colors = [%s]',
        \ join(quoted_term_colors, ', '),
        \ )

  return {
        \ 'modified': strftime('%Y-%m-%d %H:%M%z'),
        \ 'groups': groups,
        \ 'neovim_groups': neovim_groups,
        \ 'neovim_links': neovim_links,
        \ 'links': links,
        \ 'neovim_term': neovim_term,
        \ 'vim_term': vim_term,
        \ }
endfunction
" }}}

call pgmnt#compile(s:create(), {
      \ 'output': expand('<sfile>:p:h') . '/../colors/sorairo.vim',
      \ 'template': expand('<sfile>:p:h') . '/template.vim'
      \ })
