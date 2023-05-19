local c = require('tonight.colours')

local groups = {
    -- Editor-specific.
    -- *Statement: any statement
    -- =========================
    --  Conditional: if, then, else, endif, switch, etc.
    --  Repeat: for, do, while, etc.
    --  Label: case, default, etc.
    --  Operator: "sizeof", "+", "*", etc.
    --  Keyword: any other keyword
    --  Exception: try, catch, throw
    --
    -- *PreProc: generic Preprocessor
    -- ==============================
    --  Include: preprocessor #include
    --  Define: preprocessor #define
    --  Macro: same as Define
    --  PreCondit: preprocessor #if, #else, #endif, etc.
    --
    -- *Type: int, long, char, etc.
    -- ============================
    --  StorageClass: static, register, volatile, etc.
    --  Structure: struct, union, enum, etc.
    --  Typedef: A typedef
    --
    -- *Special: any special symbol
    -- ============================
    --  SpecialChar: special character in a constant
    --  Tag: you can use CTRL-] on this
    --  Delimiter: character that needs attention
    --  SpecialComment: special things inside a comment
    --  Debug: debugging statements
    --
    -- *Underlined: text that stands out, HTML links
    --
    -- *Ignore: left blank, hidden  |hl-Ignore|
    --
    -- *Error: any erroneous construct
    --
    -- *Todo: anything that needs extra attention; mostly the keywords TODO FIXME and XXX
    --
    -- More info :h group-name
    --
    -- Format:
    -- VimSyntaxGroup = whatever
    -- ['@treesitter.group'] = link to VimSyntaxGroup
    -- ['@lsp.group'] = link to VimSyntaxGroup

    -- Comments
    Comment = { fg = c.background_05 }, -- any comment
    ['@comment'] = { link = "Comment" },
    ["@lsp.type.comment"] = { link = "Comment" },

    -- Constants
    Constant = { fg = c.yellow },
    ['@constant'] = { link = "Constant" },
    String = { fg = c.green }, -- a string constant: "this is a string"
    ['@string'] = { link = "String" },
    Character = { fg = c.red }, -- a character constant: 'c', '\n'
    Number = { fg = c.yellow }, -- a number constant: 234, 0xff
    ['@number'] = { link = "Number" },
    Boolean = { fg = c.yellow }, -- a boolean constant: TRUE, false
    ['@boolean'] = { link = "Boolean" },
    Float = { fg = c.yellow }, -- a floating point constant: 2.3e10
    ['@float'] = { link = "Float" },

    -- Identifiers
    Identifier = { fg = c.white }, -- any variable name
    ['@variable'] = { link = "Identifier" },
    ['@variable.builtin'] = { link = "Identifier" },
    ['@variable.type'] = { link = "Identifier" },
    ["@lsp.type.variable"] = { link = "Identifier" },
    Function = { fg = c.blue }, -- function name (also: methods for classes)
    ['@function'] = { link = "Function" },
    ['@method'] = { link = "Function" },
    ['@method.call'] = { link = "Function" },
    ['@function.builtin'] = { link = "Function" },
    ["@lsp.type.method"] = { link = "Function" },
    ["@lsp.type.function"] = { link = "Function" },

    -- Statements
    Statement = { fg = c.magenta }, -- any statement
    Conditional = { fg = c.magenta }, -- if, then, else, endif, switch, etc.
    ['@conditional'] = { link = "Conditional" },
    Repeat = { fg = c.magenta }, -- for, do, while, etc.
    ['@repeat'] = { link = "Repeat" },
    Label = { fg = c.magenta }, -- case, default, etc.
    ['@label'] = { link = "Label" },

    -- Normal UI highlighting
    -- ColorColumn: Used for the columns set with 'colorcolumn'.
    -- Conceal: Placeholder characters substituted for concealed text (see 'conceallevel').
    -- CurSearch: Used for highlighting a search pattern under the cursor (see 'hlsearch').
    -- Cursor: Character under the cursor.
    -- lCursor: Character under the cursor when 'language-mapping' is used (see 'guicursor').
    -- CursorColumn: Screen-column at the cursor, when 'cursorcolumn' is set.
    -- CursorLine: Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    -- Directory: Directory names (and other special names in listings).
    -- DiffAdd: Diff mode: Added line. 'diff.txt'
    -- DiffChange: Diff mode: Changed line. 'diff.txt'
    -- DiffDelete: Diff mode: Deleted line. 'diff.txt'
    -- DiffText: Diff mode: Changed text within a changed line. 'diff.txt'
    -- EndOfBuffer: Filler lines (~) after the end of the buffer. By default, this is highlighted like 'hl-NonText'.
    -- TermCursor: Cursor in a focused terminal.
    -- TermCursorNC: Cursor in an unfocused terminal.
    -- ErrorMsg: Error messages on the command line.
    -- WinSeparator: Separators between window splits.
    -- Folded: Line used for closed folds.
    -- FoldColumn: 'foldcolumn'
    -- SignColumn: Column where 'signs' are displayed.
    -- IncSearch: 'incsearch' highlighting; also used for the text replaced with ":s///c".
    -- Substitute: ':substitute' replacement text highlighting.
    -- LineNr: Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    -- LineNrAbove: Line number for when the 'relativenumber' option is set, above the cursor line.
    -- LineNrBelow: Line number for when the 'relativenumber' option is set, below the cursor line.
    -- CursorLineNr: Like LineNr when 'cursorline' is set and 'cursorlineopt' contains "number" or is "both", for the cursor line.
    -- CursorLineFold: Like FoldColumn when 'cursorline' is set for the cursor line.
    -- CursorLineSign: Like SignColumn when 'cursorline' is set for the cursor line.
    -- MatchParen: Character under the cursor or just before it, if it is a paired bracket, and its match. 'pi_paren.txt'
    -- ModeMsg: 'showmode' message (e.g., "-- INSERT --").
    -- MsgArea: Area for messages and cmdline.
    -- MsgSeparator: Separator for scrolled messages 'msgsep'.
    -- MoreMsg: 'more-prompt'
    -- NonText: '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also 'hl-EndOfBuffer'.
    -- Normal: Normal text.
    -- NormalFloat: Normal text in floating windows.
    -- FloatBorder: Border of floating windows.
    -- FloatTitle: Title of floating windows.
    -- NormalNC: Normal text in non-current windows.
    -- Pmenu: Popup menu: Normal item. (used by nvim-cmp)
    -- PmenuSel: Popup menu: Selected item. (used by nvim-cmp)
    -- PmenuKind: Popup menu: Normal item "kind". (used by nvim-cmp)
    -- PmenuKindSel: Popup menu: Selected item "kind". (used by nvim-cmp)
    -- PmenuExtra: Popup menu: Normal item "extra text". (used by nvim-cmp)
    -- PmenuExtraSel: Popup menu: Selected item "extra text". (used by nvim-cmp)
    -- PmenuSbar: Popup menu: Scrollbar. (used by nvim-cmp)
    -- PmenuThumb: Popup menu: Thumb of the scrollbar. (used by nvim-cmp)
    -- Question: 'hit-enter' prompt and yes/no questions.
    -- QuickFixLine: Current 'quickfix' item in the quickfix window. Combined with 'hl-CursorLine' when the cursor is there.
    -- Search: Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    -- SpecialKey: Unprintable characters: Text displayed differently from what it really is. But not 'listchars' whitespace. 'hl-Whitespace'
    -- SpellBad: Word that is not recognized by the spellchecker. 'spell' Combined with the highlighting used otherwise.
    -- SpellCap: Word that should start with a capital. 'spell' Combined with the highlighting used otherwise.
    -- SpellLocal: Word that is recognized by the spellchecker as one that is used in another region. 'spell' Combined with the highlighting used otherwise.
    -- SpellRare: Word that is recognized by the spellchecker as one that is hardly ever used. 'spell' Combined with the highlighting used otherwise.
    -- StatusLine: Status line of current window.
    -- StatusLineNC: Status lines of not-current windows. Note: If this is equal to "StatusLine", Vim will use "^^^" in the status line of the current window.
    -- TabLine: Tab pages line, not active tab page label.
    -- TabLineFill: Tab pages line, where there are no labels.
    -- TabLineSel: Tab pages line, active tab page label.
    -- Title: Titles for output from ":set all", ":autocmd" etc.
    -- Visual: Visual mode selection.
    -- VisualNOS: Visual mode selection when vim is "Not Owning the Selection".
    -- WarningMsg: Warning messages.
    -- Whitespace: "nbsp", "space", "tab", "multispace", "lead" and "trail" in 'listchars'.
    -- WildMenu: Current match in 'wildmenu' completion.
    -- WinBar: Window bar of current window.
    -- WinBarNC: Window bar of not-current windows.

    ColorColumn = { bg = c.red },
    Cursor = { bg = c.white },
    CursorLine = { bg = c.background_02 },
    CursorLineNr = { link = "CursorLine" },

    -- Diff
    DiffAdd = { fg = c.green },
    DiffChange = { fg = c.yellow },
    DiffDelete = { fg = c.red },
    EndOfBuffer = { fg = c.background },
    Error = { -- Same as LSP virtual text
        fg = c.lsp_error,
        bg = "#1F1418",
        bold = true
    },
    ErrorMsg = { link = "Error" },
    FoldColumn = { fg = c.background_02 },
    Folded = { fg = c.background_02 },
    LineNr = { fg = c.background_04 },
    SignColumn = { bg = c.background },
    StatusLine = { bg = c.background_n1 },
    Visual = { bg = c.background_03 },
    VisualNOS = { link = "Visual" },
    WarningMsg = { link = "ErrorMsg" },
    Whitespace = { fg = c.background_03 },
    Pmenu = { bg = c.background_03 },
    Directory = { fg = c.blue },
    MatchParen = {
        fg = c.yellow,
        bold = true,
    },
    -- Normal has to have a background for vim.notify notifications
    Normal = {
        fg = c.white,
        bg = c.background,
    },
    NormalFloat = { bg = c.background_n1 },
    NormalNC = { link = "Normal" },
    Special = { fg = c.red },
    Text = { link = "TSText" },
    Title = { link = "TSTitle" },
    Todo = { link = "TSTodo" },
    Type = { link = "TSType" },
    WinSeparator = { fg = c.gray },

    -- LSP
    DiagnosticError = { fg = c.lsp_error },
    DiagnosticHint = { fg = c.lsp_hint },
    DiagnosticInfo = { fg = c.lsp_info },
    DiagnosticWarn = { fg = c.lsp_warn },

    DiagnosticsUnderlineError = { link = "DiagnosticError" },
    DiagnosticsUnderlineHint = { link = "DiagnosticHint" },
    DiagnosticsUnderlineInformation = { link = "DiagnosticInfo" },
    DiagnosticsUnderlineWarning = { link = "DiagnosticWarn" },

    DiagnosticFloatingError = { link = "DiagnosticError" },
    DiagnosticFloatingHint = { link = "DiagnosticHint" },
    DiagnosticFloatingInfo = { link = "DiagnosticInfo" },
    DiagnosticFloatingWarning = { link = "DiagnosticWarn" },

    -- LSP inline floating messages
    DiagnosticVirtualTextError = {
        fg = c.lsp_error,
        bg = "#1F1418",
        bold = true
    },
    DiagnosticVirtualTextHint = {
        fg = c.lsp_hint,
        bg = "#1B1D22",
    },
    DiagnosticVirtualTextInfo = {
        fg = c.lsp_info,
        bg = "#131924",
    },
    DiagnosticVirtualTextWarn = {
        fg = c.lsp_warn,
        bg = "#181825",
    },

    DiagnosticSignError = { fg = c.lsp_error },
    DiagnosticSignHint = { fg = c.lsp_hint },
    DiagnosticSignInfo = { fg = c.lsp_info },
    DiagnosticSignWarn = { fg = c.lsp_warn },

    ---------------
    --- PLUGINS ---
    ---------------

    -- LSP completion
    CmpItemAbbrDeprecated = { link = "Error" },
    CmpItemAbbrMatch = { fg = c.blue },
    CmpItemAbbrMatchFuzzy = { link = "CmpItemAbbrMatch" },

    CmpItemKindVariable = { link = "@variable" },
    CmpItemKindInterface = { link = "CmpItemKindVariable" },
    CmpItemKindText = { link = "CmpItemKindVariable" },

    CmpItemKindFunction = { link = "TSFunction" },
    CmpItemKindMethod = { link = "CmpItemKindFunction" },

    CmpItemKindField = { link = "TSField" },
    CmpItemKindConstructor = { link = "TSConstructor" },
    CmpItemKindConstant = { link = "TSConstant" },

    -- Statement
    CmpItemKindOperator = { link = "@operator" },
    CmpItemKindKeyword = { link = "@keyword" },
    CmpItemKindProperty = { link = "CmpItemKindKeyword" },
    CmpItemKindUnit = { link = "CmpItemKindKeyword" },

    -- Missing kinds:
    CmpItemKindClass = { fg = c.yellow },
    CmpItemKindValue = { link = "@variable" },
    CmpItemKindModule = { link = "CmpItemKindClass" },
    CmpItemKindEnum = { link = "CmpItemKindClass" },
    CmpItemKindEnumMember = { link = "CmpItemKindEnum" },
    CmpItemKindStruct = { link = "CmpItemKindClass" },
    CmpItemKindTypeParameter = { fg = c.yellow },
    -- CmpItemKindSnippet = {},
    -- CmpItemKindColor = {},
    -- CmpItemKindFile = {},
    -- CmpItemKindReference = {},
    CmpItemKindFolder = { fg = c.teal },
    -- CmpItemKindEvent = {},

    CmpItemMenu = { bg = c.background_02 },
    --
    -- nvim-cmp selection highlight group
    PmenuSel = {
        bg = c.background_04,
        fg = c.white,
    },

    -- telescope.nvim
    TelescopePromptCounter = { fg = c.blue },
    TelescopeBorder = { fg = c.gray },
    TelescopeTitle = { fg = c.white },

    -- fidget.nvim
    FidgetTitle = {
        fg = c.magenta,
        bold = true
    },
    FidgetTask = { link = "@comment" },

    -----------------
    --- FILETYPES ---
    -----------------

    -- manpages
    manOptionDesc = { fg = c.red },
    manSectionHeading = { fg = c.magenta },
    manSubheading = { fg = c.magenta },
    manHeader = { fg = c.white },
    manReference = {
        fg = c.white,
        bold = true,
        underline = true
    },

    -- Markdown
    markdownH1Delimiter = { fg = c.background_01 },
    markdownH2Delimiter = { fg = c.background_01 },
    markdownH3Delimiter = { fg = c.background_01 },
    markdownH4Delimiter = { fg = c.background_01 },
    markdownH5Delimiter = { fg = c.background_01 },
    markdownH6Delimiter = { fg = c.background_01 },
    markdownH1 = { link = "@text.title" },
    markdownH2 = { link = "@text.title" },
    markdownH3 = { link = "@text.title" },
    markdownH4 = { fg = c.white },
    markdownH5 = { fg = c.white },
    markdownH6 = { fg = c.white },
    markdownListMarker = { fg = c.magenta },
    markdownUrl = {
        fg = c.blue,
        underline = true,
    },
    markdownCode = { fg = c.white },

    -- Help
    helpCommand = { fg = c.red },
    helpExample = { fg = c.white },

    -- Treesitter
    ['@parameter'] = { fg = c.white },

    ['@text.bracket'] = { fg = c.white },
    ['@punctuation.bracket'] = { fg = c.background_05, },
    ['@constructor'] = { fg = c.background_05 },
    ['@operator'] = { fg = c.white },
    ['@keyword'] = { fg = c.magenta },
    ['@include'] = { fg = c.magenta },
    ['@preproc'] = { fg = c.gray },

    ['@text.title'] = {
        fg = c.white,
        bold = true,
    },
    ['@text.literal'] = { fg = c.white, },
    ['@type'] = { fg = c.yellow },
    ['@structure'] = { link = "@type" },
    ['@storageclass'] = { link = "@type" },

    -- Python
    ['@constructor.python'] = {
        fg = c.yellow
    },

    -- HTML
    ['@tag.html'] = {
        fg = c.red
    },
    ['@tag.delimiter.html'] = {
        fg = c.gray
    },
    ['@tag.attribute.html'] = {
        fg = c.yellow
    },
}

return groups
