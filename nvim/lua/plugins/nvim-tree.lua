return {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons" -- optional, for file icons
        },
        config = function()
            require("nvim-tree").setup({
                -- Optional settings for customization
                view = {
                    width = 30, -- width of the tree sidebar
                },
                renderer = {
                    group_empty = true,
                },
                filters = {
                    dotfiles = false, -- Set to true to hide dotfiles
                },
            })
        end,
    }
