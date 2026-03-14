-- Load Lazy.nvim
vim.opt.rtp:prepend("~/.local/share/nvim/lazy/lazy.nvim")

require("lazy").setup({
    {
        "rebelot/kanagawa.nvim",
        name = "kanagawa",
        lazy = false,
        priority = 1000,
        config = function()
            require("kanagawa").setup({
                theme = "wave"
            })
            vim.cmd("colorscheme kanagawa")
        end
    }
})
