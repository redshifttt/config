-- misc configs that don't need their own files

-- toggleterm
local toggleterm = require("toggleterm")

toggleterm.setup({ shade_terminals = false })

vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<cr>")

-- indent-blankline
vim.g.indent_blankline_filetype_exclude = {
    'help',
    'man',
    'glowpreview'
}

-- oil
vim.keymap.set("n", "<leader>o", function() require("oil").open() end)
