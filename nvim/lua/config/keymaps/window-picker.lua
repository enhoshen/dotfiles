vim.keymap.set("n", "<Leader>fw", function()
  id = require("window-picker").pick_window()
  vim.fn.win_gotoid(id)
end, { desc = "Pick window" })
