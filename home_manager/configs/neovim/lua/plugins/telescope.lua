local telescope = require("telescope")
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")

telescope.setup({
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close,
                -- For some reason I have these memorised now despite them
                -- being annoying but it also kinda makes sense so whatever.
                ["<C-B>"] = actions.file_split, -- bottom
                ["<C-S>"] = actions.file_vsplit, -- side
            },
        },
        layout_strategy = "center",
        layout_config = {
            mirror = true
        },
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden"
        }
    }
})

vim.keymap.set("n", "<leader>ff",
    function()
        builtin.find_files({
            find_command = { 'bfs', '-type', 'f' },
            hidden = true,
        })
    end
)

vim.keymap.set("n", "<leader>fg", function() builtin.git_files() end)
vim.keymap.set("n", "<leader>fh", function() builtin.help_tags() end)
vim.keymap.set("n", "<leader>fH", function() builtin.highlights() end)
vim.keymap.set("n", "<leader>fc", function() builtin.commands() end)
vim.keymap.set("n", "<leader>fb", function() builtin.buffers() end)
vim.keymap.set("n", "<leader>ft", function() builtin.live_grep() end)
