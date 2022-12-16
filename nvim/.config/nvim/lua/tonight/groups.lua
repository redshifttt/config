local c = require('tonight.colours')

local groups = {
    -- Treesitter slowly attempting to replace all the things
    ['@variable'] = {
        fg = c.white
    },
    ['@parameter'] = {
        fg = c.white
    },
    ['@variable.builtin'] = {
        fg = c.white
    },
    ['@field'] = {
        fg = c.red
    },
    ['@text.bracket'] = {
        fg = c.white
    },
    -- ['@punctuation.bracket.lua'] = {
    --     fg = c.gray,
    -- },
    ['@punctuation.bracket'] = {
        fg = c.background_05,
    },
    ['@constructor'] = {
        fg = c.background_05
    },
    ['@operator'] = {
        fg = c.white
    },
    ['@keyword'] = {
        fg = c.magenta
    },
    ['@repeat'] = {
        fg = c.magenta
    },
    ['@conditional'] = {
        fg = c.magenta
    },
    ['@include'] = {
        fg = c.magenta
    },
    ['@preproc'] = {
        fg = c.gray
    },
    ['@string'] = {
        fg = c.green
    },
    ['@function'] = {
        fg = c.blue
    },
    ['@method.call'] = {
        fg = c.blue
    },
    ['@function.builtin'] = {
        fg = c.blue
    },
    ['@boolean'] = {
        fg = c.orange
    },
    ['@comment'] = {
        fg = c.background_05
    },
    ['@text.title'] = {
        fg = c.white,
        bold = true,
    },
    ['@text.literal'] = {
        fg = c.white,
    },
    ['@type'] = {
        fg = c.yellow
    },
    ['@structure'] = {
        link = "@type"
    },
    ['@storageclass'] = {
        link = "@type"
    },
    ['@constant'] = {
        fg = c.orange
    },
    ['@number'] = {
        fg = c.orange
    },

    Comment = { link = "@comment" },

    -- All TS* are deprecated now.
    -- TSCharacter = { fg = c.green },
    -- TSConstant = { fg = c.orange },
    -- TSConditional = { fg = c.magenta },
    -- TSFunction = { fg = c.blue },
    -- TSFuncBuiltin = { link = "TSFunction" },
    -- TSFunctionCall = { link = "TSFunction" },
    -- TSInclude = { fg = c.magenta },
    -- TSKeyword = { fg = c.magenta },
    -- TSKeywordFunction = { link = "TSKeyword" },
    -- TSMethod = { fg = c.blue },
    -- TSNumber = { fg = c.orange },
    -- TSParameter = { fg = c.white },
    -- TSProperty = { fg = c.white },
    -- TSPunctSpecial = { fg = c.red },
    -- TSPunctDelimiter = { link = "TSPunctSpecial" },
    -- TSRepeat = { fg = c.magenta },
    -- TSString = { fg = c.green },
    -- TSStringEscape = { link = "TSPunctSpecial" },
    -- TSStringRegex = { link = "TSPunctSpecial" },
    -- TSText = { fg = c.white },
    -- TSTitle = { fg = c.white, bold = true },
    -- TSType = { fg = c.yellow },
    -- TSURI = {
    --     fg = c.blue,
    --     underline = true,
    -- },
    -- TSVariableBuiltin = { link = "@variable" },
    -- TSNamespace = { fg = c.blue },
    -- TSTodo = {
    --     fg = c.background,
    --     bg = c.magenta,
    -- },

    StatusLine = { bg = c.background_n1 },

    -- ColorColumn = { bg = c.gray },
    Constant = { link = "@constant" },
    Cursor = { bg = c.white },
    CursorLine = { bg = c.background_02 },
    CursorLineNr = { link = "CursorLine" },
    EndOfBuffer = { fg = c.background },
    Error = {
        fg = "#000000",
        bg = c.red,
        bold = true,
    },
    ErrorMsg = { link = "Error" },
    FoldColumn = { fg = c.background_02 },
    Folded = { fg = c.background_02 },
    LineNr = { fg = c.background_04 },
    SignColumn = { bg = c.background },
    Visual = { bg = c.background_03 },
    VisualNOS = { link = "Visual" },
    WarningMsg = { link = "ErrorMsg" },
    Whitespace = { link = "@comment" },
    Pmenu = { bg = c.background_03 },
    -- nvim-cmp selection highlight group
    PmenuSel = {
        bg = c.background_04,
        fg = c.white,
    },
    Directory = { fg = c.blue },
    MatchParen = {
        fg = c.magenta,
        bold = true,
    },
    Normal = { fg = c.white },
    NormalFloat = { link = "Normal" },
    NormalNC = { link = "Normal" },
    Special = { link = "TSPunctSpecial" },
    SpecialChar = { link = "TSPunctSpecial" },
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

    --- Plugins:
    IndentBlanklineChar = { fg = c.background_03 },

    CmpItemAbbrDeprecated = { link = "Error" },
    CmpItemAbbrMatch = { fg = c.blue },
    CmpItemAbbrMatchFuzzy = { link = "CmpItemAbbrMatch" },

    CmpItemKindVariable = { link = "@variable" },
    CmpItemKindInterface = { link = "CmpItemKindVariable" }, -- idk what an interface is
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

    -- Telescope
    TelescopePromptCounter = { fg = c.blue },

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
    bashTSVariable = { link = "@variable" },

    -- Help
    helpCommand = { fg = c.red },
    helpExample = { fg = c.white }
}

return groups
