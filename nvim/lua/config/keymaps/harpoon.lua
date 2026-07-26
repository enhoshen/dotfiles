local harpoon = require("harpoon")

-- harpoon:setup()

vim.keymap.set("n", "<leader>h", "", { desc = "Harpoon" })

-- assign 1-9 and a-z to harpoon select
local select_keys = {}
for i = 1, 9 do
  table.insert(select_keys, tostring(i))
end
for c = string.byte("a"), string.byte("z") do
  table.insert(select_keys, string.char(c))
end

for idx, key in ipairs(select_keys) do
  vim.keymap.set("n", "<leader>h" .. key, function()
    harpoon:list():select(idx)
  end, { desc = "Harpoon select item " .. idx })
end

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
  harpoon.ui:toggle_quick_menu(harpoon:list(), {
    save_on_toggle = true,
    height_in_lines = math.min(
      math.max(1, harpoon:list():length()),
      vim.o.lines - 4
    ),
  })
end, { desc = "Harpoon toggle list UI" })

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<leader>hn", function()
  harpoon:list():prev()
end, { desc = "Harpoon next item" })
vim.keymap.set("n", "<leader>hp", function()
  harpoon:list():next()
end, { desc = "Harpoon previous item" })
