return {
	'nvim-lualine/lualine.nvim',
	event = "VeryLazy",
	config = function()
		require('lualine').setup({
			sections = {
				lualine_x = {},
			},
		})
	end
}
