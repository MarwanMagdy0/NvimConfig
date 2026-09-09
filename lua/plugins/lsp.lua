return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
    },

    config = function()
        -- Safe lookup for autocomplete capabilities
        local has_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
        local capabilities = has_cmp and cmp_lsp.default_capabilities() or vim.lsp.protocol.make_client_capabilities()

        -- 1. Modern TypeScript Config (Neovim 0.11 Style)
        vim.lsp.config("ts_ls", {
            cmd = { "typescript-language-server", "--stdio" },
            capabilities = capabilities,
        })
        vim.lsp.enable("ts_ls")

        -- 2. Modern Termux Python Config (Neovim 0.11 Style)
        local termux_bin = os.getenv("PREFIX") .. "/bin/pyright-langserver"

        vim.lsp.config("pyright", {
            cmd = { termux_bin, "--stdio" },
            capabilities = capabilities,
            settings = {
                python = {
                    analysis = {
                        autoSearchPaths = true,
                        useLibraryCodeForTypes = true,
                        typeCheckingMode = "basic",
                        indexing = true,
                        extraPaths = {
                            os.getenv("PREFIX") .. "/lib/python3.14/site-packages",
                        }
                    },
                },
            },
        })
        vim.lsp.enable("pyright")
    end,
}

