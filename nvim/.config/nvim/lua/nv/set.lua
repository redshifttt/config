local g = vim.g
local set = vim.opt

-- Turn off a bunch of shit, still gets sourced on startup unfortunately
g.loaded_python_provider = 0
g.loaded_python3_provider = 0
g.loaded_node_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-- Globals --

g.mapleader = " "

-- Settings --

set.title = true

-- Disable mouse
set.mouse = ""

set.encoding = "utf-8"

set.number = true
set.relativenumber = true

set.hidden = false

set.splitbelow = true
set.splitright = true

set.magic = true
set.hlsearch = false
set.incsearch = true
set.ignorecase = true
set.smartcase = true
set.showmatch = true

set.errorbells = true
set.visualbell = true

set.backup = false
set.writebackup = false
set.swapfile = false

-- This is what you need to be able to turn tabs into spaces (expandtab)
set.expandtab = true
set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4

set.showmode = false
-- fileformats defaults to unix,dos on linux
-- set.fileformats = "unix,dos,mac"

set.termguicolors = true

set.scrolloff = 20
set.sidescrolloff = 20

set.undofile = true

set.showcmd = true

set.conceallevel = 0
set.shortmess:append("I")

set.wrap = false

set.list = true
set.listchars = {
    nbsp = "¬",
    tab = "→·",
    trail = "-",
    extends = ">",
}

set.laststatus = 3
set.winbar = "%n %f %m"

-- not sure how much i like this
-- set.clipboard:append("unnamedplus")

-- Always display the signcolumn for LSP reasons
set.signcolumn = "yes"

set.cmdheight = 0
