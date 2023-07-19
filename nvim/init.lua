--
-- #################################################
-- ################# OPTIONS #######################
-- #################################################
--
-- Relative line numbers
vim.opt.relativenumber = true
-- Mouse usage
vim.opt.mouse = 'a'
--Ignorecase and smartcase
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- Wrap the lines to make them always visible and preserve indentation
vim.opt.wrap = true
vim.opt.breakindent = true
-- Number of space a tab use, default is 8
vim.opt.tabstop = 2
-- Indentation space used
vim.opt.shiftwidth = 2
-- Leader key
vim.g.mapleader = ' '
-- Syntax off
vim.g.synax = 'off'

--
-- #################################################
-- ################ KEY REMAP ######################
-- #################################################
--
-- Copy and paste from clipboard
vim.keymap.set({ 'n', 'x' }, 'cp', '"+y')
vim.keymap.set({ 'n', 'x' }, 'cv', '"+p')
-- Delete without storing it on clipboard
vim.keymap.set('n', 'x', '"_x')

--
-- #################################################
-- ################### LAZY ########################
-- #################################################
--
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
	-- You can "comment out" the line below after lazy.nvim is installed
	lazy.install(lazy.path)

	vim.opt.rtp:prepend(lazy.path)
	require('lazy').setup(plugins, lazy.opts)
end

--lazy.path = '~/.config/nvim/lazy/lazy.nvim'
lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = {}

-- Plugins
lazy.setup({
	{
		'AlexvZyl/nordic.nvim',
		branch = 'dev',
	},
	{
		'folke/tokyonight.nvim',
	},
	{
		'navarasu/onedark.nvim'
	},
	{
		'nvim-lualine/lualine.nvim',
	},
	{
		'glepnir/dashboard-nvim',
		event = 'VimEnter',
		dependencies = { { 'nvim-tree/nvim-web-devicons' } }
	},
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim' },
		cmd = 'Telescope',
	},
	{
		'NvChad/nvim-colorizer.lua',
	},
	{
		'folke/trouble.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
	},
	{
		'nvim-treesitter/nvim-treesitter',
		dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects', 'nvim-treesitter/playground' },
		event = { 'User NvimStartupDone' },
		build = { ':TSUpdate' },
	},
	{
		'neovim/nvim-lspconfig',
		event = { 'User NvimStartupDone' },
	},
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			'hrsh7th/cmp-omni',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'saadparwaiz1/cmp_luasnip',
			'L3MON4D3/LuaSnip',
		},
		event = { 'User NvimStartupDone' },
	},
})

-- Apply theme
vim.opt.termguicolors = true
vim.cmd.colorscheme('onedark')

--
-- #################################################
-- ################## LUALINE ######################
-- #################################################
--
require('lualine').setup({
	options = {
		icons_enabled = true,
		theme = 'onedark'
	}
})

--
-- #################################################
-- ################# DASHBOARD #####################
-- #################################################
--
require('dashboard').setup({
	theme = 'hyper',
	config = {
		packages = { enable = true },
	},
})

--
-- #################################################
-- ################# TELESCOPE #####################
-- #################################################
--
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

--
-- #################################################
-- ################## TROUBLE ######################
-- #################################################
--
require('trouble').setup({
	position = 'bottom',
	icons = true,
})

--
-- #################################################
-- ################ TREESITTER #####################
-- #################################################
--
require('nvim-treesitter.configs').setup({
	ensure_installed = {
		'lua',
		'rust',
		'yaml',
		'vim',
		'json',
		'regex',
		'bash',
		'markdown',
		'markdown_inline',
		'yaml',
		'kdl',
		'latex',
	},
	auto_install = true,
	highlight = { enable = true },
})

--
-- #################################################
-- ################ LSPCONFIG ######################
-- #################################################
--
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		-- Buffer local mappings.
		local opts = { buffer = ev.buf }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
		vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set('n', '<space>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
		vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
		vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		vim.keymap.set('n', '<space>f', function()
			vim.lsp.buf.format { async = true }
		end, opts)
	end,
})

local lsp_config = require 'lspconfig'
-- Bash
lsp_config.bashls.setup {}

-- Lua
lsp_config.lua_ls.setup {
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT',
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { 'vim' },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
}

--
-- #################################################
-- ################ CMP ############################
-- #################################################
--
local cmp = require 'cmp'
-- Extensions.
require('luasnip.loaders.from_vscode').lazy_load()

-- Default sources.
local sources = cmp.config.sources {
	{ name = 'path' },
	{ name = 'buffer' },
	{ name = 'luasnip' },
	{ name = 'nvim_lsp' },
}

local snippet = {
	expand = function(args) require('luasnip').lsp_expand(args.body) end,
}

local formatting = {
	fields = { 'kind', 'abbr' },
}

local window = {
	documentation = cmp.config.window.bordered()
}

local luasnip = require('luasnip')
local select_opts = { behavior = cmp.SelectBehavior.Select }
local mapping = {
	['<Up>'] = cmp.mapping.select_prev_item(select_opts),
	['<Down>'] = cmp.mapping.select_next_item(select_opts),

	['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
	['<C-n>'] = cmp.mapping.select_next_item(select_opts),

	['<C-u>'] = cmp.mapping.scroll_docs(-4),
	['<C-d>'] = cmp.mapping.scroll_docs(4),

	['<C-e>'] = cmp.mapping.abort(),
	['<C-y>'] = cmp.mapping.confirm({ select = true }),
	['<CR>'] = cmp.mapping.confirm({ select = false }),

	['<C-f>'] = cmp.mapping(function(fallback)
		if luasnip.jumpable(1) then
			luasnip.jump(1)
		else
			fallback()
		end
	end, { 'i', 's' }),

	['<C-b>'] = cmp.mapping(function(fallback)
		if luasnip.jumpable(-1) then
			luasnip.jump(-1)
		else
			fallback()
		end
	end, { 'i', 's' }),

	['<S-Tab>'] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_prev_item(select_opts)
		else
			fallback()
		end
	end, { 'i', 's' }),
}

cmp.setup {
	sources = sources,
	snippet = snippet,
	formatting = formatting,
	window = window,
	mapping = mapping
}


-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')["lua_ls"].setup {
	capabilities = capabilities
}
require('lspconfig')["bashls"].setup {
	capabilities = capabilities
}
