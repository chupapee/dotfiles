return {
    'HiPhish/rainbow-delimiters.nvim',
    config = function()
        local rainbow_delimiters = require "rainbow-delimiters"
        vim.g.rainbow_delimiters = {
            strategy = {
              [""] = rainbow_delimiters.strategy["global"],
              vim = rainbow_delimiters.strategy["local"],
            },
            query = {
                [""] = "rainbow-delimiters",
                lua = "rainbow-parens",
                typescript = "rainbow-parens",
                javascript = "rainbow-parens",
                typescriptreact = "rainbow-parens",
                javascriptreact = "rainbow-parens",
                tsx = "rainbow-parens",
                jsx = "rainbow-parens",
            },
            highlight = {
                -- TODO: define these in colorscheme

                -- "TSRainbowRed",
                -- "TSRainbowBlue",
                -- "TSRainbowOrange",
                -- "TSRainbowCoral",
                -- "TSRainbowPink",
                -- "TSRainbowYellow",
                -- "TSRainbowViolet",
                -- "TSRainbowGreen",

                -- "RainbowDelimiterRed",
                -- "RainbowDelimiterYellow",
                -- "RainbowDelimiterBlue",
                -- "RainbowDelimiterOrange",
                -- "RainbowDelimiterGreen",
                -- "RainbowDelimiterViolet",
                -- "RainbowDelimiterCyan",
            },
        }
    end
}
