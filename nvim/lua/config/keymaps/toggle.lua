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

-- toggle tabline
-- Just found out lazyvim has this: <Leader>uA
vim.keymap.set("n", "<Leader>tl", function()
  -- Commands defined in commands module
  if vim.o.showtabline == 0 then
    -- reload colorscheme

    vim.o.showtabline = 2
  else
    vim.o.showtabline = 0
  end
end, { desc = "Toggle show tabline" })

-- toggle enter mapping in terminal mode
local enter_leave_term_flag = false
vim.keymap.set("n", "<Leader>te", function()
  -- Commands defined in commands module
  if enter_leave_term_flag then
    vim.keymap.del("t", "<CR>")
  else
    vim.keymap.set("t", "<CR>", "<CR><C-\\><C-N>", {
      desc = "Leave terminal mode after repeated enter",
    })
  end
  enter_leave_term_flag = not enter_leave_term_flag
end, { desc = "Toggle enter mapping in terminal mode" })
