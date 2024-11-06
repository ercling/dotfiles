return {
    {
        "Mofiqul/vscode.nvim",
        config = function()
            -- Optional: Configure the colorscheme settings
            vim.o.background = "dark" -- or "light" for light mode
            require("vscode").setup({
                -- Enable transparent background
                transparent = false,

                -- Enable italic comments
                italic_comments = true,

                -- Disable nvim-tree background color
                disable_nvimtree_bg = true,
                
                -- Override other highlight groups
                color_overrides = {
                    vscLineNumber = "#FFFFFF",
                },
                group_overrides = {
                    -- this supports setting the custom color directly
                    Cursor = { fg = "#FF0000", bg = "#FFFFFF", bold = true },
                },
            })

            -- Activate the colorscheme
            require("vscode").load()
        end,
    },
}

