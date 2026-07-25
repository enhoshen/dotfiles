vim.keymap.set("n", "<leader>]]", function()
  vim.cmd("AerialNext " .. vim.v.count1)
end, {
  desc = "[Aerial] Jump forward symbols",
})
vim.keymap.set("n", "<leader>[[", function()
  vim.cmd("AerialPrev " .. vim.v.count1)
end, {
  desc = "[Aerial] Jump backward symbols",
})
