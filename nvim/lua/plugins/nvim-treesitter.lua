return {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",  -- Automatically update Tree-sitter parsers
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "go", "lua", "bash" },  -- Add other languages as needed
                highlight = {
                    enable = true,            -- Enable Tree-sitter-based highlighting
                    additional_vim_regex_highlighting = false,
                },
            })
        end,
    }
