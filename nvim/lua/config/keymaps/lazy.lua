vim.keymap.del("n", "<Leader>/")
vim.keymap.set("n", "<Leader>ld", function()
  Snacks.dashboard()
end, {
  desc = "Open Lazyvim Dashboard",
})
