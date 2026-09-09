return {
    -- 1. إضافة ثيم One Dark Pro
    {
        "olimorris/onedarkpro.nvim",
        priority = 1000,
        lazy = false,
        config = function()
            require("onedarkpro").setup({
                styles = {
                    methods = "bold",
                    strings = "italic",
                    comments = "italic",
                },
                options = {
                    cursorline = true,
                }
            })
            pcall(vim.cmd, "colorscheme onedarkpro")
        end,
    },

    -- 2. إضافة محرك التلوين Treesitter (كودك الحالي الشغال)
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local config = require("nvim-treesitter.config")

            config.setup({
                ensure_installed = { 
                    "python", "typescript", "tsx", "javascript", "lua", "vim", "vimdoc" 
                },
                highlight = { enable = true },
                indent = { enable = true }
            })

            -- أمر تشغيل التلوين التلقائي لـ Neovim 0.11+
            vim.api.nvim_create_autocmd("FileType", {
                callback = function()
                    local buf = vim.api.nvim_get_current_buf()
                    local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
                    if lang then
                        pcall(vim.treesitter.start, buf, lang)
                    end
                end,
            })
        end,
    }
}

