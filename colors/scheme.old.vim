function! <SID>set_hi(group, fg, bg, style)
  execute "hi " . a:group . " ctermfg=" . a:fg[0] . " ctermbg=" . a:bg[0] " cterm=" . a:style
  if a:fg[1] != "" | execute "hi " . a:group . " guifg=" . a:fg[1] | endif
  if a:bg[1] != "" | execute "hi " . a:group . " guibg=" . a:bg[1] | endif
  execute "hi " . a:group . " gui=" . a:style
endfun

" UI
call <SID>set_hi("CocBold",          g:color_dict.none,         g:color_dict.none,          "bold")
call <SID>set_hi("CocFloating",      g:color_dict.light_cyan,   g:color_dict.highlight,     "NONE")
call <SID>set_hi("Pmenu",            g:color_dict.bg,           g:color_dict.light_cyan,    "NONE")
call <SID>set_hi("PmenuSel",         g:color_dict.bg,           g:color_dict.dark_blue,     "NONE")
call <SID>set_hi("Search",           g:color_dict.none,         g:color_dict.none,          "underline")
call <SID>set_hi("SignColumn",       g:color_dict.none,         g:color_dict.bg,            "NONE")
call <SID>set_hi("SpellBad",         g:color_dict.none,         g:color_dict.off_bg,        "italic,underline")
call <SID>set_hi("SpellCap",         g:color_dict.light_blue,   g:color_dict.none,          "underline")
call <SID>set_hi("StatusLine",       g:color_dict.fg,           g:color_dict.dark_gray,     "bold")
call <SID>set_hi("Cursor",           g:color_dict.bg,           g:color_dict.fg,            "NONE")
call <SID>set_hi("CursorLine",       g:color_dict.none,         g:color_dict.off_bg,        "NONE")
call <SID>set_hi("CursorLineNr",     g:color_dict.fg,           g:color_dict.off_bg,        "NONE")
call <SID>set_hi("DiffAdd",          g:color_dict.fg,           g:color_dict.dark_green,    "bold")
call <SID>set_hi("DiffDelete",       g:color_dict.dark_red,     g:color_dict.none,          "NONE")
call <SID>set_hi("Directory",        g:color_dict.dark_magenta, g:color_dict.none,          "NONE")
call <SID>set_hi("EndOfBuffer",      g:color_dict.bg,           g:color_dict.bg,            "NONE")
call <SID>set_hi("ErrorMsg",         g:color_dict.fg,           g:color_dict.dark_red,      "NONE")
call <SID>set_hi("Folded",           g:color_dict.light_yellow, g:color_dict.bg,            "NONE")
call <SID>set_hi("LineNr",           g:color_dict.dark_gray,    g:color_dict.bg,            "NONE")
call <SID>set_hi("NormalFLoat",      g:color_dict.fg,           g:color_dict.off_bg,        "NONE")
call <SID>set_hi("IncSearch",        g:color_dict.bg,           g:color_dict.light_yellow,  "NONE")
call <SID>set_hi("SyntasticError",   g:color_dict.bg,           g:color_dict.light_magenta, "NONE")
call <SID>set_hi("SyntasticWarning", g:color_dict.bg,           g:color_dict.light_blue,    "NONE")
call <SID>set_hi("TabLineSel",       g:color_dict.light_cyan,   g:color_dict.bg,            "NONE")
call <SID>set_hi("VertSplit",        g:color_dict.off_bg,       g:color_dict.off_bg,        "NONE")
call <SID>set_hi("Visual",           g:color_dict.none,         g:color_dict.dark_gray,     "NONE")

" Code but consistent
call <SID>set_hi("Todo",       g:color_dict.light_yellow, g:color_dict.bg,        "bold")
call <SID>set_hi("Comment",    g:color_dict.dark_gray,    g:color_dict.none,      "italic")
call <SID>set_hi("MatchParen", g:color_dict.none,         g:color_dict.highlight, "NONE")
call <SID>set_hi("Normal",     g:color_dict.fg,           g:color_dict.bg,        "NONE")
call <SID>set_hi("Title",      g:color_dict.fg,           g:color_dict.none,      "bold")

