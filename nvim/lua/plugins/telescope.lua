return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = vim.fn.executable("make") == 1,
      config = function()
        require("telescope").setup({
          defaults = {
            mappings = {
              i = {
                ["<CR>"] = function(prompt_bufnr)
                  local action_state = require("telescope.actions.state")
                  local actions = require("telescope.actions")
                  actions.select_default(prompt_bufnr)
                  vim.cmd("stopinsert")
                end,
              },
              n = {
                ["<CR>"] = function(prompt_bufnr)
                  local action_state = require("telescope.actions.state")
                  local actions = require("telescope.actions")
                  actions.select_default(prompt_bufnr)
                  vim.cmd("stopinsert")
                  local selection = action_state.get_selected_entry()
                  if selection then
                    vim.api.nvim_win_set_cursor(0, { selection.lnum, selection.col })
                  end
                end,
              },
            },
          },
        })
        require("telescope").load_extension("fzf")
        require("telescope").load_extension("fzf")
      end,
    },
  },
  opts = {
    defaults = {
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        "--glob",
        "!.git/*",
      },
    },
  },
}
