return {
        "akinsho/toggleterm.nvim",
        version = "*", -- Optional: specify a version, or use "*" for latest
        config = function()
            require("toggleterm").setup({
                size = 20,                  -- Height for horizontal terminal, width for vertical
                open_mapping = [[<C-\>]],   -- Key mapping to toggle the terminal
                hide_numbers = true,        -- Hide line numbers in terminal buffers
                shade_filetypes = {},
                shade_terminals = true,
                shading_factor = 2,         -- Terminal shading level (1 = dark, 3 = light)
                direction = "float",        -- "horizontal", "vertical", "tab", or "float"
                float_opts = {
                    border = "curved",      -- Border style for floating terminal
                },
            })
        end,
    }
