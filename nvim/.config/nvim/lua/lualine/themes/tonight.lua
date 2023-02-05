local c = require("tonight.colours")
local darker_than_bg = c.background_n1

return {
    normal = {
        a = {
            bg = darker_than_bg,
            fg = c.magenta,
            gui = "bold"
        },
        b = {
            bg = darker_than_bg,
        },
        c = {
            bg = darker_than_bg,
        },
        x = {
            bg = darker_than_bg,
        },
        z = {
            bg = darker_than_bg,
            fg = c.white
        }
    },
    insert = {
        a = {
            bg = darker_than_bg,
            fg = c.green,
            gui = "bold"
        },
        b = {
            bg = darker_than_bg,
        },
        c = {
            bg = darker_than_bg,
        },
        x = {
            bg = darker_than_bg,
        },
        z = {
            bg = darker_than_bg,
            fg = c.white
        }
    },
    visual = {
        a = {
            bg = darker_than_bg,
            fg = c.yellow,
            gui = "bold"
        },
        b = {
            bg = darker_than_bg,
        },
        c = {
            bg = darker_than_bg,
        },
        x = {
            bg = darker_than_bg,
        },
        z = {
            bg = darker_than_bg,
            fg = c.white
        }
    },
    replace = {
        a = {
            bg = darker_than_bg,
            fg = c.red,
            gui = "bold"
        },
        b = {
            bg = darker_than_bg,
        },
        c = {
            bg = darker_than_bg,
        },
        x = {
            bg = darker_than_bg,
        },
        z = {
            bg = darker_than_bg,
            fg = c.white
        }
    },
    -- I think since laststatus=3 this doesn't matter since you can't even see
    -- the COMMAND when the statusline disappears
    command = {
        a = {
            bg = darker_than_bg,
            fg = c.red,
            gui = "bold"
        },
        b = {
            bg = darker_than_bg,
        },
        c = {
            bg = darker_than_bg,
        },
        x = {
            bg = darker_than_bg,
        },
        z = {
            bg = darker_than_bg,
            fg = c.white
        }
    },
    inactive = { -- This might be the same as above
        a = { bg = darker_than_bg },
        b = { bg = darker_than_bg },
        c = { bg = darker_than_bg },
        x = { bg = darker_than_bg },
        z = { bg = darker_than_bg }
    }
}
