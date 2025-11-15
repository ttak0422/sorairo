" build with pgmnt.vim (2025-11-15 23:09+0900)
if !has('gui_running') && &t_Co < 256
  finish
endif
hi clear
if exists('syntax_on')
  syntax reset
endif
set termguicolors
let g:colors_name = 'sorairo'
hi ColorColumn guibg=#f7f7fa
hi Conceal gui=bold guifg=#666666
hi Cursor gui=reverse guibg=NONE guifg=NONE
hi CursorLine cterm=NONE guibg=#f7f7fa
hi Directory guibg=NONE guifg=#6bb449
hi DiffAdd guibg=#6bb449 guifg=NONE
hi DiffChange guibg=#5ba8df guifg=NONE
hi DiffDelete gui=NONE guibg=#ec909a guifg=NONE
hi DiffText guibg=#6fa6b8 guifg=NONE
hi ErrorMsg gui=bold,underline guifg=#e9616f guisp=#e9616f
hi WinSeparator guifg=#bebebe
hi Folded guibg=NONE guifg=#666666
hi FoldColumn guibg=NONE guifg=#666666
hi SignColumn guifg=#545472
hi IncSearch guibg=#ac8f37 guifg=#fdfdff
hi LineNr guifg=#bebebe
hi CursorLineNr cterm=bold gui=bold guifg=#bebebe
hi MatchParen gui=bold guibg=#f7f7fa guifg=#a5a5a5
hi ModeMsg gui=bold guifg=#545472
hi MsgArea guifg=#a5a5a5
hi MoreMsg gui=bold guifg=#d5b042
hi NonText guifg=#7f7f7f
hi Normal guibg=#fdfdff guifg=#545472
hi NormalFloat guibg=#f7f7fa guifg=#545472
hi FloatTitle guifg=#e8862a
hi FloatFooter guifg=#a5a5a5
hi Pmenu gui=NONE guibg=#f7f7fa guifg=#545472
hi PmenuSel gui=bold guibg=#105b91 guifg=#fdfdff
hi PmenuSbar guibg=#d4d4df
hi PmenuThumb guibg=#666666
hi ComplMatchIns gui=bold
hi QuickFixLine gui=bold,underline guibg=NONE guifg=#545472 guisp=#545472
hi Search guibg=#0e80d1 guifg=#fdfdff
hi SpecialKey guifg=#bebebe
hi SpellBad gui=undercurl guifg=#e9616f guisp=#e9616f
hi SpellCap gui=undercurl guifg=#d5b042 guisp=#d5b042
hi SpellLocal gui=undercurl guifg=#4b8b9f guisp=#4b8b9f
hi SpellRare gui=undercurl guifg=#d1478c guisp=#d1478c
hi StatusLine cterm=NONE gui=NONE guibg=#f7f7fa guifg=#a5a5a5
hi StatusLineNC cterm=NONE gui=NONE guibg=#f7f7fa guifg=#868686
hi TabLine guibg=#f7f7fa guifg=#a5a5a5
hi TabLineFill guibg=#f7f7fa guifg=#a5a5a5
hi TabLineSel guibg=#d4d4df guifg=#868686
hi Title gui=bold guibg=NONE guifg=#545472
hi Visual guibg=#d4d4df
hi EndOfBuffer guifg=#fdfdff
hi WarningMsg gui=bold,underline guifg=#d5b042 guisp=#d5b042
hi Whitespace guifg=#7f7f7f
hi WinBar gui=bold guibg=NONE guifg=#a5a5a5
hi WinBarNC guibg=NONE guifg=#a5a5a5
hi Comment gui=italic guifg=#a5a5a5
hi Constant gui=bold guifg=#ac8f37
hi String guifg=#549536
hi Number guifg=#d1478c
hi Boolean guifg=#d1478c
hi Float guifg=#d1478c
hi Identifier guifg=#d1478c
hi Function guifg=#e8862a
hi Statement gui=italic guifg=#e9616f
hi Conditional guifg=#e9616f
hi Repeat guifg=#e9616f
hi Operator guifg=#d5b042
hi Keyword guifg=#e9616f
hi Exception guifg=#e9616f
hi PreProc guifg=#d1478c
hi Include guifg=#d1478c
hi Define guifg=#d1478c
hi Macro guifg=#4b8b9f
hi PreCondit guifg=#d1478c
hi Type guifg=#0e80d1
hi StorageClass guifg=#e8862a
hi Structure guifg=#d5b042
hi Typedef guifg=#e8862a
hi Special guifg=#d5b042
hi Delimiter guifg=#545472
hi SpecialComment gui=italic guifg=#666666
hi Debug guifg=#d5b042
hi Underlined gui=underline
hi Ignore guifg=#666666
hi Error guibg=NONE guifg=#d73445
hi Todo gui=italic guifg=#a6346d
hi LspReferenceText guibg=#b7671d guifg=#fdfdff
hi LspReferenceWrite gui=underline guibg=#b7671d guifg=#fdfdff
hi LspInlayHint guifg=#666666
hi DiagnosticError guifg=#d73445
hi DiagnosticWarn guifg=#ac8f37
hi DiagnosticInfo guifg=#105b91
hi DiagnosticHint guifg=#3d6b79
hi DiagnosticOk guifg=#3c622b
hi DiagnosticUnderlineError gui=undercurl guisp=#d73445
hi DiagnosticUnderlineWarn gui=undercurl guisp=#ac8f37
hi DiagnosticUnderlineInfo gui=undercurl guisp=#105b91
hi DiagnosticUnderlineHint gui=undercurl guisp=#3d6b79
hi DiagnosticUnderlineOk gui=undercurl guisp=#3c622b
hi DiagnosticDeprecated gui=strikethrough guifg=#d73445 guisp=#d73445
hi! link lCursor Cursor
hi! link CursorIM Cursor
hi! link CursorColumn CursorLine
hi! link TermCursor Cursor
hi! link VertSplit WinSeparator
hi! link Substitute Search
hi! link LineNrAbove LineNr
hi! link LineNrBelow LineNr
hi! link CursorLineFold FoldColumn
hi! link CursorLineSign SignColumn
hi! link MsgSeparator StatusLine
hi! link FloatBorder NormalFloat
hi! link NormalNC Normal
hi! link PmenuKind Pmenu
hi! link PmenuKindSel PmenuSel
hi! link PmenuExtra Pmenu
hi! link PmenuExtraSel PmenuSel
hi! link PmenuMatch Pmenu
hi! link PmenuMatchSel PmenuSel
hi! link Question MoreMsg
hi! link SnippetTabstop Visual
hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC
hi! link VisualNOS Visual
hi! link CurSearch IncSearch
hi! link WildMenu PmenuSel
hi! link TermCursorNC Cursor
hi! link Character String
hi! link Label Keyword
hi! link SpecialChar Special
hi! link Tag Special
hi! link Added DiffAdd
hi! link Changed DiffChange
hi! link Removed DiffDelete
hi! link LspReferenceRead LspReferenceText
hi! link LspReferenceTarget LspReferenceText
hi! link DiagnosticVirtualTextError DiagnosticError
hi! link DiagnosticVirtualTextWarn DiagnosticWarn
hi! link DiagnosticVirtualTextInfo DiagnosticInfo
hi! link DiagnosticVirtualTextHint DiagnosticHint
hi! link DiagnosticVirtualTextOk DiagnosticOk
hi! link DiagnosticVirtualLinesError DiagnosticError
hi! link DiagnosticVirtualLinesWarn DiagnosticWarn
hi! link DiagnosticVirtualLinesInfo DiagnosticInfo
hi! link DiagnosticVirtualLinesHint DiagnosticHint
hi! link DiagnosticVirtualLinesOk DiagnosticOk
hi! link DiagnosticFloatingError DiagnosticError
hi! link DiagnosticFloatingWarn DiagnosticWarn
hi! link DiagnosticFloatingInfo DiagnosticInfo
hi! link DiagnosticFloatingHint DiagnosticHint
hi! link DiagnosticFloatingOk DiagnosticOk
hi! link DiagnosticSignError DiagnosticError
hi! link DiagnosticSignWarn DiagnosticWarn
hi! link DiagnosticSignInfo DiagnosticInfo
hi! link DiagnosticSignHint DiagnosticHint
hi! link DiagnosticSignOk DiagnosticOk
hi! link DiagnosticUnnecessary DiagnosticUnderlineHint
if has('nvim')
  hi @variable guifg=#545472
  hi @variable.parameter guifg=#d1478c
  hi @variable.member gui=italic guifg=#545472
  hi @constant gui=bold guifg=#ac8f37
  hi @module guifg=#d674a5
  hi @string.regexp guifg=#b7671d
  hi @string.escape gui=bold guifg=#b7671d
  hi @string.special.symbol gui=bold guifg=#549536
  hi @string.special.path gui=underline guifg=#549536
  hi @attribute guifg=#4b8b9f
  hi @punctuation.delimiter guifg=#a6346d
  hi @punctuation.bracket guifg=#a6346d
  hi @comment.error guibg=#ec909a guifg=#fdfdff
  hi @comment.warning guibg=#d9bf70 guifg=#fdfdff
  hi @comment.todo guibg=#6fa6b8 guifg=#fdfdff
  hi @comment.note guibg=#5ba8df guifg=#fdfdff
  hi @markup.strong gui=bold
  hi @markup.italic gui=italic
  hi @markup.strikethrough gui=strikethrough
  hi @markup.heading.1.markdown gui=bold guifg=#105b91
  hi @markup.heading.2.markdown gui=bold guifg=#b7671d
  hi @markup.heading.3.markdown gui=bold guifg=#3c622b
  hi @markup.heading.4.markdown gui=bold guifg=#3d6b79
  hi @markup.heading.5.markdown gui=bold guifg=#a6346d
  hi @markup.heading.6.markdown gui=bold guifg=#8550a7
  hi @diff.plus gui=bold guifg=#6bb449
  hi @diff.minus gui=bold guifg=#ec909a
  hi @diff.delta gui=bold guifg=#5ba8df
  hi NotifyERRORBorder guifg=#d73445
  hi NotifyWARNBorder guifg=#ac8f37
  hi NotifyINFOBorder guifg=#105b91
  hi NotifyDEBUGBorder guifg=#3d6b79
  hi NotifyTRACEBorder guifg=#3d6b79
  hi NotifyERRORIcon guifg=#e9616f
  hi NotifyERRORTitle guifg=#e9616f
  hi NotifyWARNIcon guifg=#d5b042
  hi NotifyWARNTitle guifg=#d5b042
  hi NotifyINFOIcon guifg=#0e80d1
  hi NotifyINFOTitle guifg=#0e80d1
  hi NotifyDEBUGIcon guifg=#4b8b9f
  hi NotifyDEBUGTitle guifg=#4b8b9f
  hi NotifyTRACEIcon guifg=#4b8b9f
  hi NotifyTRACETitle guifg=#4b8b9f
  hi GitSignsAdd guibg=NONE guifg=#6bb449
  hi GitSignsChange guibg=NONE guifg=#5ba8df
  hi GitSignsDelete guibg=NONE guifg=#ec909a
  hi GitSignsAddInline gui=bold guibg=#6bb449 guifg=#ededed
  hi GitSignsChangeInline gui=bold guibg=#5ba8df guifg=#ededed
  hi GitSignsDeleteInline gui=bold guibg=#ec909a guifg=#ededed
  hi GitSignsAddPreview guibg=NONE guifg=#6bb449
  hi GitSignsDeletePreview guibg=NONE guifg=#ec909a
  hi! link @variable.builtin @variable
  hi! link @variable.parameter.builtin @variable.parameter
  hi! link @constant.builtin @constant
  hi! link @constant.macro @constant
  hi! link @module.builtin @module
  hi! link @label Label
  hi! link @label String
  hi! link @string.documentation Comment
  hi! link @string.special Special
  hi! link @string.special.url @string.special.path
  hi! link @character Character
  hi! link @character.special SpecialChar
  hi! link @boolean Boolean
  hi! link @number Number
  hi! link @number.float Number
  hi! link @type Type
  hi! link @type.builtin @type
  hi! link @type.definition @type
  hi! link @attribute.builtin @attribute
  hi! link @property @variable.member
  hi! link @function Function
  hi! link @function.builtin @function
  hi! link @constructor Identifier
  hi! link @operator Operator
  hi! link @keyword Keyword
  hi! link @keyword.operator Operator
  hi! link @keyword.import PreProc
  hi! link @keyword.repeat Repeat
  hi! link @keyword.exception Exception
  hi! link @keyword.conditional Conditional
  hi! link @keyword.conditional.ternary Conditional
  hi! link @punctuation.special Special
  hi! link @comment Comment
  hi! link @markup.underline Underlined
  hi! link @markup.heading Title
  hi! link @markup.quote Special
  hi! link @markup.math Special
  hi! link @markup.link.url Special
  hi! link @markup.raw String
  hi! link @tag Tag
  hi! link @tag.attribute @property
  hi! link @tag.delimiter Delimiter
  hi! link NotifyERRORBody Normal
  hi! link NotifyWARNBody Normal
  hi! link NotifyINFOBody Normal
  hi! link NotifyDEBUGBody Normal
  hi! link NotifyTRACEBody Normal
  let g:terminal_color_0 = '#545472'
  let g:terminal_color_1 = '#e9616f'
  let g:terminal_color_2 = '#549536'
  let g:terminal_color_3 = '#d5b042'
  let g:terminal_color_4 = '#0e80d1'
  let g:terminal_color_5 = '#a470c6'
  let g:terminal_color_6 = '#4b8b9f'
  let g:terminal_color_7 = '#dfdfe9'
  let g:terminal_color_8 = '#444467'
  let g:terminal_color_9 = '#eb4556'
  let g:terminal_color_10 = '#47862a'
  let g:terminal_color_11 = '#d5a927'
  let g:terminal_color_12 = '#0772be'
  let g:terminal_color_13 = '#9958c4'
  let g:terminal_color_14 = '#3d7e92'
  let g:terminal_color_15 = '#a5a5a5'
else
  let g:terminal_ansi_colors = ['#545472', '#e9616f', '#549536', '#d5b042', '#0e80d1', '#a470c6', '#4b8b9f', '#dfdfe9', '#444467', '#eb4556', '#47862a', '#d5a927', '#0772be', '#9958c4', '#3d7e92', '#a5a5a5']
endif
