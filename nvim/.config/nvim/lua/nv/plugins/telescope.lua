local telescope = require('telescope')
local builtin = require('telescope.builtin')
local map = vim.keymap.set

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
map("n", "<leader>fh", function() builtin.help_tags() end)
map("n", "<leader>fH", function() builtin.highlights() end)
map("n", "<leader>fm", function() builtin.man_pages() end)
map("n", "<leader>ff", function() builtin.find_files() end)
map("n", "<leader>fc", function() builtin.commands() end)
map("n", "<leader>fC", function() builtin.command_history() end)
map("n", "<leader>fb", function() builtin.buffers() end)
map("n", "<leader>fs", function() builtin.live_grep() end)

-- [g]it
map("n", "<leader>gf", function() builtin.git_files() end)
