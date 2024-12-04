" build with pgmnt.vim (2024-12-04 23:55+0900)
if !has('gui_running') && &t_Co < 256
  finish
endif
hi clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name = 'sorairo'
hi ColorColumn guibg=#f1f1f3
hi Conceal gui=bold guifg=#777777
hi Cursor gui=reverse guibg=NONE guifg=NONE
hi CursorLine cterm=NONE guibg=#f1f1f3
hi Directory guifg=#359735
hi DiffAdd gui=NONE guibg=#fdfdff guifg=#4ddb4d
hi DiffChange gui=NONE guibg=#fdfdff guifg=#26a0fe
hi DiffDelete gui=NONE guibg=#fdfdff guifg=#fd5252
hi DiffText gui=NONE guibg=#fdfdff guifg=#87ceeb
hi EndOfBuffer guifg=#fdfdff
hi TermCursorNC guibg=NONE guifg=NONE
hi ErrorMsg gui=bold,underline guifg=#ec4d4d
hi WinSeparator guibg=NONE guifg=#e4e4e6
hi Folded guibg=NONE guifg=#777777
hi FoldColumn guibg=NONE guifg=#777777
hi SignColumn guifg=#555573
hi Search guibg=#26a0fe guifg=#fdfdff
hi IncSearch guibg=#ffdf64 guifg=#666666
hi LineNr guifg=#888888
hi CursorLineNr cterm=NONE guifg=#777777
hi MatchParen gui=bold guibg=#e4e4e6
hi ModeMsg gui=bold guifg=#555573
hi MsgSeparator guibg=#e4e4e6
hi MoreMsg gui=bold guifg=#eccb65
hi NonText guifg=#888888
hi Normal guibg=#fdfdff guifg=#555573
hi NormalFloat guibg=#f1f1f3 guifg=#555573
hi FloatTitle gui=bold guibg=#f1f1f3 guifg=#1d79c0
hi FloatFooter guibg=#f1f1f3 guifg=#218bdd
hi Pmenu guibg=#f1f1f3 guifg=#73739b
hi PmenuSel guibg=#218bdd guifg=#fdfdff
hi PmenuSbar guibg=#e4e4e6
hi PmenuThumb guibg=#888888
hi QuickFixLine guibg=#f1f1f3 guifg=#cc5490
hi SpecialKey guifg=#73739b
hi SpellBad gui=undercurl guifg=#ec4d4d guisp=#ec4d4d
hi SpellCap gui=undercurl guifg=#218bdd guisp=#218bdd
hi SpellLocal gui=undercurl guifg=#6ca5bc guisp=#6ca5bc
hi SpellRare gui=undercurl guifg=#cc5490 guisp=#cc5490
hi StatusLine guibg=#f1f1f3 guifg=#666666
hi StatusLineNC guibg=#f1f1f3 guifg=#888888
hi TabLine guibg=#f1f1f3 guifg=#73739b
hi TablineFill guibg=#f1f1f3 guifg=#73739b
hi TabLineSel gui=bold guibg=#fdfdff guifg=#555573
hi Title gui=bold guibg=NONE guifg=#555573
hi Visual guibg=#e4e4e6
hi VisualNOS guibg=#e4e4e6
hi WarningMsg gui=bold guifg=#eccb65
hi Whitespace guifg=#888888
hi WinBar gui=NONE guibg=NONE guifg=#73739b
hi WinBarNC gui=NONE guibg=NONE guifg=#73739b
hi Comment gui=italic guifg=#666666
hi Constant guifg=#568496
hi String guifg=#359735
hi Number guifg=#b14a7c
hi Boolean guifg=#b14a7c
hi Identifier guifg=#1d79c0
hi Function guifg=#359735
hi Statement gui=italic guifg=#dd4848
hi Conditional guifg=#dd4848
hi Repeat guifg=#dd4848
hi Label guifg=#d7ba5c
hi Operator guifg=#d7ba5c
hi Keyword guifg=#dd4848
hi Exception guifg=#dd4848
hi PreProc guifg=#b14a7c
hi Macro guifg=#568496
hi Type guifg=#d7ba5c
hi StorageClass guifg=#d7ba5c
hi Structure guifg=#d7ba5c
hi Special guifg=#d7ba5c
hi Tag guifg=#d7ba5c
hi Delimiter guifg=#555573
hi SpecialComment gui=italic guifg=#777777
hi Debug guifg=#d7ba5c
hi Underlined gui=underline
hi Ignore guifg=#777777
hi Error guibg=NONE guifg=#dd4848
hi Todo gui=italic guifg=#b14a7c
hi DiagnosticError guifg=#dd4848
hi DiagnosticWarn guifg=#d7ba5c
hi DiagnosticInfo guifg=#1d79c0
hi DiagnosticHint guifg=#568496
hi DiagnosticOk guifg=#359735
hi DiagnosticUnderlineError gui=underline guifg=#ec4d4d
hi DiagnosticUnderlineWarn gui=underline guifg=#eccb65
hi DiagnosticUnderlineInfo gui=underline guifg=#218bdd
hi DiagnosticUnderlineHint gui=underline guifg=#6ca5bc
hi DiagnosticUnderlineOk gui=underline guifg=#42b042
hi! link lCursor Cursor
hi! link CursorIM Cursor
hi! link CursorColumn CursorLine
hi! link Added DiffAdd
hi! link Changed DiffChanged
hi! link Removed DiffDelete
hi! link TermCursor Cursor
hi! link CurSearch IncSearch
hi! link Substitute Search
hi! link NormalNC Normal
hi! link Question MoreMsg
hi! link WildMenu PmenuSel
hi! link Character String
hi! link Float Number
hi! link SpecialChar Special
if has('nvim')
  hi @variable guifg=#555573
  hi @variable.builtin gui=italic guifg=#901dd8
  hi @variable.parameter guifg=#b14a7c
  hi @string.regexp guifg=#b85830
  hi @string.escape gui=bold guifg=#b85830
  hi @string.special.symbol guifg=#1d79c0
  hi @string.special.url gui=undercurl guifg=#1d79c0
  hi @constructor guifg=#d7ba5c
  hi @keyword.operator gui=bold guifg=#d7ba5c
  hi @punctuation.delimiters guifg=#b14a7c
  hi @punctuation.bracket guifg=#b14a7c
  hi @punctuation.special guifg=#b14a7c
  hi @comment.error gui=bold guibg=#fd5252 guifg=#555573
  hi @comment.warning gui=bold guibg=#ffdf64 guifg=#555573
  hi @comment.note gui=bold guibg=#26a0fe guifg=#555573
  hi! link @variable.parameter.builtin Special
  hi! link @constant Constant
  hi! link @constant.builtin Special
  hi! link @module Structure
  hi! link @module.builtin Structure
  hi! link @label Label
  hi! link @string String
  hi! link @string.special SpecialChar
  hi! link @character Character
  hi! link @character.special SpecialChar
  hi! link @boolean Boolean
  hi! link @number Number
  hi! link @number.float Number
  hi! link @type Type
  hi! link @type.builtin Special
  hi! link @attribute Constant
  hi! link @attribute.builtin Special
  hi! link @property Identifier
  hi! link @function Function
  hi! link @function.builtin Special
  hi! link @operator Operator
  hi! link @keyword Keyword
  hi! link @keyword.import PreProc
  hi! link @comment Comment
  hi! link @comment.todo Todo
  let g:terminal_color_0 = '#fdfdff'
  let g:terminal_color_1 = '#ec4d4d'
  let g:terminal_color_2 = '#42b042'
  let g:terminal_color_3 = '#eccb65'
  let g:terminal_color_4 = '#218bdd'
  let g:terminal_color_5 = '#cc5490'
  let g:terminal_color_6 = '#6ca5bc'
  let g:terminal_color_7 = '#555573'
  let g:terminal_color_8 = '#777777'
  let g:terminal_color_9 = '#dd4848'
  let g:terminal_color_10 = '#359735'
  let g:terminal_color_11 = '#d7ba5c'
  let g:terminal_color_12 = '#1d79c0'
  let g:terminal_color_13 = '#b14a7c'
  let g:terminal_color_14 = '#568496'
  let g:terminal_color_15 = '#73739b'
else
  let g:terminal_ansi_colors = ['#fdfdff', '#ec4d4d', '#42b042', '#eccb65', '#218bdd', '#cc5490', '#6ca5bc', '#555573', '#777777', '#dd4848', '#359735', '#d7ba5c', '#1d79c0', '#b14a7c', '#568496', '#73739b']
endif
