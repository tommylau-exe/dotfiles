return {
    "tpope/vim-surround",
    "tpope/vim-repeat",
    {
        "tpope/vim-fugitive",
        keys = {
            { "<leader>g", "<cmd>Git<cr>" },
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                auto_install = true,
                ensure_installed = {
                    "swift",
                    "markdown",
                    -- should be installed by default
                    "c",
                    "lua",
                    "vim",
                    "vimdoc",
                    "query",
                },
                highlight = { enable = true },
                indent = { enable = true },
                sync_install = false,
            })
        end,
    },
}
