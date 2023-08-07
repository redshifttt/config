local telescope = require('telescope')
local builtin = require('telescope.builtin')
local action_state = require('telescope.actions.state')

telescope.setup {}

vim.keymap.set("n", "<leader>t", "<cmd>Telescope<cr>")

vim.keymap.set("n", "<leader>fh", function() builtin.help_tags() end, { desc = "Find help tags" })
vim.keymap.set("n", "<leader>fm", function() builtin.man_pages() end, { desc = "Find man pages" })
vim.keymap.set("n", "<leader>ff", function() builtin.find_files() end, { desc = "Find files recursively" })
vim.keymap.set("n", "<leader>fc", function() builtin.commands() end, { desc = "Find commands" })
vim.keymap.set("n", "<leader>fb", function() builtin.buffers() end, { desc = "Find buffers" })
vim.keymap.set("n", "<leader>ft", function() builtin.live_grep() end, { desc = "Find text" })

vim.keymap.set("n", "<leader>gf", function() builtin.git_files() end, { desc = "Find git files" })
