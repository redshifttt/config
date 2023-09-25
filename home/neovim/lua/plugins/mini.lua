require('mini.indentscope').setup()
require('mini.ai').setup()
require('mini.tabline').setup()
require('mini.splitjoin').setup()
require('mini.align').setup()
require('mini.pairs').setup()
require('mini.comment').setup()
require('mini.cursorword').setup()

-- TODO: set background colour to existing HL group
-- vim.api.nvim_set_hl(0, "MiniHipatternsFixme", { reverse = true })
require('mini.hipatterns').setup({
    highlighters = {
        fixme = { pattern = 'FIXME', group = 'MiniHipatternsFixme' },
        hack  = { pattern = 'HACK', group = 'MiniHipatternsHack' },
        todo  = { pattern = 'TODO', group = 'MiniHipatternsTodo' },
        note  = { pattern = 'NOTE', group = 'MiniHipatternsNote' },

        hex_color = require('mini.hipatterns').gen_highlighter.hex_color(),
    },
})

require('mini.surround').setup({
    mappings = {
        add = 'gs', -- Add surrounding in Normal and Visual modes
        delete = 'gsd', -- Delete surrounding
        replace = 'gsr', -- Replace surrounding
    },
})
