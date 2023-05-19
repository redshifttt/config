local c = require('midnight.colours')

local groups = {
    -- Semantic highlighting:
    -- What everything is so far:
    -- ==========================
    --
    -- @lsp.type.property -- table keys

    -- Treesitter slowly attempting to replace all the things
    ['@variable'] = { fg = c.white },
    ['@parameter'] = { fg = c.white },
    ['@variable.builtin'] = { link = "@variable" },
    ['@variable.type'] = { link = "@variable" },
    ['@field'] = { fg = c.red },
    ['@text.bracket'] = { fg = c.white },
    ['@punctuation.bracket'] = { fg = c.background_05, },
    ['@constructor'] = { fg = c.background_05 },
    ['@operator'] = { fg = c.white },
    ['@keyword'] = { fg = c.magenta },
    ['@repeat'] = { fg = c.magenta },
    ['@conditional'] = { fg = c.magenta },
    ['@include'] = { fg = c.magenta },
    ['@preproc'] = { fg = c.gray },
    ['@string'] = { fg = c.green },
    ['@function'] = { fg = c.blue },
    ['@method'] = { link = "@function" },
    ['@method.call'] = { link = "@function" },
    ['@function.builtin'] = { link = "@function" },
    ['@boolean'] = { fg = c.orange },
    ['@comment'] = { fg = c.background_05 },
    ['@text.title'] = {
        fg = c.white,
        bold = true,
    },
    ['@text.literal'] = { fg = c.white, },
    ['@type'] = { fg = c.yellow },
    ['@structure'] = { link = "@type" },
    ['@storageclass'] = { link = "@type" },
    ['@constant'] = { fg = c.orange },
    ['@number'] = { fg = c.yellow_darker },
    ['@property'] = { link = "@field" },

    -- Editor-specific
    Comment = { link = "@comment" },
    ColorColumn = { bg = c.red },
    Constant = { link = "@constant" },
    Cursor = { bg = c.white },
    CursorLine = { bg = c.background_01 },
    CursorLineNr = { link = "CursorLine" },
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
    LineNr = { fg = c.background_02 },
    SignColumn = { bg = c.background },
    StatusLine = { bg = c.background_n1 },
    Visual = { bg = c.background_03 },
    VisualNOS = { link = "Visual" },
    WarningMsg = { link = "ErrorMsg" },
    Whitespace = { fg = c.background_03 },
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

    -----------------
    --- LANGUAGES ---
    -----------------

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
