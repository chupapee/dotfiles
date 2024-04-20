return {
	'nvim-telescope/telescope.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim',
		--'nvim-telescope/telescope-file-browser.nvim',
		"nvim-telescope/telescope-fzf-native.nvim",
      		build = "make",
		config = function()
			require("telescope").load_extension("fzf")
		end,
	},
	lazy = false,
	cmd = 'Telescope',
	config = function()
		require('telescope').setup({
			defaults = {
				layout_strategy = "horizontal",
				layout_config = { prompt_position = "top" },
				sorting_strategy = 'ascending',
				winblend = 0,
			},
		})
	end,
	keys = {
		{
			'<leader>p',
			function() require('telescope.builtin').find_files() end,
		},
		{
			'<leader>w',
			function()
				require('telescope.builtin').grep_string({
					search = vim.cmd 'Telescope live_grep'
				})
			end,
		},
		{
            '<leader>l',
            '<cmd>Telescope file_browser<cr>',
        }
	},
}
