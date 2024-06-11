return {
    {
        "ibhagwan/fzf-lua",
        dependencies = {
            { "junegunn/fzf", build = "./install --bin" },
        },
        keys = {
            { "<leader>ff", "<cmd>FzfLua files<cr>" },
            { "<leader>fg", "<cmd>FzfLua git_files<cr>" },
            { "<leader>ft", "<cmd>FzfLua live_grep<cr>" },
            { "<leader>b", "<cmd>FzfLua buffers<cr>" },
        },
    },
    {
        "mbbill/undotree",
        keys = {
            { "<leader>u", "<cmd>UndotreeToggle<cr>" },
        },
    },
}
