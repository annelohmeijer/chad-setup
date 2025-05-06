return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  event = "VeryLazy",
  config = function()
    local harpoon = require("harpoon")
    local list = harpoon:list()

    harpoon:setup()

    -- Register which-key group
    require("which-key").register({
      ["<leader>h"] = { name = "+harpoon" },
    })

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
  end,
}
