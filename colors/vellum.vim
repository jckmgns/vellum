" --------------------------------
" Name: Vellum
" Description: Monochromatic light theme
" Author: Jack Magnus
" Email: vellum@jackmagnus.cc
" Source: https://github.com/jckmgns/vellum
" License: MIT
" --------------------------------

" Support code
" --------------------------------

" Initialization: {{{

highlight clear

if exists("syntax_on")
  syntax reset
endif

if !(has('termguicolors') && &termguicolors) && !has('gui_running')
  finish
endif

set t_8f=\e[38;2;%lu;%lu;%lum
set t_8b=\e[48;2;%lu;%lu;%lum

let g:colors_name = 'vellum'

" }}}
" Link Function: {{{

" Arguments: from-group, to-group
function! s:Li(from, to)
  execute 'hi! link ' . a:from . ' ' . a:to
endfunction

" }}}
" Highlight Function: {{{

" Arguments: group, guifg, guibg, gui, guisp
function! s:Hl(group, ...)
  let fg = s:none " foreground color
  let bg = s:none " background color
  let special = s:none " special attributes

  if a:0 >= 1
    let fg = a:1
  endif

  if a:0 >= 2
    let bg = a:2
  endif

  if a:0 >= 3
    let special = a:3
  endif

  let histring = [ 'hi',
        \ a:group,
        \ 'guifg=' . fg,
        \ 'guibg=' . bg,
        \ 'gui=' . special
        \ ]

  " special color
  if a:0 >= 4
    call add(histring, 'guisp=' . a:4)
  endif

  execute join(histring, ' ')
endfunction

" }}}

" General definitions
" --------------------------------

" Palette: {{{

let s:c0 = '#f7efee'
let s:c1 = '#e4dddc'
let s:c2 = '#b6b1b0'
let s:c3 = '#7b7777'
let s:c4 = '#403d3d'
let s:c5 = '#121111'

let s:bg0 = s:c0
let s:bg1 = s:c1
let s:bg2 = s:c2
let s:fg2 = s:c3
let s:fg1 = s:c4
let s:fg0 = s:c5

let s:red = '#9f4847'
let s:gre = '#7A6B24'
let s:yel = '#bf7d42'
let s:blu = '#3a6d77'
let s:mag = '#A6627F'
let s:cya = '#6a8f6c'

" ---------------

" }}}
" Utility: {{{

let s:none = 'NONE'

" }}}

" Global definitions
" --------------------------------

" Editor settings: {{{
"
call s:Hl('Normal', s:fg0, s:bg0)
call s:Hl('Cursor', s:none, s:none, 'inverse')
call s:Hl('CursorLine', s:none, s:bg1)

"}}}
" Number column: {{{

call s:Hl('CursorColumn', s:none, s:bg1)
call s:Hl('CursorLineNr', s:fg1, s:bg1)
call s:Hl('FoldColumn', s:fg2, s:bg1)
call s:Hl('Folded', s:fg2, s:bg1)
call s:Hl('LineNr', s:fg2, s:bg0)
call s:Hl('SignColumn', s:none, s:bg1)

" }}}
" Window delimiters: {{{

call s:Hl('ColorColumn', s:none, s:bg1)
call s:Hl('TabLine', s:fg2, s:bg1)
call s:Hl('TabLineFill', s:fg2, s:bg1)
call s:Hl('TabLineSel', s:fg1, s:bg1)
call s:Hl('VertSplit', s:fg2, s:bg0)

" }}}
" Search: {{{

call s:Hl('CurSearch', s:bg0, s:fg0)
call s:Hl('IncSearch', s:bg0, s:fg0, 'bold')
call s:Hl('Search', s:fg0, s:bg2)

" }}}
" Prompt: {{{

call s:Hl('StatusLine', s:fg0, s:bg1)
call s:Hl('StatusLineNC', s:fg2, s:bg1)
call s:Hl('WildMenu', s:fg0, s:bg1, 'bold')
call s:Hl('Question', s:fg0, s:none, 'bold')
call s:Hl('Title', s:fg0, s:none, 'bold')
call s:Hl('ModeMsg', s:fg0, s:bg0, 'bold')
call s:Hl('MoreMsg', s:fg0, s:bg0, 'bold')

" }}}
" Visual aid: {{{

call s:Hl('MatchParen', s:none, s:bg2, 'bold')
call s:Hl('Visual', s:none, s:bg1)
call s:Hl('VisualNOS', s:none, s:bg1)
call s:Hl('NonText', s:bg1, s:bg0)

call s:Hl('Todo', s:fg0, s:none, 'bold')
call s:Hl('Underlined', s:fg1, s:none, 'underline')
call s:Hl('Error', s:bg0, s:red, 'bold')
call s:Hl('ErrorMsg', s:bg0, s:red, 'bold')
call s:Hl('WarningMsg', s:red, s:none, 'bold')
call s:Hl('Ignore', s:none, s:none)
call s:Hl('SpecialKey', s:none, s:bg1)

" }}}
" Variable types: {{{

call s:Hl('Constant', s:fg0, s:none, 'bold')

call s:Li('Number', 'Constant')
call s:Li('Boolean', 'Number')
call s:Li('Character', 'Number')
call s:Li('Float', 'Number')

call s:Hl('String', s:fg2, s:none)
call s:Li('StringDelimiter', 'String')

call s:Hl('Identifier', s:fg0, s:none)
call s:Li('Function', 'Identifier')

" }}}
" Language constructs: {{{

call s:Hl('Comment', s:fg2, s:none)
call s:Li('SpecialComment', 'Comment')

call s:Hl('Operator', s:fg0, s:none)

call s:Hl('Statement', s:fg0, s:none, 'bold')
call s:Li('Conditional', 'Statement')
call s:Li('Repeat', 'Statement')
call s:Li('Label', 'Statement')
call s:Li('Keyword', 'Statement')
call s:Li('Exception', 'Statement')
call s:Li('Tag', 'Statement')

call s:Hl('Special', s:fg0, s:none, 'bold')
call s:Li('Delimiter', 'Special')
call s:Li('Debug', 'Special')
call s:Li('StorageClass', 'Special')
call s:Li('Structure', 'Special')
call s:Li('Typedef', 'Structure')

call s:Hl('SpecialChar', s:fg0, s:none, 'bold')

call s:Hl('PreProc', s:fg0, s:none)
call s:Li('Include', 'PreProc')
call s:Li('Define', 'PreProc')
call s:Li('Macro', 'PreProc')
call s:Li('PreCondit', 'PreProc')

call s:Hl('Type', s:fg0, s:none, 'bold')

" }}}
" Diagnostic: {{{

call s:Hl('DiagnosticError', s:red, s:none)
call s:Hl('DiagnosticWarn', s:yel, s:none)
call s:Hl('DiagnosticInfo', s:cya, s:none)
call s:Hl('DiagnosticHint', s:blu, s:none)
call s:Hl('DiagnosticOk', s:gre, s:none)

" }}}
" Diff: {{{

call s:Hl('DiffAdd', s:gre, s:bg0)
call s:Hl('DiffDelete', s:red, s:bg0)
call s:Hl('DiffChange', s:blu, s:bg0)
call s:Hl('DiffText', s:yel, s:bg0)

call s:Li('diffAdded', 'DiffAdd')
call s:Li('diffRemoved', 'DiffDelete')
call s:Li('diffChanged', 'DiffChange')

" }}}
" Netrw: {{{

call s:Hl('Directory', s:blu, s:bg0)
call s:Hl('netrwSymLink', s:cya, s:bg0)

" }}}
" Completion menu: {{{

call s:Hl('Pmenu', s:fg0, s:bg1)
call s:Hl('PmenuSel', s:bg1, s:fg0)
call s:Hl('PmenuSbar', s:none, s:bg1)
call s:Hl('PmenuThumb', s:none, s:bg2)

" }}}
" Spelling: {{{

call s:Hl('SpellBad', s:none, s:none, 'undercurl', s:red)
call s:Hl('SpellCap', s:gre, s:none, 'bold')
call s:Hl('SpellLocal', s:none, s:none, 'undercurl', s:mag)
call s:Hl('SpellRare', s:none, s:none, 'undercurl', s:mag)

" }}}
" Neovim: {{{

call s:Hl('RedrawDebugNormal', s:bg0, s:fg0)
call s:Hl('RedrawDebugClear', s:bg0, s:yel)
call s:Hl('RedrawDebugComposed', s:bg0, s:gre)
call s:Hl('RedrawDebugRecompose', s:bg0, s:red)

call s:Li('NvimFigureBrace', 'Error')
call s:Li('NvimInternalError', 'Error')
call s:Li('NvimInvalidSingleQuotedUnknownEscape', 'Error')
call s:Li('NvimSingleQuotedUnknownEscape', 'Error')

" }}}
" Other: {{{

call s:Hl('Conceal', s:fg1, s:none)
call s:Hl('QuickFixLine', s:fg2, s:none)
call s:Hl('FloatShadow', s:bg0, s:fg1)
call s:Hl('FloatShadowThrough', s:bg0, s:fg1)

" }}}

" Plugin definitions
" --------------------------------

" ALE: {{{

call s:Hl('ALEError', s:none, s:none, 'undercurl', s:red)
call s:Hl('ALEErrorSign', s:red, s:bg1)
call s:Hl('ALEWarning', s:none, s:none, 'undercurl', s:yel)
call s:Hl('ALEWarningSign', s:yel, s:bg1)
call s:Hl('ALEInfo', s:none, s:none)
call s:Hl('ALEInfoSign', s:mag, s:bg1)

" }}}
" EasyMotion: {{{

call s:Li('EasyMotionTarget', 'Search')
call s:Li('EasyMotionTarget2First', 'IncSearch')
call s:Li('EasyMotionTarget2Second', 'Search')
call s:Li('EasyMotionShade', 'Comment')

" }}}
" GitGutter: {{{

call s:Hl('GitGutterAdd', s:fg1, s:bg1)
call s:Hl('GitGutterChange', s:fg1, s:bg1)
call s:Hl('GitGutterDelete', s:fg1, s:bg1)
call s:Hl('GitGutterChangeDelete', s:fg1, s:bg1)

" }}}
" Sneak: {{{

call s:Li('Sneak', 'Search')

" }}}

" Filetype definitions
" --------------------------------

" Java: {{{

call s:Li('javaOperator', 'Statement')

" }}}
" Javascript: {{{

call s:Li('javaScriptBraces', 'Normal')
call s:Li('javaScriptFunction', 'Statement')
call s:Li('javaScriptIdentifier', 'Special')
call s:Li('javaScriptMember', 'Identifier')
call s:Li('javaScriptNumber', 'Number')
call s:Li('javaScriptNull', 'Constant')
call s:Li('javaScriptParens', 'Normal')

" }}}
" Lua: {{{

call s:Li('luaIn', 'Normal')
call s:Li('luaFunction', 'Statement')
call s:Li('luaTable', 'Normal')

" }}}
" Markdown: {{{

call s:Hl('markdownH1', s:fg0, s:none, 'bold')
call s:Li('markdownH2', 'markdownH1')
call s:Li('markdownH3', 'markdownH1')
call s:Li('markdownH4', 'markdownH1')
call s:Li('markdownH5', 'markdownH1')
call s:Li('markdownH6', 'markdownH1')

call s:Hl('markdownHeadingDelimiter', s:fg1, s:none)

call s:Hl('markdownCode', s:fg2, s:none)
call s:Li('markdownCodeBlock', 'markdownCode')
call s:Li('markdownCodeDelimiter', 'markdownCode')

call s:Li('markdownBlockquote', 'Comment')
call s:Li('markdownListMarker', 'Comment')
call s:Li('markdownOrderedListMarker', 'Comment')
call s:Li('markdownRule', 'Comment')
call s:Li('markdownHeadingRule', 'Comment')
call s:Li('markdownUrlDelimiter', 'Comment')
call s:Li('markdownLinkDelimiter', 'Comment')
call s:Li('markdownLinkTextDelimiter', 'Comment')

call s:Hl('markdownUrl', s:fg1, s:none)
call s:Hl('markdownUrlTitleDelimiter', s:fg1, s:none)

call s:Hl('markdownLinkText', s:fg2, s:none, 'underline')
call s:Li('markdownIdDeclaration', 'markdownLinkText')

" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
