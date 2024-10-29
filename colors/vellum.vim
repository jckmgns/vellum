" --------------------------------
" Name: Vellum
" Description: Mellow syntax theme with a restrained choice of colors
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

if !exists('g:vellum#monochrome')
  let g:vellum#monochrome = 0
endif

let s:c0 = '#fcf1ee'
let s:c1 = '#d7ccc8'
let s:c2 = '#aca29e'
let s:c3 = '#817672'
let s:c4 = '#584e49'
let s:c5 = '#362c27'
let s:c6 = '#1e140f'
let s:c7 = '#160c07'

let s:bg0 = s:c0
let s:bg1 = s:c1
let s:bg2 = s:c2
let s:fg1 = s:c3
let s:fg0 = s:c7

if g:vellum#monochrome
  let s:re0 = s:c5
  let s:gr0 = s:c4
  let s:ye0 = s:c5
  let s:bl0 = s:c6
  let s:ma0 = s:c5
  let s:cy0 = s:c4
else
  let s:re0 = '#a84248'
  let s:gr0 = '#7a7424'
  let s:ye0 = '#c7823e'
  let s:bl0 = '#3a6d77'
  let s:ma0 = '#ac5e82'
  let s:cy0 = '#6a8f6c'
endif

" ---------------

" }}}
" Utility: {{{

let s:none = 'NONE'

if g:vellum#monochrome
  let s:monobold = 'bold'
else
  let s:monobold = 'NONE'
endif

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
call s:Hl('CursorLineNr', s:ye0, s:bg1)
call s:Hl('FoldColumn', s:fg1, s:bg1)
call s:Hl('Folded', s:fg1, s:bg1)
call s:Hl('LineNr', s:fg1, s:bg0)
call s:Hl('SignColumn', s:none, s:bg1)

" }}}
" Window delimiters: {{{

call s:Hl('ColorColumn', s:none, s:bg1)
call s:Hl('TabLine', s:fg1, s:bg1)
call s:Hl('TabLineFill', s:fg1, s:bg1)
call s:Hl('TabLineSel', s:gr0, s:bg1)
call s:Hl('VertSplit', s:fg1, s:bg0)

" }}}
" Navigation (Netrw): {{{

call s:Hl('Directory', s:bl0, s:bg0)
call s:Hl('IncSearch', s:bg1, s:fg0, 'bold')
call s:Hl('Search', s:fg0, s:bg2)
call s:Li('CurSearch', 'Search')
call s:Hl('netrwSymLink', s:cy0, s:bg0)

" }}}
" Prompt: {{{

call s:Hl('StatusLine', s:fg0, s:bg1)
call s:Hl('StatusLineNC', s:fg1, s:bg1)
call s:Hl('WildMenu', s:ma0, s:bg1, 'bold')
call s:Hl('Question', s:ye0, s:none, 'bold')
call s:Hl('Title', s:gr0, s:none, 'bold')
call s:Hl('ModeMsg', s:ye0, s:bg0, 'bold')
call s:Hl('MoreMsg', s:ye0, s:bg0, 'bold')

" }}}
" Visual aid: {{{

call s:Hl('MatchParen', s:none, s:bg2, 'bold')
call s:Hl('Visual', s:none, s:bg1)
call s:Hl('VisualNOS', s:none, s:bg1)
call s:Hl('NonText', s:bg1, s:bg0)

call s:Hl('Todo', s:fg0, s:none, 'bold')
call s:Hl('Underlined', s:ma0, s:none, 'underline')
call s:Hl('Error', s:bg0, s:re0, 'bold')
call s:Hl('ErrorMsg', s:bg0, s:re0, 'bold')
call s:Hl('WarningMsg', s:re0, s:none, 'bold')
call s:Hl('Ignore', s:none, s:none)
call s:Hl('SpecialKey', s:none, s:bg1)

" }}}
" Variable types: {{{

call s:Hl('Constant', s:ma0, s:none, s:monobold)

call s:Li('Number', 'Constant')
call s:Li('Boolean', 'Number')
call s:Li('Character', 'Number')
call s:Li('Float', 'Number')

call s:Hl('String', s:gr0, s:none)
call s:Li('StringDelimiter', 'String')

call s:Hl('Identifier', s:fg0, s:none)
call s:Li('Function', 'Identifier')

" }}}
" Language constructs: {{{

call s:Hl('Comment', s:fg1, s:none)
call s:Li('SpecialComment', 'Comment')

call s:Hl('Operator', s:fg0, s:none)

call s:Hl('Statement', s:re0, s:none, s:monobold)
call s:Li('Conditional', 'Statement')
call s:Li('Repeat', 'Statement')
call s:Li('Label', 'Statement')
call s:Li('Keyword', 'Statement')
call s:Li('Exception', 'Statement')
call s:Li('Tag', 'Statement')

