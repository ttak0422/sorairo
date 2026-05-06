" build with pgmnt.vim (2026-05-07 00:27+0900)
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
  hi ColorColumn guibg=#2b3344
  hi Conceal gui=bold guifg=#979eaf
  hi Cursor gui=reverse guibg=NONE guifg=NONE
  hi CursorLine cterm=NONE guibg=#2b3344
  hi Directory guibg=NONE guifg=#82ccad
  hi DiffAdd gui=bold guibg=#314953 guifg=#82ccad
  hi DiffChange guibg=#2e4561 guifg=#7dbeec
  hi DiffDelete gui=strikethrough guibg=#48394d guifg=#eb8c96
  hi DiffText guibg=#6bb0c5 guifg=#222b40
  hi ErrorMsg gui=bold,underline guifg=#e47581 guisp=#e47581
  hi WinSeparator guifg=#b2b9ca
  hi Folded guibg=NONE guifg=#979eaf
  hi FoldColumn guibg=NONE guifg=#979eaf
  hi SignColumn guifg=#c4cbdd
  hi IncSearch guibg=#e2c362 guifg=#222b40
  hi LineNr guifg=#b2b9ca
  hi CursorLineNr cterm=bold gui=bold guifg=#b2b9ca
  hi MatchParen gui=bold guibg=#2b3344 guifg=#8e97ad
  hi ModeMsg gui=bold guifg=#c4cbdd
  hi MsgArea guifg=#8e97ad
  hi MoreMsg gui=bold guifg=#e4c975
  hi NonText guifg=#bbc0cd
  hi Normal guibg=#222b40 guifg=#c4cbdd
  hi NormalFloat guibg=#2b3344 guifg=#c4cbdd
  hi FloatTitle guifg=#e6a669
  hi FloatFooter guifg=#8e97ad
  hi Pmenu gui=NONE guibg=#2b3344 guifg=#c4cbdd
  hi PmenuSel gui=bold guibg=#4da5e4 guifg=#222b40
  hi PmenuSbar guibg=#343c4f
  hi PmenuThumb guibg=#979eaf
  hi ComplMatchIns gui=bold
  hi QuickFixLine gui=bold,underline guibg=NONE guifg=#c4cbdd guisp=#c4cbdd
  hi Search guibg=#61aee5 guifg=#222b40
  hi SpecialKey guifg=#b2b9ca
  hi SpellBad gui=undercurl guifg=#e47581 guisp=#e47581
  hi SpellCap gui=undercurl guifg=#e4c975 guisp=#e4c975
  hi SpellLocal gui=undercurl guifg=#7cb7c9 guisp=#7cb7c9
  hi SpellRare gui=undercurl guifg=#d782c2 guisp=#d782c2
  hi StatusLine cterm=NONE gui=NONE guibg=#2b3344 guifg=#8e97ad
  hi StatusLineNC cterm=NONE gui=NONE guibg=#2b3344 guifg=#6c758c
  hi TabLine guibg=#2b3344 guifg=#8e97ad
  hi TabLineFill guibg=#2b3344 guifg=#8e97ad
  hi TabLineSel guibg=#343c4f guifg=#6c758c
  hi Title gui=bold guibg=NONE guifg=#c4cbdd
  hi Visual guibg=#343c4f
  hi EndOfBuffer guifg=#222b40
  hi WarningMsg gui=bold,underline guifg=#e4c975 guisp=#e4c975
  hi Whitespace guifg=#bbc0cd
  hi WinBar gui=bold guibg=NONE guifg=#8e97ad
  hi WinBarNC guibg=NONE guifg=#8e97ad
  hi Comment gui=italic guifg=#8e97ad
  hi Constant gui=bold guifg=#e2c362
  hi String guifg=#70c19f
  hi Number guifg=#d782c2
  hi Boolean guifg=#d782c2
  hi Float guifg=#d782c2
  hi Identifier guifg=#d782c2
  hi Function guifg=#e6a669
  hi Statement gui=italic guifg=#e47581
  hi Conditional guifg=#e47581
  hi Repeat guifg=#e47581
  hi Operator guifg=#e4c975
  hi Keyword guifg=#e47581
  hi Exception guifg=#e47581
  hi PreProc guifg=#d782c2
  hi Include guifg=#d782c2
  hi Define guifg=#d782c2
  hi Macro guifg=#7cb7c9
  hi PreCondit guifg=#d782c2
  hi Type guifg=#61aee5
  hi StorageClass guifg=#e6a669
  hi Structure guifg=#e4c975
  hi Typedef guifg=#e6a669
  hi Special guifg=#e4c975
  hi Delimiter guifg=#c4cbdd
  hi SpecialComment gui=italic guifg=#979eaf
  hi Debug guifg=#e4c975
  hi Underlined gui=underline
  hi Ignore guifg=#979eaf
  hi Error guibg=NONE guifg=#e2626f
  hi Todo gui=italic guifg=#d370bb
  hi LspReferenceText guibg=#e59b55 guifg=#222b40
  hi LspReferenceWrite gui=underline guibg=#e59b55 guifg=#222b40
  hi LspInlayHint guifg=#979eaf
  hi DiagnosticError guifg=#e2626f
  hi DiagnosticWarn guifg=#e2c362
  hi DiagnosticInfo guifg=#4da5e4
  hi DiagnosticHint guifg=#6bb0c5
  hi DiagnosticOk guifg=#5fbd95
  hi DiagnosticUnderlineError gui=undercurl guisp=#e2626f
  hi DiagnosticUnderlineWarn gui=undercurl guisp=#e2c362
  hi DiagnosticUnderlineInfo gui=undercurl guisp=#4da5e4
  hi DiagnosticUnderlineHint gui=undercurl guisp=#6bb0c5
  hi DiagnosticUnderlineOk gui=undercurl guisp=#5fbd95
  hi DiagnosticDeprecated gui=strikethrough guifg=#e2626f guisp=#e2626f
