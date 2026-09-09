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

        -- 3. Fixed Termux Python Config (Pyright)
        local termux_bin = os.getenv("PREFIX") .. "/bin/pyright-langserver"

        vim.lsp.config("pyright", {
            cmd = { termux_bin, "--stdio" },
            capabilities = capabilities,
            settings = {
                python = {
                    analysis = {
                        autoSearchPaths = true,
                        useLibraryCodeForTypes = true, -- Crucial for extracting types from installed libraries
                        typeCheckingMode = "basic",
                        -- Explicitly tell Pyright to index third-party packages for autocompletion
                        indexing = true, 
                        -- Force Pyright to recognize compiled binary submodules
                        extraPaths = {
                            os.getenv("PREFIX") .. "/lib/python3.11/site-packages", -- Change 3.11 to your exact python version if different
                        }
                    },
                },
            },
        })
        vim.lsp.enable("pyright")
    end,
}

