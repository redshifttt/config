local option = vim.opt

-- Settings --

option.title = true

-- Disable mouse
option.mouse = ""

option.encoding = "utf-8"

option.number = true
-- set.relativenumber = true
vim.cmd("set relativenumber nonu")

option.hidden = false

option.splitbelow = true
option.splitright = true

option.magic = true
option.hlsearch = true
option.incsearch = true
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
option.shiftwidth = 4
option.softtabstop = 4

option.showmode = false
-- fileformats defaults to unix,dos on linux
-- set.fileformats = "unix,dos,mac"

option.termguicolors = true

option.scrolloff = 20
option.sidescrolloff = 20

option.undofile = true

option.showcmd = true

option.conceallevel = 0
option.shortmess:append("I")

option.wrap = false

option.list = true
option.listchars = {
    nbsp = "¬",
    tab = "→·",
    trail = "-",
    extends = ">",
}

option.laststatus = 3
option.winbar = "%n %f %m"

-- not sure how much i like this
-- set.clipboard:append("unnamedplus")

-- Always display the signcolumn for LSP reasons
option.signcolumn = "yes"

option.cmdheight = 0

option.guicursor = "" -- fat cursor mmm
