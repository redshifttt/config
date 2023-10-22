-- misc configs that don't need their own files

-- toggleterm
local toggleterm = require("toggleterm")

toggleterm.setup({ shade_terminals = false })

vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<cr>")

-- indent-blankline
-- require("ibl").setup({
--     config = {
--         indent = {
--             char = "▏"
--         },
--         exclude = {
--             filetypes = { 'glowpreview' }
--         }
--     }
-- })

-- oil
vim.keymap.set("n", "<leader>o", function() require("oil").open() end)