" Code
call <SID>set_hi("String",       g:color_dict.light_green,   g:color_dict.none, "NONE")
call <SID>set_hi("Constant",     g:color_dict.dark_cyan,     g:color_dict.none, "NONE")
call <SID>set_hi("Conditional",  g:color_dict.light_red,     g:color_dict.none, "NONE")
call <SID>set_hi("StorageClass", g:color_dict.dark_red,      g:color_dict.none, "NONE")
call <SID>set_hi("Identifier",   g:color_dict.dark_blue,     g:color_dict.none, "NONE")
call <SID>set_hi("Type",         g:color_dict.light_cyan,    g:color_dict.none, "NONE")
call <SID>set_hi("Structure",    g:color_dict.dark_yellow,   g:color_dict.none, "NONE")
call <SID>set_hi("Function",     g:color_dict.light_magenta, g:color_dict.none, "NONE")
call <SID>set_hi("Label",        g:color_dict.light_blue,    g:color_dict.none, "NONE")
call <SID>set_hi("Number",       g:color_dict.light_yellow,  g:color_dict.none, "NONE")
call <SID>set_hi("Include",      g:color_dict.dark_blue,     g:color_dict.none, "NONE")

hi! link CursorColumn CursorLine
hi! link ColorColumn CursorLine
hi! link TabLine Normal
hi! link TabLineFill Normal
hi! link DiffChange Normal
hi! link WarningMsg ErrorMsg
hi! link Boolean Directory
hi! link StatusLineNC CocFloating
hi! link PreProc Function

hi! link Character Directory
hi! link Float Directory
hi! link Keyword Conditional
hi! link NonText Normal
hi! link Operator Conditional
hi! link Special Label
hi! link SpecialKey Normal
hi! link Statement Conditional
hi! link Tag Conditional
hi! link Underline Search
hi! link DiffText PmenuSel

hi! link GitGutterAdd Function
hi! link GitGutterChange Type
hi! link GitGutterChangeDelete Conditional
hi! link GitGutterDelete Conditional
hi! link CocErrorSign SignColumn
hi! link CocWarningSign SignColumn

hi! link CocGitAddedSign GitGutterAdd
hi! link CocGitChangedSign GitGutterChange
hi! link CocGitChangeRemovedSign GitGutterChangeDelete
hi! link CocGitRemovedSign GitGutterDelete
hi! link CocWarningHighlight CocBold
hi! link CocErrorHighlight CocBold
hi! link CocInfoHighlight CocBold
hi! link CocHintHighlight CocBold
hi! link CocWarningFloat CocFloating
hi! link CocErrorFloat CocFloating
hi! link CocHighlightText MatchParen

hi! link htmlH1 Identifier
hi! link htmlH2 Identifier
hi! link htmlH3 Identifier
hi! link htmlH4 Identifier
hi! link htmlH5 Identifier
hi! link htmlH6 Identifier
hi! link htmlTag PreProc
hi! link htmlEndTag PreProc
hi! link htmlTagName PreProc
hi! link htmlArg PreProc
hi! link htmlSpecialChar Directory

hi! link mkdHeading String
hi! link mkdListItem String

hi! link javaScriptFunction Number
hi! link javaScriptRailsFunction Number
hi! link javaScriptBraces PreProc

hi! link yamlKey Conditional
hi! link yamlAnchor PreProc
hi! link yamlAlias PreProc
hi! link yamlDocumentHeader Label
hi! link yamlPlainScalar String
hi! link yamlBlockCollectionItemStart Conditional

hi! link cssURL DiffDelete
hi! link cssFunctionName Number
hi! link cssColor Directory
hi! link cssPseudoClassId Label
hi! link cssClassName Label
hi! link cssValueLength Directory
hi! link cssCommonAttr Number
hi! link cssBraces PreProc

hi! link jsThis Conditional
hi! link jsBraces Function
hi! link jsGlobalObjects Number

hi! link vimUserFunc Function

" httpg:color_dict.//github.com/kien/rainbow_parentheses.vim
if !exists("g:rbpt_colorpairs")
  let g:rbpt_colorpairs = [
        \ g:color_dict.light_green, g:color_dict.light_blue, g:color_dict.dark_magenta, g:color_dict.light_magenta,
        \ g:color_dict.light_green, g:color_dict.light_blue, g:color_dict.dark_magenta, g:color_dict.light_magenta,
        \ g:color_dict.light_green, g:color_dict.light_blue, g:color_dict.dark_magenta, g:color_dict.light_magenta,
        \ g:color_dict.light_green, g:color_dict.light_blue, g:color_dict.dark_magenta, g:color_dict.light_magenta,
        \ ]
endif
