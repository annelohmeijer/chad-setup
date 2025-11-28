return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    cmd = "Neotree",
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle Neo-tree" },
      { "<leader>fe", "<cmd>Neotree toggle<cr>", desc = "Explorer (Neo-tree)" },
    },
    opts = {
      close_if_last_window = true,
      open_files_do_not_replace_types = { "terminal", "trouble", "qf", "Outline", "neo-tree" },
      default_component_configs = {
        indent = {
          with_expanders = true,
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
      },
      filesystem = {
        follow_current_file = {
          enabled = false,
        },
        hijack_netrw_behavior = "open_default",
      },
      window = {
        position = "left",
        width = 30,
        mappings = {
          ["<cr>"] = "open",
          ["l"] = "open",
        },
      },
    },
  },
}
