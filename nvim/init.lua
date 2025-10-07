-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.filetype.add({
  filename = {
    [".air.toml"] = "toml",
  },
})

-- explorer config
vim.g.netrw_list_hide = nil
vim.g.netrw_banner = 0 -- remove top banner
