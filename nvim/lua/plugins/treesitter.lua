-- TREESITTER PLUGIN

require('nvim-treesitter.configs').setup {
	ensure_installed = {
		'lua',
		'bash',
	},
	auto_install = true,
	sync_install = true,
	highlight = { enable = true },
}
