-- keymappings for explorer tree
return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            hidden = true,
            ignored = true,
            focus = "list",
            win = {
              list = {
                keys = {
                  ["s"] = "edit_vsplit",
                  ["<C-h>"] = "edit_hsplit",
                  ["o"] = "confirm",
                },
              },
            },
          },
        },
      },
    },
  },
}
