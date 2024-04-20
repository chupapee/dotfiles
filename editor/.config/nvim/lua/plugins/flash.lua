local labels = 'netsidarhol/m?f;cu,w'

return {
	"folke/flash.nvim",
	event = "VeryLazy",
  	---@type Flash.Config
  	opts = {
		labels = labels,
		search = {
			multi_window = true,
			forward = true,
			wrap = true,
			mode = 'exact',
			incremental = false,
			filetype_exclude = { 'notify', 'noice' },
			trigger = '',
    	},
		jump = {
			jumplist = true,
			pos = 'start', ---@type "start" | "end" | "range"
			history = false,
			register = false,
			nohlsearch = false,
			autojump = true,
		},
		highlight = {
			backdrop = true,
			matches = true,
			priority = 5000,
			groups = {
				match = 'FlashMatch',
				current = 'FlashCurrent',
				backdrop = 'FlashBackdrop',
				label = 'FlashLabel',
			},
    	},
		modes = {
			-- enable flash for search
			search = { enabled = false, },
			char = { enabled = false, },
			treesitter = {
				labels = labels,
				jump = { pos = 'range' },
				highlight = { backdrop = false, matches = false, },
			},
		},
	},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}
