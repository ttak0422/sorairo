function! s:add_group(group) abort
  if !hlexists(a:group)
    return
  endif

  let id = synIDtrans(hlID(a:group))
  let fg = empty(synIDattr(id, 'fg#')) ? 'NONE' : synIDattr(id, 'fg#')
  let bg = empty(synIDattr(id, 'bg#')) ? 'NONE' : synIDattr(id, 'bg#')

  let line = printf('%-36s fg=%-9s bg=%-9s sample text 0123 TODO FIXME', a:group, fg, bg)
  let sample_start = stridx(line, 'sample text') + 1
  let lnum = line('$') + 1
  call append('$', line)
  call matchaddpos(a:group, [[lnum, 1, strlen(a:group)]])
  call matchaddpos(a:group, [[lnum, sample_start, strlen('sample text 0123 TODO FIXME')]])
endfunction

function! s:add_section(title, groups) abort
  call append('$', ['', a:title])
  let lnum = line('$')
  call matchaddpos('Title', [[lnum, 1, strlen(a:title)]])

  for group in a:groups
    call s:add_group(group)
  endfor
endfunction

function! s:terminal_colors() abort
  let colors = []

  if has('nvim')
    for index in range(0, 15)
      let color = get(g:, 'terminal_color_' . index, '')
      if color ==# ''
        return []
      endif
      call add(colors, color)
    endfor
    return colors
  endif

  return get(g:, 'terminal_ansi_colors', [])
endfunction

function! s:readable_text_color(bg) abort
  if a:bg !~# '^#[0-9A-Fa-f]\{6}$'
    return 'NONE'
  endif

  let red = str2nr(a:bg[1:2], 16)
  let green = str2nr(a:bg[3:4], 16)
  let blue = str2nr(a:bg[5:6], 16)
  let luminance = (red * 299 + green * 587 + blue * 114) / 1000

  return luminance > 140 ? '#545472' : '#fdfdff'
endfunction

function! s:add_terminal_section() abort
  let colors = s:terminal_colors()
  if empty(colors)
    return
  endif

  call append('$', ['', 'Terminal Colors'])
  let lnum = line('$')
  call matchaddpos('Title', [[lnum, 1, 15]])

  for index in range(0, len(colors) - 1)
    let color = colors[index]
    let fg_group = 'SorairoPreviewTerm' . index
    let bg_group = 'SorairoPreviewTermBg' . index
    let text_color = s:readable_text_color(color)
    execute 'highlight' fg_group 'guifg=' . color 'guibg=NONE'
    execute 'highlight' bg_group 'guifg=' . text_color 'guibg=' . color

    let line = printf('%-36s %-10s foreground sample    background sample', 'terminal_color_' . index, color)
    let foreground_start = stridx(line, 'foreground sample') + 1
    let background_start = stridx(line, 'background sample') + 1
    let lnum = line('$') + 1
    call append('$', line)
    call matchaddpos(fg_group, [[lnum, 1, foreground_start + strlen('foreground sample') - 1]])
    call matchaddpos(bg_group, [[lnum, background_start, strlen('background sample')]])
  endfor
endfunction

