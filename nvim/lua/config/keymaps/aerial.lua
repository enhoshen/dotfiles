vim.keymap.set("n", "<leader>ao", "<cmd>AerialToggle!<CR>", {
  desc = "Open Aerial window (code navigation)",
})
vim.keymap.set("n", "<leader>af", function()
  require("aerial").snacks_picker()
end, {
  desc = "Fuzzy find aerial code symbols",
})
vim.keymap.set("n", "<leader>fa", function()
  require("aerial").snacks_picker()
end, {
  desc = "Fuzzy find aerial code symbols",
})
