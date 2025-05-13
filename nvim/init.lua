-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.filetype.add({
  filename = {
    [".air.toml"] = "toml",
  },
})

-- explorer config
vim.g.netrw_list_hide = ""
vim.g.netrw_banner = 0 -- remove top banner
vim.g.netrw_liststyle = 3 -- tree style
vim.g.netrw_browse_split = 0 -- open in same window
