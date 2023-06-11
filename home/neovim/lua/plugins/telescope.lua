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
vim.keymap.set("n", "<leader>fh", function() builtin.help_tags() end, { desc = "Find help tags" })
vim.keymap.set("n", "<leader>fH", function() builtin.highlights() end, { desc = "Find highlights" })
vim.keymap.set("n", "<leader>fm", function() builtin.man_pages() end, { desc = "Find man pages" })
vim.keymap.set("n", "<leader>ff", function() builtin.find_files() end, { desc = "Find files recursively" })
vim.keymap.set("n", "<leader>fc", function() builtin.commands() end, { desc = "Find commands" })
vim.keymap.set("n", "<leader>fC", function() builtin.command_history() end, { desc = "Find commands in history" })
vim.keymap.set("n", "<leader>fb", function() builtin.buffers() end, { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fs", function() builtin.live_grep() end, { desc = "Find words in files recursively" })

-- [g]it
vim.keymap.set("n", "<leader>gf", function() builtin.git_files() end, { desc = "Find git files" })
