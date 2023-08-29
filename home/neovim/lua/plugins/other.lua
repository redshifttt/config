-- misc configs that don't need their own files

-- toggleterm
local toggleterm = require("toggleterm")

toggleterm.setup({ shade_terminals = false })

vim.keymap.set("n", "<leader>T", "<cmd>ToggleTerm<cr>")

-- indent-blankline
vim.g.indent_blankline_filetype_exclude = {
    'help',
    'man',
    'glowpreview'
}

-- autopairs
local autopairs = require("nvim-autopairs")

autopairs.setup({
    enable_check_bracket_line = false,
    ignored_next_char = "[%w%.]" -- will ignore alphanumeric and `.` symbol
})
