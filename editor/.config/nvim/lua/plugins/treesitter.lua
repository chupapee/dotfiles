return {
	'nvim-treesitter/nvim-treesitter',
	'nvim-treesitter/playground',
	run = ':TSUpdate',
	config = function()
		require'nvim-treesitter.configs'.setup {
			  ensure_installed = { "typescript", "javascript", "typescirptreact", "javascriptreact", "python", "lua", "vim",  },
			  sync_install = false,
			  auto_install = true,
			  highlight = { enable = true },
		}
	end,
}