call s:Hl('Special', s:re0, s:none, s:monobold)
call s:Li('Delimiter', 'Special')
call s:Li('Debug', 'Special')
call s:Li('StorageClass', 'Special')
call s:Li('Structure', 'Special')
call s:Li('Typedef', 'Structure')

call s:Hl('SpecialChar', s:gr0, s:none, 'bold')

call s:Hl('PreProc', s:fg0, s:none)
call s:Li('Include', 'PreProc')
call s:Li('Define', 'PreProc')
call s:Li('Macro', 'PreProc')
call s:Li('PreCondit', 'PreProc')

call s:Hl('Type', s:ye0, s:none, s:monobold)

" }}}
" Diagnostic: {{{

call s:Hl('DiagnosticError', s:re0, s:none)
call s:Hl('DiagnosticWarn', s:ye0, s:none)
call s:Hl('DiagnosticInfo', s:cy0, s:none)
call s:Hl('DiagnosticHint', s:bl0, s:none)
call s:Hl('DiagnosticOk', s:gr0, s:none)

" }}}
" Diff: {{{

call s:Hl('DiffAdd', s:bg0, s:gr0)
call s:Hl('DiffChange', s:bg0, s:bl0)
call s:Hl('DiffDelete', s:bg0, s:re0)
call s:Hl('DiffText', s:bg0, s:ye0)

call s:Hl('Added', s:gr0, s:none)
call s:Hl('Removed', s:re0, s:none)
call s:Hl('Changed', s:bl0, s:none)

" }}}
" Completion menu: {{{

call s:Hl('Pmenu', s:fg0, s:bg1)
call s:Hl('PmenuSel', s:bg1, s:fg0)
call s:Hl('PmenuSbar', s:none, s:bg1)
call s:Hl('PmenuThumb', s:none, s:bg2)

" }}}
" Spelling: {{{

call s:Hl('SpellBad', s:none, s:none, 'undercurl', s:re0)
call s:Hl('SpellCap', s:gr0, s:none, 'bold')
call s:Hl('SpellLocal', s:none, s:none, 'undercurl', s:ma0)
call s:Hl('SpellRare', s:none, s:none, 'undercurl', s:ma0)

" }}}
" Neovim: {{{

call s:Hl('RedrawDebugNormal', s:bg0, s:fg0)
call s:Hl('RedrawDebugClear', s:bg0, s:ye0)
call s:Hl('RedrawDebugComposed', s:bg0, s:gr0)
call s:Hl('RedrawDebugRecompose', s:bg0, s:re0)

call s:Li('NvimFigureBrace', 'Error')
call s:Li('NvimInternalError', 'Error')
call s:Li('NvimInvalidSingleQuotedUnknownEscape', 'Error')
call s:Li('NvimSingleQuotedUnknownEscape', 'Error')

" }}}
" Other: {{{

call s:Hl('Conceal', s:cy0, s:none)
call s:Hl('QuickFixLine', s:fg1, s:none)
call s:Hl('FloatShadow', s:bg0, s:bl0)
call s:Hl('FloatShadowThrough', s:bg0, s:bl0)

" }}}

" Plugin definitions
" --------------------------------

" ALE: {{{

call s:Hl('ALEError', s:none, s:none, 'undercurl', s:re0)
call s:Hl('ALEErrorSign', s:re0, s:bg1)
call s:Hl('ALEWarning', s:none, s:none, 'undercurl', s:ye0)
call s:Hl('ALEWarningSign', s:ye0, s:bg1)
call s:Hl('ALEInfo', s:none, s:none)
call s:Hl('ALEInfoSign', s:ma0, s:bg1)

" }}}
" EasyMotion: {{{

call s:Li('EasyMotionTarget', 'Search')
call s:Li('EasyMotionTarget2First', 'IncSearch')
call s:Li('EasyMotionTarget2Second', 'Search')
call s:Li('EasyMotionShade', 'Comment')

" }}}
" GitGutter: {{{

call s:Hl('GitGutterAdd', s:gr0, s:bg1)
call s:Hl('GitGutterChange', s:bl0, s:bg1)
call s:Hl('GitGutterDelete', s:re0, s:bg1)
call s:Hl('GitGutterChangeDelete', s:re0, s:bg1)

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

call s:Hl('markdownH1', s:ye0, s:none, 'bold')
call s:Li('markdownH2', 'markdownH1')
call s:Li('markdownH3', 'markdownH1')
call s:Li('markdownH4', 'markdownH1')
call s:Li('markdownH5', 'markdownH1')
call s:Li('markdownH6', 'markdownH1')

call s:Hl('markdownCode', s:ma0, s:none)
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

call s:Hl('markdownHeadingDelimiter', s:ye0, s:none)
call s:Hl('markdownUrl', s:ma0, s:none)
call s:Hl('markdownUrlTitleDelimiter', s:gr0, s:none)

call s:Hl('markdownLinkText', s:fg1, s:none, 'underline')
call s:Li('markdownIdDeclaration', 'markdownLinkText')

" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
