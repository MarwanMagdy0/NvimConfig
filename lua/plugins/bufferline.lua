return {
    {
        "akinsho/bufferline.nvim",
        version = "*",
        lazy = false,

        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },

        opts = {
            options = {
                separator_style = "thin",
                show_buffer_close_icons = false,
                show_close_icon = false,
                always_show_bufferline = true,
            },
        },

        keys = {
            { "<Tab>", "<Cmd>BufferLineCycleNext<CR>" },
            { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>" },
            { "<leader>bd", "<Cmd>bdelete<CR>" },
        },
    },
}
