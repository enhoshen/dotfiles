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

-- Snacks picker for Harpoon list
local function harpoon_picker(opts)
  opts = opts or {}
  local harpoon_files = harpoon:list()
  return require("snacks").picker(vim.tbl_deep_extend("force", {
    title = "Harpoon",
    finder = function()
      local items = {}
      for i = 1, harpoon_files:length() do
        local item = harpoon_files.items[i]
        if item and item.value and item.value ~= "" then
          table.insert(items, {
            file = item.value,
            text = item.value,
            pos = item.context
                and { item.context.row or 1, item.context.col or 0 }
              or nil,
            harpoon_idx = i,
          })
        end
      end
      return items
    end,
    format = "file",
    confirm = function(picker, item)
      picker:close()
      if item then
        harpoon_files:select(item.harpoon_idx)
      end
    end,
    actions = {
      harpoon_delete = function(picker, item)
        if item and item.harpoon_idx then
          harpoon_files:remove_at(item.harpoon_idx)
          picker:find()
        end
      end,
    },
    win = {
      input = {
        keys = {
          ["<c-d>"] = { "harpoon_delete", mode = { "n", "i" } },
        },
      },
    },
  }, opts))
end

vim.keymap.set("n", "<leader>fH", function()
  harpoon_picker()
end, { desc = "Harpoon picker (Snacks)" })

-- assign 1-9 and a-z to harpoon select if keymap is not already taken
local select_keys = {}
for i = 1, 9 do
  table.insert(select_keys, tostring(i))
end
-- for c = string.byte("a"), string.byte("z") do
--   table.insert(select_keys, string.char(c))
-- end

for idx, key in ipairs(select_keys) do
  -- local lhs = "<leader>h" .. key
  -- if vim.fn.maparg(lhs, "n") == "" then
  vim.keymap.set("n", "<leader>h" .. key, function()
    harpoon:list():select(idx)
  end, { unique = true, desc = "Harpoon select item " .. idx })
end
