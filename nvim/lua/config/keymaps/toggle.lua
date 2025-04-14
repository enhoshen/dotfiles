--- format
vim.keymap.set("n", "<Leader>tf", function()
  if vim.g.autoformat then
    vim.cmd("FormatDisable")
  else
    vim.cmd("FormatEnable")
  end
end, { desc = "Toggle auto format" })

--- misc
-- just found out lazyvim has set this to <Leader>uw
--vim.keymap.set("n", "<Leader>twp", ":set invwrap<CR>", { desc = "Toggle wrap" })