else
  hi ColorColumn guibg=#f7f7fa
  hi Conceal gui=bold guifg=#666666
  hi Cursor gui=reverse guibg=NONE guifg=NONE
  hi CursorLine cterm=NONE guibg=#f7f7fa
  hi Directory guibg=NONE guifg=#49b487
  hi DiffAdd gui=bold guibg=#49b487 guifg=#2b624b
  hi DiffChange guibg=#5ba8df guifg=#105b91
  hi DiffDelete gui=strikethrough guibg=#ec909a guifg=#d73445
  hi DiffText guibg=#3d6b79 guifg=#fdfdff
  hi ErrorMsg gui=bold,underline guifg=#e9616f guisp=#e9616f
  hi WinSeparator guifg=#a9a9a9
  hi Folded guibg=NONE guifg=#666666
  hi FoldColumn guibg=NONE guifg=#666666
  hi SignColumn guifg=#3f4c5e
  hi IncSearch guibg=#ac8f37 guifg=#fdfdff
  hi LineNr guifg=#a9a9a9
  hi CursorLineNr cterm=bold gui=bold guifg=#a9a9a9
  hi MatchParen gui=bold guibg=#f7f7fa guifg=#8e9092
  hi ModeMsg gui=bold guifg=#3f4c5e
  hi MsgArea guifg=#8e9092
  hi MoreMsg gui=bold guifg=#d5b042
  hi NonText guifg=#7f7f7f
  hi Normal guibg=#fdfdff guifg=#3f4c5e
  hi NormalFloat guibg=#f7f7fa guifg=#3f4c5e
  hi FloatTitle guifg=#e8862a
  hi FloatFooter guifg=#8e9092
  hi Pmenu gui=NONE guibg=#f7f7fa guifg=#3f4c5e
  hi PmenuSel gui=bold guibg=#105b91 guifg=#fdfdff
  hi PmenuSbar guibg=#d4d4df
  hi PmenuThumb guibg=#666666
  hi ComplMatchIns gui=bold
  hi QuickFixLine gui=bold,underline guibg=NONE guifg=#3f4c5e guisp=#3f4c5e
  hi Search guibg=#0e80d1 guifg=#fdfdff
  hi SpecialKey guifg=#a9a9a9
  hi SpellBad gui=undercurl guifg=#e9616f guisp=#e9616f
  hi SpellCap gui=undercurl guifg=#d5b042 guisp=#d5b042
  hi SpellLocal gui=undercurl guifg=#4b8b9f guisp=#4b8b9f
  hi SpellRare gui=undercurl guifg=#d147ae guisp=#d147ae
  hi StatusLine cterm=NONE gui=NONE guibg=#f7f7fa guifg=#8e9092
  hi StatusLineNC cterm=NONE gui=NONE guibg=#f7f7fa guifg=#717171
  hi TabLine guibg=#f7f7fa guifg=#8e9092
  hi TabLineFill guibg=#f7f7fa guifg=#8e9092
  hi TabLineSel guibg=#d4d4df guifg=#717171
  hi Title gui=bold guibg=NONE guifg=#3f4c5e
  hi Visual guibg=#d4d4df
  hi EndOfBuffer guifg=#fdfdff
  hi WarningMsg gui=bold,underline guifg=#d5b042 guisp=#d5b042
  hi Whitespace guifg=#7f7f7f
  hi WinBar gui=bold guibg=NONE guifg=#8e9092
  hi WinBarNC guibg=NONE guifg=#8e9092
  hi Comment gui=italic guifg=#8e9092
  hi Constant gui=bold guifg=#ac8f37
  hi String guifg=#36956d
  hi Number guifg=#d147ae
  hi Boolean guifg=#d147ae
  hi Float guifg=#d147ae
  hi Identifier guifg=#d147ae
  hi Function guifg=#e8862a
  hi Statement gui=italic guifg=#e9616f
  hi Conditional guifg=#e9616f
  hi Repeat guifg=#e9616f
  hi Operator guifg=#d5b042
  hi Keyword guifg=#e9616f
  hi Exception guifg=#e9616f
  hi PreProc guifg=#d147ae
  hi Include guifg=#d147ae
  hi Define guifg=#d147ae
  hi Macro guifg=#4b8b9f
  hi PreCondit guifg=#d147ae
  hi Type guifg=#0e80d1
  hi StorageClass guifg=#e8862a
  hi Structure guifg=#d5b042
  hi Typedef guifg=#e8862a
  hi Special guifg=#d5b042
  hi Delimiter guifg=#3f4c5e
  hi SpecialComment gui=italic guifg=#666666
  hi Debug guifg=#d5b042
  hi Underlined gui=underline
  hi Ignore guifg=#666666
  hi Error guibg=NONE guifg=#d73445
  hi Todo gui=italic guifg=#a63489
  hi LspReferenceText guibg=#b7671d guifg=#fdfdff
  hi LspReferenceWrite gui=underline guibg=#b7671d guifg=#fdfdff
  hi LspInlayHint guifg=#666666
  hi DiagnosticError guifg=#d73445
  hi DiagnosticWarn guifg=#ac8f37
  hi DiagnosticInfo guifg=#105b91
  hi DiagnosticHint guifg=#3d6b79
  hi DiagnosticOk guifg=#2b624b
  hi DiagnosticUnderlineError gui=undercurl guisp=#d73445
  hi DiagnosticUnderlineWarn gui=undercurl guisp=#ac8f37
  hi DiagnosticUnderlineInfo gui=undercurl guisp=#105b91
  hi DiagnosticUnderlineHint gui=undercurl guisp=#3d6b79
  hi DiagnosticUnderlineOk gui=undercurl guisp=#2b624b
  hi DiagnosticDeprecated gui=strikethrough guifg=#d73445 guisp=#d73445
