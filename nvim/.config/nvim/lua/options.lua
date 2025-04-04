require "nvchad.options"

local opt = vim.o

opt.cursorlineopt = "both"
opt.relativenumber = true
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.ignorecase = true
opt.smartcase = true
opt.list = true
vim.opt.listchars:append { eol = "↵", tab = "» ", trail = "·", nbsp = "␣" }

-- After startup
vim.schedule(function()
    opt.clipboard = "unnamedplus"
end)
