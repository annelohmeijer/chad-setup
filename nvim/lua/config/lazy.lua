local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- { import = "lazyvim.plugins.extras.lang.python" },
    -- import any extras modules here
    -- { import = "lazyvim.plugins.extras.lang.typescript" },
    -- { import = "lazyvim.plugins.extras.lang.json" },
    -- { import = "lazyvim.plugins.extras.ui.mini-animate" },
    { import = "lazyvim.plugins.extras.coding.copilot" },
    -- import/override with your plugins
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
        "pyright",
      },
    },
  },
})

-- require("lint").linters_by_ft = {
--   python = { "pylint" },
-- }

require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

-- https://github.com/williamboman/mason-lspconfig.nvim
-- require("mason-lspconfig").setup({
--   ensure_installed = { "ruff", "pylsp" },
-- })
--
-- -- https://github.com/python-lsp/python-lsp-server/blob/develop/CONFIGURATION.md
-- require("lspconfig").pylsp.setup({
--   settings = {
--     pylsp = {
--       plugins = {
--         black = {
--           enabled = true,
--         },
--         isort = {
--           enabled = true,
--         },
--         -- pylint is only works from a binary but will throw errors for imports
--         pylint = {
--           enabled = false,
--           executable = "pylint",
--         },
--         -- ruff = {
--         --   enabled = true,
--         -- },
--         pyflakes = {
--           enabled = false,
--         },
--         pycodestyle = {
--           enabled = false,
--           maxLineLength = 88,
--         },
--         jedi_completion = {
--           fuzzy = true,
--         },
--       },
--     },
--   },
-- })
-- https://github.com/neovim/nvim-lspconfig
-- require("lspconfig").jedi_language_server.setup({})
