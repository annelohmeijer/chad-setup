return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  event = "VeryLazy",
  config = function()
    local harpoon = require("harpoon")
    local list = harpoon:list()

    harpoon:setup()

    -- Register which-key group
    -- require("which-key").register({
    --   { "<leader>h", group = "harpoon" },
    -- })

    -- Add current file to harpoon
    vim.keymap.set("n", "<leader>ha", function()
      list:append()
    end, { desc = "Harpoon: Add file" })

    -- Toggle quick menu
    vim.keymap.set("n", "<leader>hm", function()
      harpoon.ui:toggle_quick_menu(list)
    end, { desc = "Harpoon: Toggle menu" })

    -- Go to specific file (1–4)
    for i = 1, 4 do
      vim.keymap.set("n", "<leader>h" .. i, function()
        list:select(i)
      end, { desc = "Harpoon: Go to file " .. i })
    end

    -- Navigate previous and next
    vim.keymap.set("n", "<leader>hp", function()
      list:prev()
    end, { desc = "Harpoon: Previous file" })

    vim.keymap.set("n", "<leader>hn", function()
      list:next()
    end, { desc = "Harpoon: Next file" })

    -- Quick access with Ctrl keys
    vim.keymap.set("n", "<C-h>", function()
      list:select(1)
    end, { desc = "Harpoon: File 1" })
    
    vim.keymap.set("n", "<C-j>", function()
      list:select(2)
    end, { desc = "Harpoon: File 2" })
    
    vim.keymap.set("n", "<C-k>", function()
      list:select(3)
    end, { desc = "Harpoon: File 3" })
    
    vim.keymap.set("n", "<C-l>", function()
      list:select(4)
    end, { desc = "Harpoon: File 4" })
  end,
}
