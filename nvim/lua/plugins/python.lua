return {
  -- Add `pyright` to mason
  -- TODO: check following tools -> mypy types-requests types-docutils
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      -- vim.list_extend(opts.ensure_installed, { "pyright", "black", "ruff-lsp", "ruff" })
      vim.list_extend(opts.ensure_installed, {
        "black",
        "ruff",
        "isort",
      })
    end,
  },

  -- Setup adapters as nvim-dap dependencies
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "mfussenegger/nvim-dap-python",
      -- stylua: ignore
      keys = {
        { "<leader>dPt", function() require('dap-python').test_method() end, desc = "Debug Method" },
        { "<leader>dPc", function() require('dap-python').test_class() end,  desc = "Debug Class" },
      },
      config = function()
        local path = require("mason-registry").get_package("debugpy"):get_install_path()
        require("dap-python").setup(path .. "/venv/bin/python")
      end,
    },
  },

  -- Add `python` debugger to mason DAP to auto-install
  -- Not absolutely necessary to declare adapter in `ensure_installed`, since `mason-nvim-dap`
  -- has `automatic-install = true` in LazyVim by default and it automatically installs adapters
  -- that are are set up (via dap) but not yet installed. Might as well skip the lines below as
  -- a whole.

  -- Add which-key namespace for Python debugging
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        ["<leader>dP"] = { name = "+Python" },
      },
    },
  },

  -- Add `server` and setup lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {},
    opts = {
      servers = {
        pylsp = {
          mason = true,
          settings = {
            pylsp = {
              plugins = {
                isort = { enabled = true },
                pycodestyle = {
                  enabled = true,
                  maxLineLength = 100,
                },
              },
            },
          },
        },
        ruff_lsp = {
          mason = true,
          init_options = {
            settings = {
              args = {},
            },
          },
        },
        -- Uncomment if you want Pyright for type-checking
        -- pyright = {},
      },
      setup = {
        pylsp = function()
          require("lazyvim.util").lsp.on_attach(function(client, _)
            if client.name == "pylsp" then
              -- Optionally disable hover if using another server for that
              client.server_capabilities.hoverProvider = false
            end
          end)
        end,
        ruff_lsp = function()
          require("lazyvim.util").lsp.on_attach(function(client, _)
            if client.name == "ruff_lsp" then
              -- Disable hover if using pylsp or pyright for that
              client.server_capabilities.hoverProvider = false
            end
          end)
        end,
      },
    },
  },

  -- Setup up format with new `conform.nvim`
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["python"] = { "black", "ruff", "isort" },
      },
    },
  },

  -- Setup null-ls with `black`
  -- {
  --   "nvimtools/none-ls.nvim",
  --   opts = function(_, opts)
  --     local nls = require("null-ls")
  --     opts.sources = vim.list_extend(opts.sources, {
  --       -- Order of formatters matters. They are used in order of appearance.
  --       nls.builtins.formatting.ruff,
  --       nls.builtins.formatting.black,
  --       -- nls.builtins.formatting.black.with({
  --       --   extra_args = { "--preview" },
  --       -- }),
  --       -- nls.builtins.diagnostics.ruff,
  --     })
  --   end,
  -- },

  -- For selecting virtual envs
  {
    "linux-cultist/venv-selector.nvim",
    branch = "regexp",
    dependencies = {
      "mfussenegger/nvim-dap-python",
    },
    cmd = "VenvSelect",
    opts = {
      dap_enabled = true,
    },
    keys = { { "<leader>cv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv" } },
  },
}
