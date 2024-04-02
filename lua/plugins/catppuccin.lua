---@type LazySpec
return {
    {
        "catppuccin/nvim",
        as = "catppuccin",
        config = function()
        require("catppuccin").setup {
            flavour = "mocha", -- latte, frappe, macchiato, mocha
            background = { -- :h background
            light = "latte",
            dark = "mocha",
            },
        transparent_background = false,
        show_end_of_buffer = false, -- show the '~' characters after the end of buffers
        term_colors = false,
        dim_inactive = {
            enabled = true,
            shade = "dark",
            percentage = 0.15,
        },
        no_italic = false, -- Force no italic
        no_bold = false, -- Force no bold 
        }
        end,
    },
}
