local harpoon = require("harpoon")

-- harpoon:setup()

vim.keymap.set("n", "<leader>h", "", { desc = "Harpoon" })
vim.keymap.set("n", "<leader>ha", function()
  harpoon:list():add()
end, { desc = "Harpoon add to list" })
vim.keymap.set("n", "<leader>hd", function()
  harpoon:list():remove()
end, { desc = "Harpoon remove current buffer from the list" })
vim.keymap.set("n", "<leader>hc", function()
  harpoon:list():clear()
end, { desc = "Harpoon clear list" })
vim.keymap.set("n", "<leader>hu", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon toggle list UI" })

-- assign 1-9 to harpoon select
for i = 1, 9 do
  vim.keymap.set("n", "<leader>h" .. i, function()
    harpoon:list():select(i)
  end, { desc = "Harpoon select " .. i .. "st item" })
end
-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<leader>hn", function()
  harpoon:list():prev()
end, { desc = "Harpoon next item" })
vim.keymap.set("n", "<leader>hp", function()
  harpoon:list():next()
end, { desc = "Harpoon previous item" })
