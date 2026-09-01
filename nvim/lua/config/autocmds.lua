-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Treat .tfstate as JSON for syntax highlighting and formatting
vim.filetype.add({
  extension = {
    tfstate = "json",
  },
})

-- Delete empty [No Name] buffers when a real file is opened
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    if vim.fn.expand("%") == "" then return end
    for _, b in ipairs(vim.api.nvim_list_bufs()) do
      if vim.api.nvim_buf_is_valid(b) and b ~= vim.api.nvim_get_current_buf() then
        local name = vim.api.nvim_buf_get_name(b)
        local lines = vim.api.nvim_buf_get_lines(b, 0, -1, false)
        if name == "" and #lines == 1 and lines[1] == "" then
          vim.api.nvim_buf_delete(b, { force = false })
        end
      end
    end
  end,
})

-- Format buffer with jq
vim.api.nvim_create_user_command("FormatJq", function()
  vim.cmd("%!jq .")
end, { desc = "Pretty-print JSON with jq" })
