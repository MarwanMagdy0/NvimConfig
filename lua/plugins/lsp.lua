return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp", -- Crucial: gives Neovim LSP the autocomplete features
    },

    config = function()
        -- 1. Get the autocomplete capabilities from nvim-cmp
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- 2. Your Existing TypeScript Config
        vim.lsp.config("ts_ls", {
            cmd = { "typescript-language-server", "--stdio" },
            capabilities = capabilities, -- Pass capabilities here too!
        })
        vim.lsp.enable("ts_ls")

        -- 3. New Python Config (Pyright)
        vim.lsp.config("pyright", {
            cmd = { "pyright-langserver", "--stdio" },
            capabilities = capabilities, -- Feeds Python options to your popup menu
        })
        vim.lsp.enable("pyright")
    end,
}

