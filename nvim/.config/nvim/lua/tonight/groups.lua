local c = require('tonight.colours')
local util = require('tonight.util')

local groups = {
    -- Treesitter slowly attempting to replace all the things
    TSBoolean = { fg = c.orange },
    TSCharacter = { fg = c.green },
    TSComment = { fg = c.gray },
    TSConstant = { fg = c.orange },
    TSConstructor = { fg = c.gray },
    TSConditional = { fg = c.magenta },
    TSField = { fg = c.red },
    TSFunction = { fg = c.blue },
    TSFuncBuiltin = { link = "TSFunction" },
    TSFunctionCall = { link = "TSFunction" },
    TSInclude = { fg = c.magenta },
    TSKeyword = { fg = c.magenta },
    TSKeywordFunction = { link = "TSKeyword" },
    TSMethod = { fg = c.blue },
    TSNumber = { fg = c.orange },
    TSOperator = { fg = c.magenta },
    TSParameter = { fg = c.white },
    TSProperty = { fg = c.white },
    TSPunctBracket = { fg = c.white },
    TSPunctSpecial = { fg = c.red },
    TSPunctDelimiter = { link = "TSPunctSpecial" },
    TSRepeat = { fg = c.magenta },
    TSString = { fg = c.green },
    TSStringEscape = { link = "TSPunctSpecial" },
    TSStringRegex = { link = "TSPunctSpecial" },
    TSText = { fg = c.white },
    TSTitle = { fg = c.white, bold = true },
    TSType = { fg = c.yellow },
    -- TSURI = {
    --     fg = c.blue,
    --     underline = true,
    -- },
    TSVariable = { fg = c.white },
    TSVariableBuiltin = { link = "TSVariable" },
    TSNamespace = { fg = c.blue },
    TSTodo = {
        fg = c.background,
        bg = c.magenta,
    },

    -- ColorColumn = { bg = c.gray },
    Comment = { link = "TSComment" },
    Constant = { link = "TSConstant" },
    Cursor = { bg = c.white },
    CursorLine = { bg = c.background_02 },
    CursorLineNr = { link = "CursorLine" },
    EndOfBuffer = { fg = c.background },
    Error = {
        fg = "#000000",
        bg = c.red,
        bold = true,
        underline = true,
    },
    ErrorMsg = { link = "Error" },
    FoldColumn = { fg = c.background_02 },
    Folded = { fg = c.background_02 },
    LineNr = { fg = c.gray },
    SignColumn = { bg = c.background },
    VertSplit = { link = "TSComment" },
    Visual = { bg = c.background_03 },
    VisualNOS = { link = "Visual" },
    WarningMsg = { link = "ErrorMsg" },
    Whitespace = { link = "TSComment" },
    -- NormalFloat = { bg = c.background_02 },
    Pmenu = { bg = c.background_03 },
    -- nvim-cmp selection highlight group
    PmenuSel = {
        bg = c.background_04,
        fg = c.white,
    },
    -- Identifier = { fg = c.magenta },
    -- Delimiter = { fg = c.gray },
    Directory = { fg = c.blue },
    -- IncSearch = { bg = c.yellow, fg = c.background },
    -- Macro = { fg = c.magenta },
    MatchParen = {
        fg = c.yellow,
        underline = true,
    },
    -- ModeMsg = { fg = c.white },
    -- MoreMsg = { fg = c.blue },
    -- NonText = { fg = c.white },
    Normal = {
        fg = c.white,
        bg = c.background
    },
    NormalFloat = {
        fg = c.white,
        bg = c.background_02,
    },
    NormalNC = { fg = c.white },
    -- PreProc = { fg = c.blue },
    -- Question = { fg = c.blue },
    -- QuickFixLine = { bg = c.highlight },
    -- Repeat = { fg = c.magenta },
    -- Search = { bg = c.yellow, fg = c.background },
    Special = { link = "TSPunctSpecial" },
    SpecialChar = { link = "TSPunctSpecial" },
    -- Statement = { fg = c.magenta },
    -- Structure = { fg = c.magenta },
    -- Substitute = { bg = c.red, fg = c.background },
    Text = { link = "TSText" },
    Title = { link = "TSTitle" },
    Todo = { link = "TSTodo" },
    Type = { link = "TSType" },
    -- WinBarNC = {
    --     fg = c.gray
    -- },

    -- LSP
    DiagnosticError = { fg = c.lsp_error },
    DiagnosticHint = { fg = c.lsp_hint },
    DiagnosticInfo = { fg = c.lsp_info },
    DiagnosticWarn = { fg = c.lsp_warn },

    DiagnosticsUnderlineWarning = {
        undercurl = true,
        fg = c.lsp_warn,
    },
    DiagnosticsUnderlineError = {
        undercurl = true,
        fg = c.lsp_error,
    },
    DiagnosticsUnderlineHint = {
        undercurl = true,
        fg = c.lsp_hint,
    },
    DiagnosticsUnderlineInformation = {
        undercurl = true,
        fg = c.lsp_info,
    },

    DiagnosticFloatingError = { fg = c.lsp_error },
    DiagnosticFloatingHint = { fg = c.lsp_hint },
    DiagnosticFloatingInfo = { fg = c.lsp_info },
    DiagnosticFloatingWarn = { fg = c.lsp_warn },

    -- LSP inline floating messages
    DiagnosticVirtualTextError = {
        fg = c.lsp_error,
        bg = c.background_02,
    },
    DiagnosticVirtualTextHint = {
        fg = c.lsp_hint,
        bg = c.background_02,
    },
    DiagnosticVirtualTextInfo = {
        fg = c.lsp_info,
        bg = c.background_02,
    },
    DiagnosticVirtualTextWarn = {
        fg = c.lsp_warn,
        bg = c.background_02,
    },

    DiagnosticSignError = { fg = c.lsp_error },
    DiagnosticSignHint = { fg = c.lsp_hint },
    DiagnosticSignInfo = { fg = c.lsp_info },
    DiagnosticSignWarn = { fg = c.lsp_warn },

    --- Plugins:
    IndentBlanklineChar = { fg = c.background_03 },

    CmpItemAbbrDeprecated = { link = "Error" },
    CmpItemAbbrMatch = { fg = c.blue },
    CmpItemAbbrMatchFuzzy = { link = "CmpItemAbbrMatch" },

    CmpItemKindVariable = { link = "TSVariable" },
    CmpItemKindInterface = { link = "CmpItemKindVariable" }, -- idk what an interface is
    CmpItemKindText = { link = "CmpItemKindVariable" },

    CmpItemKindFunction = { link = "TSFunction" },
    CmpItemKindMethod = { link = "CmpItemKindFunction" },

    CmpItemKindKeyword = { link = "TSKeyword" },
    CmpItemKindProperty = { link = "CmpItemKindKeyword" },
    CmpItemKindUnit = { link = "CmpItemKindKeyword" },

    CmpItemKindField = { link = "TSField" },
    CmpItemKindConstructor = { link = "TSConstructor" },
    CmpItemKindConstant = { link = "TSConstant" },
    CmpItemKindOperator = { link = "TSOperator" },

    -- Missing kinds:
    CmpItemKindClass = { fg = c.yellow },
    CmpItemKindValue = { link = "TSVariable" },
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

    -- Telescope

    --- Filetypes:
    -- for when you use nvim as your manpager :^)
    manOptionDesc = { fg = c.red },
    manSectionHeading = { fg = c.magenta },
    manSubheading = { fg = c.magenta },
    manHeader = { fg = c.white },

    markdownH1Delimiter = { fg = c.background_01 },
    markdownH2Delimiter = { fg = c.background_01 },
    markdownH3Delimiter = { fg = c.background_01 },
    markdownH4Delimiter = { fg = c.background_01 },
    markdownH5Delimiter = { fg = c.background_01 },
    markdownH6Delimiter = { fg = c.background_01 },
    markdownH1 = { link = "TSTitle" },
    markdownH2 = { link = "TSTitle" },
    markdownH3 = { link = "TSTitle" },
    markdownH4 = { link = "TSTitle" },
    markdownH5 = { link = "TSTitle" },
    markdownH6 = { link = "TSTitle" },
    markdownListMarker = { fg = c.magenta },
    markdownUrl = {
        fg = c.blue,
        underline = true,
    },
    markdownCode = { fg = c.white },

    bashTSParameter = { fg = c.white },
    bashTSVariable = { link = "TSVariable" },

    -- Help
    -- helpHyperTextEntry = { link = "TSURI" },
    -- helpURL = { link = "TSURI" },
    helpCommand = { fg = c.red },
    helpExample = { fg = c.white }
}

return groups
