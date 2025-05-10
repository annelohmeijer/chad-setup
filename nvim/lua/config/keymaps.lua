-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- leader+w to close buffer without closing the window
vim.api.nvim_set_keymap("n", "<leader>w", ":bp|bd#<CR>", { noremap = true, silent = true })

-- telescope
vim.keymap.set("n", "<leader><leader>", function()
  require("telescope.builtin").find_files({ hidden = true })
end, { desc = "Find files inluding hidden", noremap = true, silent = true })
vim.keymap.set("n", "<leader>sg", function()
  require("telescope.builtin").live_grep()
end, { desc = "Live grep (including hidden)", noremap = true, silent = true })

-- lazydocker

vim.keymap.set(
  "n",
  "<leader>k",
  "<Cmd>lua LazyDocker.toggle()<CR>",
  { desc = "Toggle LazyDocker", noremap = true, silent = true }
)

vim.api.nvim_create_user_command("ReloadConfig", function()
  for name, _ in pairs(package.loaded) do
    if name:match("^config") then
      package.loaded[name] = nil
    end
  end
  dofile(vim.fn.stdpath("config") .. "/init.lua")
  print("Config reloaded!")
end, {})

-- markdown
vim.keymap.set("n", "<leader>xt", function()
  local line = vim.api.nvim_get_current_line()
  if line:find("%- %[ %]") then
    line = line:gsub("%- %[ %]", "- [x]")
  elseif line:find("%- %[x%]") then
    line = line:gsub("%- %[x%]", "- [ ]")
  end
  vim.api.nvim_set_current_line(line)
end, { desc = "Toggle task checkbox" })
