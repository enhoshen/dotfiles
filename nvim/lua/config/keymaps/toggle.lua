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

-- toggle background
local transparent_flag = false
vim.keymap.set("n", "<Leader>tt", function()
  -- Commands defined in commands module
  if transparent_flag then
    -- reload colorscheme
    vim.cmd("ReloadColor")
  else
    vim.cmd("SetTransparent")
  end
  transparent_flag = not transparent_flag
end, { desc = "Toggle transparent background" })
