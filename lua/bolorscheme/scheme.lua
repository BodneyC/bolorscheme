local util = require('bolorscheme.util')
local colors = require('bolorscheme.colors')

local M = {}

M.active_scheme = {}

function M.create(opts)

  local scheme = {}
  scheme.config = opts
  scheme.colors = colors.setup(opts)

  local c = scheme.colors

  scheme.base = {
    -- LuaFormatter off
    Comment = {fg = c.comment, style = opts.styles.commentStyle}, -- any comment
    ColorColumn = {bg = c.bg_visual}, -- used for the columns set with 'colorcolumn'
    Conceal = {fg = c.fg_highlight}, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor = {fg = c.bg, bg = c.fg}, -- character under the cursor
    lCursor = {fg = c.bg, bg = c.fg}, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM = {fg = c.bg, bg = c.fg}, -- like Cursor, but used when in IME mode |CursorIM|
    CursorColumn = {bg = c.bg_highlight}, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine = {bg = c.bg_highlight}, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory = {fg = c.dark.blue}, -- directory names (and other special names in listings)
    DiffAdd = {bg = c.diff.add}, -- diff mode: Added line |diff.txt|
    DiffChange = {bg = c.diff.change}, -- diff mode: Changed line |diff.txt|
    DiffDelete = {bg = c.diff.delete}, -- diff mode: Deleted line |diff.txt|
    DiffText = {bg = c.diff.text}, -- diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer = {fg = c.bg}, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    -- TermCursor  = { }, -- cursor in a focused terminal
    -- TermCursorNC= { }, -- cursor in an unfocused terminal
    ErrorMsg = {fg = c.error}, -- error messages on the command line
    VertSplit = {fg = c.border}, -- the column separating vertically split windows
    Folded = {fg = c.dark.blue, bg = c.fg_highlight}, -- line used for closed folds
    FoldColumn = {bg = c.bg, fg = c.comment}, -- 'foldcolumn'
    SignColumn = {bg = opts.transparent and c.none or c.bg, fg = c.fg_highlight}, -- column where |signs| are displayed
    SignColumnSB = {bg = c.bg_sidebar, fg = c.fg_highlight}, -- column where |signs| are displayed
    LineNr = {fg = c.fg_highlight}, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr = {fg = c.light.gray}, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen = {fg = c.light.yellow, style = 'bold'}, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg = {fg = c.fg_dark, style = 'bold'}, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea = {fg = c.fg_dark}, -- Area for messages and cmdline
    -- MsgSeparator= { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg = {fg = c.dark.blue}, -- |more-prompt|
    NonText = {fg = c.dark.gray}, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal = {fg = c.fg, bg = opts.transparent and c.none or c.bg}, -- normal text
    NormalNC = {fg = c.fg, bg = opts.transparent and c.none or c.bg}, -- normal text in non-current windows
    NormalSB = {fg = c.fg_sidebar, bg = c.bg_sidebar}, -- normal text in non-current windows
    NormalFloat = {fg = c.fg, bg = c.bg_float}, -- Normal text in floating windows.
    FloatBorder = {fg = c.border_highlight},
    Pmenu = {bg = c.bg_popup, fg = c.fg}, -- Popup menu: normal item.
    PmenuSel = {bg = util.darken(c.fg_highlight, 0.8)}, -- Popup menu: selected item.
    PmenuSbar = {bg = util.lighten(c.bg_popup, 0.95)}, -- Popup menu: scrollbar.
    PmenuThumb = {bg = c.fg_highlight}, -- Popup menu: Thumb of the scrollbar.
    Question = {fg = c.dark.blue}, -- |hit-enter| prompt and yes/no questions
    QuickFixLine = {bg = c.bg_visual, style = 'bold'}, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search = {bg = c.bg_search, fg = c.fg}, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    IncSearch = {bg = c.light.yellow, fg = c.bg_highlight}, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Substitute = {link = 'IncSearch'}, -- |:substitute| replacement text highlighting
    SpecialKey = {fg = c.dark.gray}, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad = {sp = c.error, style = 'undercurl'}, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap = {sp = c.warning, style = 'undercurl'}, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal = {sp = c.info, style = 'undercurl'}, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare = {sp = c.hint, style = 'undercurl'}, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    StatusLine = {fg = c.fg_sidebar, bg = c.bg_statusline}, -- status line of current window
    StatusLineNC = {fg = c.fg_highlight, bg = c.bg_statusline}, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine = {bg = c.bg_statusline, fg = c.fg_highlight}, -- tab pages line, not active tab page label
    TabLineFill = {bg = c.bg_highlight}, -- tab pages line, where there are no labels
    TabLineSel = {fg = c.bg_highlight, bg = c.dark.blue}, -- tab pages line, active tab page label
    Title = {fg = c.dark.blue, style = 'bold'}, -- titles for output from ":set all", ":autocmd" etc.
    Visual = {bg = c.bg_visual}, -- Visual mode selection
    VisualNOS = {bg = c.bg_visual}, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg = {fg = c.warning}, -- warning messages
    Whitespace = {fg = c.fg_highlight}, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    WildMenu = {bg = c.bg_visual}, -- current match in 'wildmenu' completion

    -- These groups are not listed as default vim groups,
    -- but they are defacto standard group names for syntax highlighting.
    -- commented out groups should chain up to their "preferred" group by
    -- default,
    -- Uncomment and edit if you want more specific syntax highlighting.

    Constant = {fg = c.light.yellow}, -- (preferred) any constant
    String = {fg = c.light.green}, --   a string constant: "this is a string"
    Character = {fg = c.light.green}, --  a character constant: 'c', '\n'
    -- Number        = { }, --   a number constant: 234, 0xff
    -- Boolean       = { }, --  a boolean constant: TRUE, false
    -- Float         = { }, --    a floating point constant: 2.3e10

    Identifier = {fg = c.light.magenta, style = opts.styles.variableStyle}, -- (preferred) any variable name
    Function = {fg = c.dark.blue, style = opts.styles.functionStyle}, -- function name (also: methods for classes)

    Statement = {fg = c.light.magenta}, -- (preferred) any statement
    -- Conditional   = { }, --  if, then, else, endif, switch, etc.
    -- Repeat        = { }, --   for, do, while, etc.
    -- Label         = { }, --    case, default, etc.
    Operator = {fg = c.light.blue}, -- "sizeof", "+", "*", etc.
    Keyword = {fg = c.dark.cyan, style = opts.styles.keywordStyle}, --  any other keyword
    -- Exception     = { }, --  try, catch, throw

    PreProc = {fg = c.dark.cyan}, -- (preferred) generic Preprocessor
    -- Include       = { }, --  preprocessor #include
    -- Define        = { }, --   preprocessor #define
    -- Macro         = { }, --    same as Define
    -- PreCondit     = { }, --  preprocessor #if, #else, #endif, etc.

    Type = {fg = c.light.cyan}, -- (preferred) int, long, char, etc.
    -- StorageClass  = { }, -- static, register, volatile, etc.
    -- Structure     = { }, --  struct, union, enum, etc.
    -- Typedef       = { }, --  A typedef

    Special = {fg = c.light.cyan}, -- (preferred) any special symbol
    -- SpecialChar   = { }, --  special character in a constant
    -- Tag           = { }, --    you can use CTRL-] on this
    -- Delimiter     = { }, --  character that needs attention
    -- SpecialComment= { }, -- special things inside a comment
    -- Debug         = { }, --    debugging statements

    Underlined = {style = 'underline'}, -- (preferred) text that stands out, HTML links
    Bold = {style = 'bold'},
    Italic = {style = 'italic'},

    -- ("Ignore", below, may be invisible...)
    -- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|

    Error = {fg = c.error}, -- (preferred) any erroneous construct
    Todo = {bg = c.dark.yellow, fg = c.bg}, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    qfLineNr = {fg = c.light.gray},
    qfFileName = {fg = c.dark.blue},

    htmlH1 = {fg = c.light.magenta, style = 'bold'},
    htmlH2 = {fg = c.dark.blue, style = 'bold'},

    mkdHeading = {fg = c.light.yellow, style = 'bold'},
    mkdCode = {fg = c.light.blue},
    mkdCodeDelimiter = {fg = c.dark.blue},
    mkdCodeStart = {fg = c.light.teal, style = 'bold'},
    mkdCodeEnd = {fg = c.light.teal, style = 'bold'},
    mkdLink = {fg = c.dark.blue, style = 'underline'},
    markdownH1 = {fg = c.light.magenta, style = 'bold'},
    markdownH1Delimiter = {fg = c.light.magenta},
    markdownH2 = {fg = c.dark.blue, style = 'bold'},
    markdownH2Delimiter = {fg = c.dark.blue},

    debugPC = {bg = c.bg_sidebar}, -- used for highlighting the current line in terminal-debug
    debugBreakpoint = {bg = util.darken(c.info, 0.1), fg = c.info}, -- used for breakpoint colors in terminal-debug

    -- These groups are for the native LSP client. Some other LSP clients may
    -- use these groups, or use their own. Consult your LSP client's
    -- documentation.

    -- LuaFormatter on
  }

  scheme.plugins = {
    -- LuaFormatter off
    LspReferenceText = {bg = c.fg_highlight}, -- used for highlighting "text" references
    LspReferenceRead = {bg = c.fg_highlight}, -- used for highlighting "read" references
    LspReferenceWrite = {bg = c.fg_highlight}, -- used for highlighting "write" references

    LspDiagnosticsDefaultError = {fg = c.error}, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsDefaultWarning = {fg = c.warning}, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsDefaultInformation = {fg = c.info}, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsDefaultHint = {fg = c.hint}, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)

    LspDiagnosticsVirtualTextError = {bg = util.darken(c.error, 0.1), fg = c.error}, -- Used for "Error" diagnostic virtual text
    LspDiagnosticsVirtualTextWarning = {bg = util.darken(c.warning, 0.1), fg = c.warning}, -- Used for "Warning" diagnostic virtual text
    LspDiagnosticsVirtualTextInformation = {bg = util.darken(c.info, 0.1), fg = c.info}, -- Used for "Information" diagnostic virtual text
    LspDiagnosticsVirtualTextHint = {bg = util.darken(c.hint, 0.1), fg = c.hint}, -- Used for "Hint" diagnostic virtual text

    LspDiagnosticsUnderlineError = {style = 'undercurl', sp = c.error}, -- Used to underline "Error" diagnostics
    LspDiagnosticsUnderlineWarning = {style = 'undercurl', sp = c.warning}, -- Used to underline "Warning" diagnostics
    LspDiagnosticsUnderlineInformation = {style = 'undercurl', sp = c.info}, -- Used to underline "Information" diagnostics
    LspDiagnosticsUnderlineHint = {style = 'undercurl', sp = c.hint}, -- Used to underline "Hint" diagnostics

    -- LspDiagnosticsFloatingError         = { }, -- Used to color "Error" diagnostic messages in diagnostics float
    -- LspDiagnosticsFloatingWarning       = { }, -- Used to color "Warning" diagnostic messages in diagnostics float
    -- LspDiagnosticsFloatingInformation   = { }, -- Used to color "Information" diagnostic messages in diagnostics float
    -- LspDiagnosticsFloatingHint          = { }, -- Used to color "Hint" diagnostic messages in diagnostics float

    -- LspDiagnosticsSignError             = { }, -- Used for "Error" signs in sign column
    -- LspDiagnosticsSignWarning           = { }, -- Used for "Warning" signs in sign column
    -- LspDiagnosticsSignInformation       = { }, -- Used for "Information" signs in sign column
    -- LspDiagnosticsSignHint              = { }, -- Used for "Hint" signs in sign column

    -- These groups are for the neovim tree-sitter highlights.
    -- As of writing, tree-sitter support is a WIP, group names may change.
    -- By default, most of these groups link to an appropriate Vim group,
    -- TSError -> Error for example, so you do not have to define these unless
    -- you explicitly want to support Treesitter's improved syntax awareness.

    -- TSAnnotation        = { };    -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
    -- TSAttribute         = { };    -- (unstable) TODO: docs
    -- TSBoolean           = { };    -- For booleans.
    -- TSCharacter         = { };    -- For characters.
    -- TSComment           = { };    -- For comment blocks.
    TSConstructor = {fg = c.light.magenta}, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
    -- TSConditional       = { };    -- For keywords related to conditionnals.
    -- TSConstant          = { };    -- For constants
    -- TSConstBuiltin      = { };    -- For constant that are built in the language: `nil` in Lua.
    -- TSConstMacro        = { };    -- For constants that are defined by macros: `NULL` in C.
    -- TSError             = { };    -- For syntax/parser errors.
    -- TSException         = { };    -- For exception related keywords.
    TSField = {fg = c.dark.green}, -- For fields.
    -- TSFloat             = { };    -- For floats.
    -- TSFunction          = { };    -- For function (calls and definitions).
    -- TSFuncBuiltin       = { };    -- For builtin functions: `table.insert` in Lua.
    -- TSFuncMacro         = { };    -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
    -- TSInclude           = { };    -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
    TSKeyword = {fg = c.dark.magenta, style = opts.styles.keywordStyle}, -- For keywords that don't fall in previous categories.
    TSKeywordFunction = {fg = c.light.magenta, style = opts.styles.functionStyle}, -- For keywords used to define a fuction.
    TSLabel = {fg = c.dark.blue}, -- For labels: `label:` in C and `:label:` in Lua.
    -- TSMethod            = { };    -- For method calls and definitions.
    -- TSNamespace         = { };    -- For identifiers referring to modules and namespaces.
    -- TSNone              = { };    -- TODO: docs
    -- TSNumber            = { };    -- For all numbers
    TSOperator = {fg = c.light.blue}, -- For any operator: `+`, but also `->` and `*` in C.
    TSParameter = {fg = c.dark.yellow}, -- For parameters of a function.
    -- TSParameterReference= { };    -- For references to parameters of a function.
    TSProperty = {fg = c.dark.green}, -- Same as `TSField`.
    TSPunctDelimiter = {fg = c.light.blue}, -- For delimiters ie: `.`
    TSPunctBracket = {fg = c.fg_dark}, -- For brackets and parens.
    TSPunctSpecial = {fg = c.light.blue}, -- For special punctutation that does not fall in the catagories before.
    -- TSRepeat            = { };    -- For keywords related to loops.
    -- TSString            = { };    -- For strings.
    TSStringRegex = {fg = c.light.blue}, -- For regexes.
    TSStringEscape = {fg = c.light.magenta}, -- For escape characters within a string.
    -- TSSymbol            = { };    -- For identifiers referring to symbols or atoms.
    -- TSType              = { };    -- For types.
    -- TSTypeBuiltin       = { };    -- For builtin types.
    TSVariable = {style = opts.styles.variableStyle}, -- Any variable name that does not have another highlight.
    TSVariableBuiltin = {fg = c.dark.red}, -- Variable names that are defined by the languages, like `this` or `self`.

    -- TSTag               = { };    -- Tags like html tag names.
    -- TSTagDelimiter      = { };    -- Tag delimiter like `<` `>` `/`
    -- TSText              = { };    -- For strings considered text in a markup language.
    TSTextReference = {fg = c.dark.red}, -- FIXME
    -- TSEmphasis          = { };    -- For text to be represented with emphasis.
    -- TSUnderline         = { };    -- For text to be represented with an underline.
    -- TSStrike            = { };    -- For strikethrough text.
    -- TSTitle             = { };    -- Text that is part of a title.
    -- TSLiteral           = { };    -- Literal text.
    -- TSURI               = { };    -- Any URI like a link or email.

    -- Lua
    -- luaTSProperty = { fg = c.dark.red }, -- Same as `TSField`.

    -- LspTrouble
    LspTroubleText = {fg = c.fg_dark},
    LspTroubleCount = {fg = c.light.magenta, bg = c.fg_highlight},
    LspTroubleNormal = {fg = c.fg_sidebar, bg = c.bg_sidebar},

    -- Illuminate
    illuminatedWord = {bg = c.fg_highlight},
    illuminatedCurWord = {bg = c.fg_highlight},

    -- diff
    diffAdded = {fg = c.git.add},
    diffRemoved = {fg = c.git.delete},
    diffChanged = {fg = c.git.change},
    diffOldFile = {fg = c.dark.yellow},
    diffNewFile = {fg = c.light.yellow},
    diffFile = {fg = c.dark.blue},
    diffLine = {fg = c.comment},
    diffIndexLine = {fg = c.light.magenta},

    -- Neogit
    NeogitBranch = {fg = c.light.magenta},
    NeogitRemote = {fg = c.dark.magenta},
    NeogitHunkHeader = {bg = c.bg_highlight, fg = c.fg},
    NeogitHunkHeaderHighlight = {bg = c.fg_highlight, fg = c.dark.blue},
    NeogitDiffContextHighlight = {bg = util.darken(c.fg_highlight, 0.5), fg = c.fg_dark},
    NeogitDiffDeleteHighlight = {fg = c.git.delete, bg = c.diff.delete},
    NeogitDiffAddHighlight = {fg = c.git.add, bg = c.diff.add},

    -- GitGutter
    GitGutterAdd = {fg = c.gitSigns.add}, -- diff mode: Added line |diff.txt|
    GitGutterChange = {fg = c.gitSigns.change}, -- diff mode: Changed line |diff.txt|
    GitGutterDelete = {fg = c.gitSigns.delete}, -- diff mode: Deleted line |diff.txt|

    -- GitSigns
    GitSignsAdd = {fg = c.gitSigns.add}, -- diff mode: Added line |diff.txt|
    GitSignsChange = {fg = c.gitSigns.change}, -- diff mode: Changed line |diff.txt|
    GitSignsDelete = {fg = c.gitSigns.delete}, -- diff mode: Deleted line |diff.txt|

    -- Telescope
    TelescopeNormal = {bg = c.bg_dark},
    TelescopeBorder = {link = 'TelescopeNormal'},

    TelescopePromptNormal = {bg = c.bg_highlight},
    TelescopePromptTitle = {bg = c.bg_highlight, fg = c.bg_highlight},
    TelescopePromptBorder = {link = 'TelescopePromptNormal'},
    TelescopePromptPrefix = {link = 'TelescopePromptNormal'},

    -- TelescopePromptTitle = {bg = c.dark.blue, fg = c.bg},
    -- TelescopePromptNormal = {bg = c.bg_highlight},
    -- TelescopePromptBorder = {link = 'TelescopePromptNormal'},
    -- TelescopePromptPrefix = {link = 'TelescopePromptNormal'},

    TelescopePreviewTitle = {bg = c.dark.red, fg = c.bg},

    TelescopeResultsTitle = {bg = c.bg_dark, fg = c.bg_dark},

    TelescopeSelection = {},

    -- NvimTree
    NvimTreeNormal = {fg = c.fg_sidebar, bg = c.bg_sidebar},
    NvimTreeRootFolder = {fg = c.dark.blue, style = 'bold'},
    NvimTreeGitDirty = {fg = c.git.change},
    NvimTreeGitNew = {fg = c.git.add},
    NvimTreeGitDeleted = {fg = c.git.delete},
    NvimTreeSpecialFile = {fg = c.dark.magenta, style = 'underline'},
    LspDiagnosticsError = {fg = c.error},
    LspDiagnosticsWarning = {fg = c.warning},
    LspDiagnosticsInformation = {fg = c.info},
    LspDiagnosticsHint = {fg = c.hint},
    NvimTreeIndentMarker = {fg = c.fg_highlight},
    NvimTreeImageFile = {fg = c.fg_sidebar},
    NvimTreeSymlink = {fg = c.dark.blue},
    -- NvimTreeFolderName= { fg = c.fg_float },

    -- Dashboard
    DashboardShortCut = {fg = c.dark.cyan},
    DashboardHeader = {fg = c.dark.blue},
    DashboardCenter = {fg = c.light.magenta},
    DashboardFooter = {fg = c.dark.yellow, style = 'italic'},

    -- WhichKey
    WhichKey = {fg = c.dark.cyan},
    WhichKeyGroup = {fg = c.dark.blue},
    WhichKeyDesc = {fg = c.light.magenta},
    WhichKeySeperator = {fg = c.comment},
    WhichKeySeparator = {fg = c.comment},
    WhichKeyFloat = {bg = c.bg_sidebar},
    WhichKeyValue = {fg = c.light.gray},

    -- LspSaga
    DiagnosticError = {fg = c.error},
    DiagnosticWarn = {fg = c.warning},
    DiagnosticInfo = {fg = c.info},
    DiagnosticHint = {fg = c.hint},

    -- NeoVim
    healthError = {fg = c.error},
    healthSuccess = {fg = c.dark.green},
    healthWarning = {fg = c.warning},

    -- BufferLine
    BufferCurrent = {fg = c.light.green, bg = c.bg},
    BufferVisible = {fg = c.dark.blue, bg = c.bg_dark},
    BufferInactive = {fg = c.light.gray, bg = c.bg_dark},
    BufferLineErrorSelected = {fg = c.dark.red},
    BufferLineErrorDiagnosticSelected = {link = 'BufferLineErrorSelected'},
    BufferLinePick = {link = 'BufferLineErrorSelected'},
    BufferLinePickVisible = {fg = c.light.red},
    BufferLinePickSelected = {link = 'BufferLinePickVisible'},
    BufferLineWarningSelected = {fg = c.dark.yellow},
    BufferLineWarningDiagnosticSelected = {link = 'BufferLineWarningSelected'},

    -- BufferCurrentIndex = {bg = c.bg},
    BufferVisibleIndex = {bg = c.bg_dark},
    -- BufferInactiveIndex = {bg = c.bg_dark},

    BufferCurrentSign = {bg = c.bg, preserve = true},
    BufferVisibleSign = {bg = c.bg_dark, preserve = true},
    BufferInactiveSign = {bg = c.bg_dark, preserve = true},

    -- BufferCurrentTarget = {bg = c.bg},
    BufferVisibleTarget = {bg = c.bg_dark},
    -- BufferInactiveTarget = {bg = c.bg_dark},

    -- BufferCurrentMod = {fg = c.light.red, bg = c.bg},
    BufferVisibleMod = {fg = c.light.red, bg = c.bg_dark},
    -- BufferInactiveMod = {fg = c.light.red, bg = c.bg_dark},

    -- BufferLineIndicatorSelected = {fg = c.git.change},
    -- BufferLineFill = {bg = c.bg_highlight},

    -- DevIconDefault = {bg = c.none, preserve = true},
    -- DevIconDefaultVisible = {bg = c.fg, preserve = true},
    -- DevIconDefaultCurrent = {bg = c.none, preserve = true},
    -- DevIconLuaVisible = {bg = c.none, preserve = true},
    -- DevIconLuaInactive = {bg = c.none, preserve = true},
    -- DevIconLuaCurrent = {bg = c.none, preserve = true},
    -- DevIconVimVisible = {bg = c.none, preserve = true},

    -- Sneak
    Sneak = {fg = c.bg_highlight, bg = c.light.magenta},
    SneakScope = {bg = c.bg_visual},

    -- Hop
    -- HopNextKey = { fg = c.light.teal },
    -- HopNextKey1 = { fg = c.dark.blue },
    -- HopNextKey2 = { fg = util.lighten(c.dark.blue, .3) },
    HopUnmatched = {fg = c.dark.gray},

    -- IndentBlankline
    IndentBlanklineChar = {fg = c.bg_highlight},
    IndentBlanklineSpaceChar = {fg = c.bg_highlight},
    IndentBlanklineSpaceCharBlankline = {fg = c.bg_highlight},

    -- Vim_Current_Word
    CurrentWord = {bg = c.bg_search, fg = c.fg},
    CurrentWordTwins = {bg = c.bg_dark, style = 'bold'},

    -- Spelunker
    SpelunkerSpellBad = {sp = c.error, style = 'undercurl'},
    SpelunkerComplexOrCompoundWord = {sp = c.error, style = 'undercurl'},

    -- CleverF
    CleverFChar = {fg = c.error}, -- error messages on the command line
    CleverFCursor = {link = 'CleverFChar'}, -- error messages on the command line

    -- nvim-cmp
    CmpItemAbbrMatch = {link = 'Directory'},
    CmpItemAbbrMatchFuzzy = {link = 'Operator'},
    CmpItemAbbrDeprecated = {link = 'Comment'},

    CmpItemKindDefault = {link = 'Directory'},

    CmpItemKindText = {link = 'String'},
    CmpItemKindMethod = {link = 'Function'},
    CmpItemKindFunction = {link = 'Function'},
    CmpItemKindConstructor = {link = 'NonText'},
    CmpItemKindField = {link = 'Statement'},
    CmpItemKindVariable = {link = 'Error'},
    CmpItemKindClass = {link = 'Operator'},
    CmpItemKindInterface = {link = 'Type'},
    -- CmpItemKindModule = {link = ''},
    CmpItemKindProperty = {link = 'Statement'},
    CmpItemKindUnit = {link = 'Number'},
    CmpItemKindValue = {link = 'Number'},
    CmpItemKindEnum = {link = 'Operator'},
    -- CmpItemKindKeyword = {link = ''},
    -- CmpItemKindSnippet = {link = ''},
    -- CmpItemKindColor = {link = ''},
    CmpItemKindFile = {link = 'Directory'},
    -- CmpItemKindReference = {link = ''},
    CmpItemKindFolder = {link = 'Directory'},
    -- CmpItemKindEnumMember = {link = ''},
    CmpItemKindConstant = {link = 'Constant'},
    CmpItemKindStruct = {link = 'Type'},
    -- CmpItemKindEvent = {link = ''},
    CmpItemKindOperator = {link = 'Operator'},
    -- CmpItemKindTypeParameter = {link = ''},


    -- Nvim TS Rainbow
    rainbowcol1 = {fg = c.light.red},
    rainbowcol2 = {fg = c.light.green},
    rainbowcol3 = {fg = c.light.teal},
    rainbowcol4 = {fg = c.light.magenta},
    rainbowcol5 = {fg = c.light.cyan},
    rainbowcol6 = {fg = c.light.yellow},
    rainbowcol7 = {fg = c.light.blue},
    -- LuaFormatter on
  }

  M.active_scheme = scheme

  return scheme
end

return M
