-- misc configs that don't need their own files

-- indent-blankline
require("ibl").setup({
    indent = {
        char = "▏"
    },
    exclude = {
        filetypes = { 'glowpreview' }
    }
})

-- oil
vim.keymap.set("n", "<leader>o", function() require("oil").open() end)
