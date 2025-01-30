-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- leader+w to close buffer without closing the window
vim.api.nvim_set_keymap("n", "<leader>w", ":bp|bd#<CR>", { noremap = true, silent = true })

-- telescope
vim.keymap.set("n", "<leader><leader>", ":Telescope find_files<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>sg", ":Telescope live_grep<CR>", { noremap = true, silent = true })
