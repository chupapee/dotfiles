local darcula = {
	'briones-gabriel/darcula-solid.nvim',
	dependencies = {
		'rktjmp/lush.nvim',
	},
	config = function()
		--vim.cmd.colorscheme 'darcula-solid'
		vim.cmd 'set termguicolors'
	end
}

local tokyonight = {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		vim.cmd.colorscheme 'tokyonight-night'
	end
}

return {
	darcula,
	tokyonight
}
