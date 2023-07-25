-- Load options and keymap
require('core')

-- Install or load lazy plugin manager with all plugins
require('plugins.lazy')

-- UI module
local U =require('core.ui')
--  Choose theme
U.apply_theme('onedark')
