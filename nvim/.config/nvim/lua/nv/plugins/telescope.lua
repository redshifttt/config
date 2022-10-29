local telescope = require('telescope')
local builtin = require('telescope.builtin')
local map = vim.keymap.set

telescope.setup {
    defaults = {
        prompt_prefix = "> ",
        layout_config = {
            horizontal = {
                width = 0.9
            }
        }
    }
}

map("n", "<leader>th", function() builtin.help_tags() end)
map("n", "<leader>tH", function() builtin.highlights() end)
map("n", "<leader>tm", function() builtin.man_pages() end)
map("n", "<leader>tf", function() builtin.find_files() end)
-- map("n", "<leader>tc", function() builtin.command_history() end)
