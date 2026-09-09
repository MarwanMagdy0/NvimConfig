vim.g.mapleader = " "

vim.opt.rtp:prepend(
    vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
)

require("lazy").setup("plugins")

require("config.options")
require("config.keymaps")
vim.opt.clipboard = "unnamedplus"

