-- Disable snacks.nvim explorer and dashboard in favor of neo-tree
return {
  {
    "folke/snacks.nvim",
    opts = {
      explorer = { enabled = false },
    },
  },
}
