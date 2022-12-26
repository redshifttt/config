local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.setup {
    defaults = {
        prompt_prefix = "> ",
        layout_config = {
            vertical = { width = 0.5 },
        },
        layout_strategy = "vertical"
    }
}

-- [f]ind
vim.keymap.set("n", "<leader>fh", function() builtin.help_tags() end)
vim.keymap.set("n", "<leader>fH", function() builtin.highlights() end)
vim.keymap.set("n", "<leader>fm", function() builtin.man_pages() end)
vim.keymap.set("n", "<leader>ff", function() builtin.find_files() end)
vim.keymap.set("n", "<leader>fc", function() builtin.commands() end)
vim.keymap.set("n", "<leader>fC", function() builtin.command_history() end)
vim.keymap.set("n", "<leader>fb", function() builtin.buffers() end)
vim.keymap.set("n", "<leader>fs", function() builtin.live_grep() end)

-- [g]it
vim.keymap.set("n", "<leader>gf", function() builtin.git_files() end)
