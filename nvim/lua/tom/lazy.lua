-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy /lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
    "plugins",
    {
        -- include treesitter modules when built from source
        performance = {
            rtp = {
                paths = { "/usr/local/lib64/nvim/" },
            },
        },
        -- use unicode symbols
        ui = {
            icons = {
                cmd = "⌘",
                config = "🛠",
                event = "📅",
                ft = "📂",
                init = "⚙",
                keys = "🗝",
                plugin = "🔌",
                runtime = "💻",
                require = "🌙",
                source = "📄",
                start = "🚀",
                task = "📌",
                lazy = "💤 ",
            },
        },
    }
)

vim.keymap.set("n", "<leader>l", vim.cmd.Lazy)
