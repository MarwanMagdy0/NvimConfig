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

-- 2. تشغيل lazy.nvim مع استيراد مجلد plugins بشكل صحيح وعميق
require("lazy").setup({
    spec = {
        { import = "plugins" }, -- يضمن قراءة أي ملف نضعه داخل lua/plugins/ تلقائياً
    },
    change_detection = {
        enabled = true, -- يجعله يلمح أي ملف تعدله أو تضيفه فوراً دون مشاكل
        notify = false,
    },
})

-- 3. تحميل بقية الإعدادات الخاصة بك
require("config.options")
require("config.keymaps")
vim.opt.clipboard = "unnamedplus"
vim.cmd("colorscheme onedark")
