return {
  "nvim-telescope/telescope.nvim",
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
        "--hidden", -- <--- INCLUDE HIDDEN FILES
        "--glob",
        "!.git/*", -- <--- EXCLUDE .git folder for performance
      },
    },
  },
}
