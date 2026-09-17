vim.g.mapleader = " "

-- 1. التأكد التلقائي من تثبيت وتشغيل lazy.nvim بشكل سليم
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
    change_detection = {
        enabled = true,
        notify = false,
    },
})

require("config.options")
require("config.keymaps")
vim.opt.clipboard = "unnamedplus"

vim.keymap.set({'n', 'v'}, 'd', '"_d', { noremap = true })
vim.keymap.set({'n', 'v'}, 'c', '"_c', { noremap = true })
vim.keymap.set({'n', 'v'}, 'x', '"_x', { noremap = true })
vim.cmd("colorscheme onedark")
vim.opt.scrolloff = 4 
