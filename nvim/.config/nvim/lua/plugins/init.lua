return {
    {
        "christoomey/vim-tmux-navigator",
        lazy = false,
    },

    { -- Adds git related signs to the gutter, as well as utilities for managing changes
        "lewis6991/gitsigns.nvim",
        opts = {
            signs = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
            },
        },
    },

    {
        "nvimtools/none-ls.nvim",
        dependencies = {
            "nvimtools/none-ls-extras.nvim",
        },

        config = function()
            return require "configs.none-ls"
        end,
    },

    {
        "stevearc/conform.nvim",
        event = "BufWritePre", -- format on save
        opts = require "configs.conform",
    },

    {
        "williamboman/mason.nvim",
        opts = require "configs.mason",
    },

    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile", "BufWritePre" },
        opts = {
            diagnostics = {
                update_in_insert = true,
            },
        },
        config = function()
            return require "configs.lspconfig"
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufWritePre", "BufNewFile" },
        opts = require "configs.treesitter",
    },
}