endif
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
  if &background ==# 'dark'
    hi @variable guifg=#c4cbdd
    hi @variable.parameter guifg=#d782c2
    hi @variable.member gui=italic guifg=#c4cbdd
    hi @constant gui=bold guifg=#e2c362
    hi @module guifg=#e097ce
    hi @string.regexp guifg=#e59b55
    hi @string.escape gui=bold guifg=#e59b55
    hi @string.special.symbol gui=bold guifg=#70c19f
    hi @string.special.path gui=underline guifg=#70c19f
    hi @attribute guifg=#7cb7c9
    hi @punctuation.delimiter guifg=#d370bb
    hi @punctuation.bracket guifg=#d370bb
    hi @comment.error guibg=#eb8c96 guifg=#222b40
    hi @comment.warning guibg=#ebd48c guifg=#222b40
    hi @comment.todo guibg=#7cb7c9 guifg=#222b40
    hi @comment.note guibg=#7dbeec guifg=#222b40
    hi @markup.strong gui=bold
    hi @markup.italic gui=italic
    hi @markup.strikethrough gui=strikethrough
    hi @markup.heading.1.markdown gui=bold guifg=#4da5e4
    hi @markup.heading.2.markdown gui=bold guifg=#e59b55
    hi @markup.heading.3.markdown gui=bold guifg=#5fbd95
    hi @markup.heading.4.markdown gui=bold guifg=#6bb0c5
    hi @markup.heading.5.markdown gui=bold guifg=#d370bb
    hi @markup.heading.6.markdown gui=bold guifg=#a57fd0
    hi @diff.plus gui=bold guifg=#82ccad
    hi @diff.minus gui=bold guifg=#eb8c96
    hi @diff.delta gui=bold guifg=#7dbeec
    hi NotifyERRORBorder guifg=#e2626f
    hi NotifyWARNBorder guifg=#e2c362
    hi NotifyINFOBorder guifg=#4da5e4
    hi NotifyDEBUGBorder guifg=#6bb0c5
    hi NotifyTRACEBorder guifg=#6bb0c5
    hi NotifyERRORIcon guifg=#e47581
    hi NotifyERRORTitle guifg=#e47581
    hi NotifyWARNIcon guifg=#e4c975
    hi NotifyWARNTitle guifg=#e4c975
    hi NotifyINFOIcon guifg=#61aee5
    hi NotifyINFOTitle guifg=#61aee5
    hi NotifyDEBUGIcon guifg=#7cb7c9
    hi NotifyDEBUGTitle guifg=#7cb7c9
    hi NotifyTRACEIcon guifg=#7cb7c9
    hi NotifyTRACETitle guifg=#7cb7c9
    hi GitSignsAdd gui=bold guibg=NONE guifg=#82ccad
    hi GitSignsChange gui=bold guibg=NONE guifg=#7dbeec
    hi GitSignsDelete gui=bold guibg=NONE guifg=#eb8c96
    hi GitSignsAddInline gui=bold guibg=#82ccad guifg=#222b40
    hi GitSignsChangeInline gui=bold guibg=#7dbeec guifg=#222b40
    hi GitSignsDeleteInline gui=bold guibg=#eb8c96 guifg=#222b40
    hi GitSignsAddPreview guibg=NONE guifg=#82ccad
    hi GitSignsDeletePreview guibg=NONE guifg=#eb8c96
  else
    hi @variable guifg=#3f4c5e
    hi @variable.parameter guifg=#d147ae
    hi @variable.member gui=italic guifg=#3f4c5e
    hi @constant gui=bold guifg=#ac8f37
    hi @module guifg=#d674bd
    hi @string.regexp guifg=#b7671d
    hi @string.escape gui=bold guifg=#b7671d
    hi @string.special.symbol gui=bold guifg=#36956d
    hi @string.special.path gui=underline guifg=#36956d
    hi @attribute guifg=#4b8b9f
    hi @punctuation.delimiter guifg=#a63489
    hi @punctuation.bracket guifg=#a63489
    hi @comment.error guibg=#ec909a guifg=#fdfdff
    hi @comment.warning guibg=#d9bf70 guifg=#fdfdff
    hi @comment.todo guibg=#4b8b9f guifg=#fdfdff
    hi @comment.note guibg=#5ba8df guifg=#fdfdff
    hi @markup.strong gui=bold
    hi @markup.italic gui=italic
    hi @markup.strikethrough gui=strikethrough
    hi @markup.heading.1.markdown gui=bold guifg=#105b91
    hi @markup.heading.2.markdown gui=bold guifg=#b7671d
    hi @markup.heading.3.markdown gui=bold guifg=#2b624b
    hi @markup.heading.4.markdown gui=bold guifg=#3d6b79
    hi @markup.heading.5.markdown gui=bold guifg=#a63489
    hi @markup.heading.6.markdown gui=bold guifg=#7950a7
    hi @diff.plus gui=bold guifg=#49b487
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
    hi GitSignsAdd gui=bold guibg=NONE guifg=#49b487
    hi GitSignsChange gui=bold guibg=NONE guifg=#5ba8df
    hi GitSignsDelete gui=bold guibg=NONE guifg=#ec909a
    hi GitSignsAddInline gui=bold guibg=#49b487 guifg=#ededed
    hi GitSignsChangeInline gui=bold guibg=#5ba8df guifg=#ededed
    hi GitSignsDeleteInline gui=bold guibg=#ec909a guifg=#ededed
    hi GitSignsAddPreview guibg=NONE guifg=#49b487
    hi GitSignsDeletePreview guibg=NONE guifg=#ec909a
  endif
  hi! link DiffTextAdd DiffText
  hi! link OkMsg MoreMsg
  hi! link StderrMsg ErrorMsg
  hi! link StdoutMsg MsgArea
  hi! link FloatShadow NormalFloat
  hi! link FloatShadowThrough NormalFloat
  hi! link PmenuBorder Pmenu
  hi! link PmenuShadow Pmenu
  hi! link PmenuShadowThrough Pmenu
  hi! link PreInsert ComplMatchIns
  hi! link ComplHint Comment
  hi! link ComplHintMore MoreMsg
  hi! link SnippetTabstopActive Visual
  hi! link LspCodeLens LspInlayHint
  hi! link LspCodeLensSeparator LspInlayHint
  hi! link LspSignatureActiveParameter Visual
  hi! link @variable.builtin @variable
  hi! link @variable.parameter.builtin @variable.parameter
  hi! link @constant.builtin @constant
  hi! link @constant.macro @constant
  hi! link @module.builtin @module
  hi! link @label Label
  hi! link @string String
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
  hi! link @function.call @function
  hi! link @function.macro Macro
  hi! link @function.method @function
  hi! link @function.method.call @function.method
  hi! link @constructor Identifier
  hi! link @operator Operator
  hi! link @keyword Keyword
  hi! link @keyword.coroutine @keyword
  hi! link @keyword.function @keyword
  hi! link @keyword.operator Operator
  hi! link @keyword.import PreProc
  hi! link @keyword.type Structure
  hi! link @keyword.modifier StorageClass
  hi! link @keyword.repeat Repeat
  hi! link @keyword.return @keyword
  hi! link @keyword.debug Debug
  hi! link @keyword.exception Exception
  hi! link @keyword.conditional Conditional
  hi! link @keyword.conditional.ternary Conditional
  hi! link @keyword.directive PreProc
  hi! link @keyword.directive.define Define
  hi! link @punctuation.special Special
  hi! link @comment Comment
  hi! link @comment.documentation SpecialComment
  hi! link @markup.underline Underlined
  hi! link @markup.heading Title
  hi! link @markup.heading.1 @markup.heading.1.markdown
  hi! link @markup.heading.2 @markup.heading.2.markdown
  hi! link @markup.heading.3 @markup.heading.3.markdown
  hi! link @markup.heading.4 @markup.heading.4.markdown
  hi! link @markup.heading.5 @markup.heading.5.markdown
  hi! link @markup.heading.6 @markup.heading.6.markdown
  hi! link @markup.quote Special
  hi! link @markup.math Special
  hi! link @markup.link Underlined
  hi! link @markup.link.label Special
  hi! link @markup.link.url Special
  hi! link @markup.raw String
  hi! link @markup.raw.block @markup.raw
  hi! link @markup.list Special
  hi! link @markup.list.checked @markup.list
  hi! link @markup.list.unchecked @markup.list
  hi! link @tag Tag
  hi! link @tag.builtin @tag
  hi! link @tag.attribute @property
  hi! link @tag.delimiter Delimiter
  hi! link @lsp.type.class Type
  hi! link @lsp.type.comment Comment
  hi! link @lsp.type.decorator @attribute
  hi! link @lsp.type.enum Type
  hi! link @lsp.type.enumMember Constant
  hi! link @lsp.type.event Identifier
  hi! link @lsp.type.function Function
  hi! link @lsp.type.interface Type
  hi! link @lsp.type.keyword Keyword
  hi! link @lsp.type.macro Macro
  hi! link @lsp.type.method Function
  hi! link @lsp.type.modifier StorageClass
  hi! link @lsp.type.namespace @module
  hi! link @lsp.type.number Number
  hi! link @lsp.type.operator Operator
  hi! link @lsp.type.parameter @variable.parameter
  hi! link @lsp.type.property @property
  hi! link @lsp.type.regexp @string.regexp
  hi! link @lsp.type.string String
  hi! link @lsp.type.struct Structure
  hi! link @lsp.type.type Type
  hi! link @lsp.type.typeParameter Type
  hi! link @lsp.type.variable @variable
  hi! link @lsp.mod.abstract StorageClass
  hi! link @lsp.mod.async @keyword.coroutine
  hi! link @lsp.mod.declaration @lsp.mod.definition
  hi! link @lsp.mod.defaultLibrary @variable.builtin
  hi! link @lsp.mod.definition Identifier
  hi! link @lsp.mod.deprecated DiagnosticDeprecated
  hi! link @lsp.mod.documentation SpecialComment
  hi! link @lsp.mod.modification Identifier
  hi! link @lsp.mod.readonly Constant
  hi! link @lsp.mod.static StorageClass
  hi! link NotifyERRORBody Normal
  hi! link NotifyWARNBody Normal
  hi! link NotifyINFOBody Normal
  hi! link NotifyDEBUGBody Normal
  hi! link NotifyTRACEBody Normal
  if &background ==# 'dark'
    let g:terminal_color_0 = '#8e97ad'
    let g:terminal_color_1 = '#e47581'
    let g:terminal_color_2 = '#70c19f'
    let g:terminal_color_3 = '#e4c975'
    let g:terminal_color_4 = '#61aee5'
    let g:terminal_color_5 = '#b090d4'
    let g:terminal_color_6 = '#7cb7c9'
    let g:terminal_color_7 = '#c4cbdd'
    let g:terminal_color_8 = '#979eaf'
    let g:terminal_color_9 = '#eb8c96'
    let g:terminal_color_10 = '#82ccad'
    let g:terminal_color_11 = '#ebd48c'
    let g:terminal_color_12 = '#7dbeec'
    let g:terminal_color_13 = '#bfa4de'
    let g:terminal_color_14 = '#8fc4d4'
    let g:terminal_color_15 = '#dfe3eb'
  else
    let g:terminal_color_0 = '#3f4c5e'
    let g:terminal_color_1 = '#e9616f'
    let g:terminal_color_2 = '#36956d'
    let g:terminal_color_3 = '#d5b042'
    let g:terminal_color_4 = '#0e80d1'
    let g:terminal_color_5 = '#9870c6'
    let g:terminal_color_6 = '#4b8b9f'
    let g:terminal_color_7 = '#666666'
    let g:terminal_color_8 = '#313f52'
    let g:terminal_color_9 = '#eb4556'
    let g:terminal_color_10 = '#2a8660'
    let g:terminal_color_11 = '#d5a927'
    let g:terminal_color_12 = '#0772be'
    let g:terminal_color_13 = '#8a58c4'
    let g:terminal_color_14 = '#3d7e92'
    let g:terminal_color_15 = '#8e9092'
  endif
else
  if &background ==# 'dark'
    let g:terminal_ansi_colors = ['#8e97ad', '#e47581', '#70c19f', '#e4c975', '#61aee5', '#b090d4', '#7cb7c9', '#c4cbdd', '#979eaf', '#eb8c96', '#82ccad', '#ebd48c', '#7dbeec', '#bfa4de', '#8fc4d4', '#dfe3eb']
  else
    let g:terminal_ansi_colors = ['#3f4c5e', '#e9616f', '#36956d', '#d5b042', '#0e80d1', '#9870c6', '#4b8b9f', '#666666', '#313f52', '#eb4556', '#2a8660', '#d5a927', '#0772be', '#8a58c4', '#3d7e92', '#8e9092']
  endif
endif

command! SorairoPreview call sorairo#preview#open()
