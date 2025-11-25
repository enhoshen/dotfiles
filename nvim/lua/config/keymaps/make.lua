vim.keymap.set("n", "<leader>m", "", {
  desc = "Make",
})
vim.keymap.set("n", "<Leader>mc", function()
  vim.cmd("make %")
end, { desc = "Make the current file" })

vim.keymap.set("n", "<Leader>mcs", function()
  vim.cmd("make % -s --log-level=debug")
end, { desc = "Pytest: Make with -s and log level debug" })
