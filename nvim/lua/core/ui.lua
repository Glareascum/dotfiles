-- UI
--  Manage all UI customizations

local U = {}

-- Apply theme
function U.apply_theme (themeName)
	vim.opt.termguicolors = true
	vim.cmd.colorscheme(themeName)
end

return U
