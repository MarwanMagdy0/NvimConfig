return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  -- We use config instead of opts so we can chain both setups together perfectly
  config = function()
    -- Initialize Mason core
    require("mason").setup()

    -- Initialize Mason-LSPConfig and tell it to auto-install Pyright
    require("mason-lspconfig").setup({
      ensure_installed = { "pyright" },
    })
  end,
}

