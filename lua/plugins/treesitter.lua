return {
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
    },

    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter-textobjects").setup({
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                        ["al"] = "@loop.outer",
                        ["il"] = "@loop.inner",
                        ["ai"] = "@conditional.outer",
                        ["ii"] = "@conditional.inner",
                    },
                },
            })

            local select = require("nvim-treesitter-textobjects.select")
            local modes = { "x", "o" }

            vim.keymap.set(modes, "af", function() select.select_textobject("@function.outer", "textobjects") end, { desc = "Select around function" })
            vim.keymap.set(modes, "if", function() select.select_textobject("@function.inner", "textobjects") end, { desc = "Select inside function" })
            vim.keymap.set(modes, "ac", function() select.select_textobject("@class.outer", "textobjects") end, { desc = "Select around class" })
            vim.keymap.set(modes, "ic", function() select.select_textobject("@class.inner", "textobjects") end, { desc = "Select inside class" })
            vim.keymap.set(modes, "al", function() select.select_textobject("@loop.outer", "textobjects") end, { desc = "Select around loop" })
            vim.keymap.set(modes, "il", function() select.select_textobject("@loop.inner", "textobjects") end, { desc = "Select inside loop" })
            vim.keymap.set(modes, "ai", function() select.select_textobject("@conditional.outer", "textobjects") end, { desc = "Select around conditional" })
            vim.keymap.set(modes, "ii", function() select.select_textobject("@conditional.inner", "textobjects") end, { desc = "Select inside conditional" })
        end,
    }
}
