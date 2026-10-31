vim.g.mapleader = " "

-- Install and load lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

-- Plugin setup
require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
    change_detection = {
        enabled = true,
        notify = false,
    },
})

-- Load configuration
require("config.options")
require("config.keymaps")

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Custom keymaps
vim.keymap.set({ "n", "v" }, "d", '"_d', { noremap = true })
vim.keymap.set({ "n", "v" }, "c", '"_c', { noremap = true })
vim.keymap.set({ "n", "v" }, "x", '"_x', { noremap = true })

-- Colorscheme
vim.cmd("colorscheme onedark")

-- Scrolling
vim.opt.scrolloff = 4

-- Terminal mode
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { silent = true })
