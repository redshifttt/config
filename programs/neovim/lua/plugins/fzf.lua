local fzf = require("fzf-lua")

fzf.setup({
    previewers = {
        git_diff = { pager = "delta --width=$FZF_PREVIEW_COLUMNS" }
    }
})

vim.keymap.set("n", "<leader>ff", function() fzf.files({ cmd = "bfs -type f" }) end)
vim.keymap.set("n", "<leader>fg", function() fzf.git_files() end)
vim.keymap.set("n", "<leader>fh", function() fzf.help_tags() end)
vim.keymap.set("n", "<leader>fH", function() fzf.highlights() end)
vim.keymap.set("n", "<leader>fc", function() fzf.commands() end)
vim.keymap.set("n", "<leader>fb", function() fzf.buffers() end)
vim.keymap.set("n", "<leader>ft", function() fzf.live_grep() end)
vim.keymap.set("n", "<leader>fo", function() fzf.oldfiles() end)