function! sorairo#preview#open() abort
  enew
  setlocal buftype=nofile
  setlocal bufhidden=wipe
  setlocal noswapfile
  setlocal nobuflisted
  setlocal nowrap
  setlocal nonumber
  setlocal norelativenumber
  setlocal signcolumn=no
  setlocal foldcolumn=0
  setlocal filetype=sorairo-preview
  silent %delete _

  call append(0, 'sorairo highlight preview')
  call matchaddpos('Title', [[1, 1, 25]])

  call s:add_section('Editor', [
        \ 'Normal',
        \ 'Comment',
        \ 'Constant',
        \ 'String',
        \ 'Number',
        \ 'Identifier',
        \ 'Function',
        \ 'Statement',
        \ 'Keyword',
        \ 'Type',
        \ 'Special',
        \ 'Delimiter',
        \ 'Todo',
        \ 'Visual',
        \ 'Search',
        \ 'IncSearch',
        \ 'Pmenu',
        \ 'PmenuSel',
        \ 'PmenuMatch',
        \ 'PmenuMatchSel',
        \ 'NormalFloat',
        \ 'FloatBorder',
        \ 'FloatTitle',
        \ 'FloatFooter',
        \ ])

  call s:add_section('Diff and Diagnostics', [
        \ 'DiffAdd',
        \ 'DiffChange',
        \ 'DiffDelete',
        \ 'DiffText',
        \ 'Added',
        \ 'Changed',
        \ 'Removed',
        \ 'DiagnosticError',
        \ 'DiagnosticWarn',
        \ 'DiagnosticInfo',
        \ 'DiagnosticHint',
        \ 'DiagnosticOk',
        \ 'DiagnosticDeprecated',
        \ ])

  call s:add_terminal_section()

  if has('nvim')
    call s:add_section('Neovim UI and LSP', [
          \ 'DiffTextAdd',
          \ 'OkMsg',
          \ 'StderrMsg',
          \ 'StdoutMsg',
          \ 'FloatShadow',
          \ 'FloatShadowThrough',
          \ 'PmenuBorder',
          \ 'PmenuShadow',
          \ 'PmenuShadowThrough',
          \ 'PreInsert',
          \ 'ComplHint',
          \ 'ComplHintMore',
          \ 'SnippetTabstopActive',
          \ 'LspInlayHint',
          \ 'LspCodeLens',
          \ 'LspCodeLensSeparator',
          \ 'LspSignatureActiveParameter',
          \ ])

    call s:add_section('Treesitter', [
          \ '@variable',
          \ '@variable.builtin',
          \ '@variable.parameter',
          \ '@variable.member',
          \ '@constant',
          \ '@module',
          \ '@string',
          \ '@string.documentation',
          \ '@string.regexp',
          \ '@string.escape',
          \ '@string.special',
          \ '@string.special.symbol',
          \ '@string.special.path',
          \ '@function',
          \ '@function.call',
          \ '@function.macro',
          \ '@function.method',
          \ '@constructor',
          \ '@keyword',
          \ '@keyword.function',
          \ '@keyword.return',
          \ '@keyword.directive',
          \ '@punctuation.delimiter',
          \ '@punctuation.bracket',
          \ '@comment',
          \ '@comment.documentation',
          \ '@comment.error',
          \ '@comment.warning',
          \ '@comment.todo',
          \ '@comment.note',
          \ '@markup.heading',
          \ '@markup.heading.1',
          \ '@markup.heading.2',
          \ '@markup.link',
          \ '@markup.link.url',
          \ '@markup.raw',
          \ '@markup.list',
          \ '@diff.plus',
          \ '@diff.minus',
          \ '@diff.delta',
          \ '@tag',
          \ '@tag.attribute',
          \ ])

    call s:add_section('LSP Semantic Tokens', [
          \ '@lsp.type.class',
          \ '@lsp.type.comment',
          \ '@lsp.type.decorator',
          \ '@lsp.type.enum',
          \ '@lsp.type.enumMember',
          \ '@lsp.type.function',
          \ '@lsp.type.interface',
          \ '@lsp.type.keyword',
          \ '@lsp.type.macro',
          \ '@lsp.type.method',
          \ '@lsp.type.namespace',
          \ '@lsp.type.parameter',
          \ '@lsp.type.property',
          \ '@lsp.type.struct',
          \ '@lsp.type.type',
          \ '@lsp.type.variable',
          \ '@lsp.mod.defaultLibrary',
          \ '@lsp.mod.deprecated',
          \ '@lsp.mod.readonly',
          \ '@lsp.mod.static',
          \ ])
  endif

  normal! gg
endfunction
