-- plugins.lua or a similar file where plugins are defined
return {
  -- Other pluginsp
  --
  { "nvim-lua/plenary.nvim" }, -- don't forget to add this one if you don't have it yet!
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
}
