local option = vim.opt

-- Settings --

option.title = true

-- Disable mouse
option.mouse = ""

option.number = true
-- set.relativenumber = true
vim.cmd("set relativenumber nonu")

option.hidden = false

option.splitbelow = true
option.splitright = true

option.magic = true
option.ignorecase = true
option.smartcase = true
option.showmatch = true

option.errorbells = true
option.visualbell = true

option.backup = false
option.writebackup = false
option.swapfile = false

-- This is what you need to be able to turn tabs into spaces (expandtab)
option.expandtab = true
option.tabstop = 4
option.shiftwidth = 4 -- this is for autoindenting
option.softtabstop = 4

option.showmode = true

option.termguicolors = true

option.scrolloff = 9999
option.sidescrolloff = 9999

option.undofile = true

option.showcmd = true

option.conceallevel = 0

option.wrap = false

option.list = true
option.listchars = {
    nbsp = "¬",
    tab = "→·",
    trail = "-",
    extends = ">",
}

option.laststatus = 3
option.winbar = "%n %F %m"

option.signcolumn = "yes"

option.cmdheight = 1

option.guicursor = ""
