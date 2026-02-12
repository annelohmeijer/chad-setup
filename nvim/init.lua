-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.filetype.add({
  filename = {
    [".air.toml"] = "toml",
  },
})
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
