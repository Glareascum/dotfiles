-- OPTIONS FILE
--  Vim generic configurations
--  - .opt functions access to the vim's global and local options, equivalent to set
--  - .g functions access to the vim's global variable
--  - .cmd functions access to the vim's ex commands
--  Ref: https://neovim.io/doc/user/lua-guide.html

-- Normal line numbers
vim.opt.nu = true
-- Relative line numbers
vim.opt.relativenumber = true
-- Mouse usage
vim.opt.mouse = 'a'
-- Smartcase
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- Wrap the lines to make them always visible and preserve indentation
vim.opt.wrap = true
vim.opt.breakindent = true
-- Number of space a tab use, default is 8
vim.opt.tabstop = 4
-- Indentation space used
vim.opt.shiftwidth = 4
-- Leader key
vim.g.mapleader = ' '
-- Syntax off
vim.g.synax = 'off'
-- Keep a number of lines always visible while scrolling
vim.opt.scrolloff = 8
