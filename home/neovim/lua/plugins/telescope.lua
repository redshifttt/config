local telescope = require('telescope')
local builtin = require('telescope.builtin')
local action_state = require('telescope.actions.state')

telescope.setup {}

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

-- Zettelkasten management
vim.keymap.set("n", "<leader>zF",
    function()
        builtin.find_files {
            prompt_title = "Search for zettels via their file names",
            results_title = "Zettels",
        }
    end,
{ desc = "Fuzzy find zettels via their file names" })

vim.keymap.set("n", "<leader>zf",
    function()
        builtin.live_grep {
            prompt_title = "Search for zettels via their content",
            results_title = "Zettels",
            -- default_mappings = {
            --     i = {
            --         ["CTRL_F"] = "<cmd>lua vim.fn.expand(\"%\")<cr>"
            --     }
            -- }
        }
    end,
{ desc = "Fuzzy find zettels via their file contents" })

vim.keymap.set("n", "<leader>zl",
    function()
        local file_name = vim.fn.expand("%:t")
        builtin.grep_string {
            prompt_title = "Search for zettels that link here",
            results_title = "Zettels",
            search = file_name,
        }
    end,
{ desc = "Fuzzy find zettels that link to current opened zettel" })
