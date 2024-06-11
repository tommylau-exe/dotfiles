return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("lspconfig").sourcekit.setup({})
        end,
    },
}
