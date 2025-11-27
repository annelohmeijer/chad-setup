-- Disable snacks.nvim explorer in favor of neo-tree
return {
  {
    "folke/snacks.nvim",
    opts = {
      explorer = { enabled = false },
    },
  },
}
