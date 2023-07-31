-- KEYMAPS FILE
--  Vim custom keymaps

-- Copy and paste from clipboard
vim.keymap.set({ 'n', 'x' }, 'cp', '"+y')
vim.keymap.set({ 'n', 'x' }, 'cv', '"+p')
-- Delete without storing it on clipboard
vim.keymap.set('n', 'x', '"_x')
-- Vim file explore
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
