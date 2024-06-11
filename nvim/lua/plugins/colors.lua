return {
    {
        "dracula/vim",
        name = "dracula",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("dracula")

            -- use default terminal background color
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        end,
    },
}
