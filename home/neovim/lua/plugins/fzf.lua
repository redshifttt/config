local fzf = require("fzf-lua")

vim.keymap.set("n", "<leader>ff", function() fzf.files({ cmd = "bfs" }) end)
vim.keymap.set("n", "<leader>fh", function() fzf.help_tags() end)
vim.keymap.set("n", "<leader>fH", function() fzf.highlights() end)
vim.keymap.set("n", "<leader>fc", function() fzf.commands() end)
vim.keymap.set("n", "<leader>fb", function() fzf.buffers() end)
vim.keymap.set("n", "<leader>ft", function() fzf.live_grep() end)
vim.keymap.set("n", "<leader>fo", function() fzf.oldfiles() end)

vim.keymap.set("n", "<leader>gf", function() fzf.git_files() end)
