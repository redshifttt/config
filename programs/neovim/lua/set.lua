-- Settings --

vim.opt.title = true

-- Disable mouse
vim.opt.mouse = ""

vim.opt.number = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.magic = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmatch = true

vim.opt.errorbells = true
vim.opt.visualbell = true

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- This is what you need to be able to turn tabs into spaces (expandtab)
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4 -- this is for autoindenting
vim.opt.softtabstop = 4

vim.opt.termguicolors = true

vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10

vim.opt.undofile = true

vim.opt.conceallevel = 0

vim.opt.wrap = false

vim.opt.list = true
vim.opt.listchars = { nbsp = "¬", tab = "→·", trail = "-", extends = ">" }

vim.opt.laststatus = 3
vim.opt.winbar = "%n %F %m"

vim.opt.signcolumn = "yes"

vim.opt.cmdheight = 1

vim.opt.guicursor = ""
