-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Treat .tfstate as JSON for syntax highlighting and formatting
vim.filetype.add({
  extension = {
    tfstate = "json",
  },
})

-- Format buffer with jq
vim.api.nvim_create_user_command("FormatJq", function()
  vim.cmd("%!jq .")
end, { desc = "Pretty-print JSON with jq" })
