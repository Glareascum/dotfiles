-- LAZY
--  Install, load the lazy plugin manager
--  Load all plugins

local lazy = {}

function lazy.install(path)
	if not vim.loop.fs_stat(path) then
		print('Installing lazy.nvim....')
		vim.fn.system({
			'git',
			'clone',
			'--filter=blob:none',
			'https://github.com/folke/lazy.nvim.git',
			'--branch=stable', -- latest stable release
			path,
		})
	end
end

function lazy.setup(plugins)
	-- Install lazy if not already installed
	lazy.install(lazy.path)

	-- Prepend the lazy path to the runtime path
	vim.opt.rtp:prepend(lazy.path)
	require('lazy').setup(plugins, lazy.opts)
end

-- Path where lazy will be installed. See stdpath through :echo stdpath('data')
lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = {}

-- Plugins
lazy.setup({
	-- Nordic color scheme
	{
		'AlexvZyl/nordic.nvim',
		branch = 'dev',
	},
	-- Tokyonight color scheme
	{
		'folke/tokyonight.nvim',
	},
	-- Onedark color scheme
	{
		'navarasu/onedark.nvim'
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000
	},
	-- Lualine for statusbar
	{
		'nvim-lualine/lualine.nvim',
		config = function() require 'plugins.lualine' end
	},
	-- Trouble for showing errors
	{
		'folke/trouble.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function() require 'plugins.trouble' end,
	},
	-- Treesitter for syntax highlighting
	{
		'nvim-treesitter/nvim-treesitter',
		cmd = { 'TSInstall', 'TSBufEnable', 'TSBufDisable', 'TSModuleInfo' },
		build = { ':TSUpdate' },
		event = { 'BufRead' },
		config = function() require 'plugins.treesitter' end,
	},
	-- Telescope for fuzzy finder
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim' },
		cmd = 'Telescope',
		event = { 'BufRead' },
		config = function() require 'plugins.telescope' end,
	},
	-- Lspconfig for language server
	{
		'neovim/nvim-lspconfig',
		--event = { 'User NvimStartupDone' },
		config = function() require 'plugins.lspconfig' end,
	},
	-- Cmp for autocompletion
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			'hrsh7th/cmp-omni',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'saadparwaiz1/cmp_luasnip',
			{
				'L3MON4D3/LuaSnip',
				dependencies = { 'rafamadriz/friendly-snippets' },
				build = 'make install_jsregexp',
			},
		},
		--event = { 'User NvimStartupDone' },
		config = function() require 'plugins.cmp' end,
	},
})
