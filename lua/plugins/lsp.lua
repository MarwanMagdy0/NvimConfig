return {
    "neovim/nvim-lspconfig",

    config = function()
        vim.lsp.config("ts_ls", {
            cmd = { "typescript-language-server", "--stdio" },
        })

        vim.lsp.enable("ts_ls")
    end,
}
