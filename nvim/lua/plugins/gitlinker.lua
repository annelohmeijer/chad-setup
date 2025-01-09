return {
  {
    "ruifm/gitlinker.nvim",
    dependencies = { "nvim-lua/plenary.nvim" }, -- use `dependencies` instead of `requires` in lazy.nvim
    config = function()
      -- Optional: Add configuration for gitlinker here
      require("gitlinker").setup()
    end,
  },
}
