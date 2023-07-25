-- CMP PLUGIN

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
