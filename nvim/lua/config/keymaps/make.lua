vim.keymap.set("n", "<Leader>mc", function()
  vim.cmd("make %")
end, { desc = "Make the current file" })

vim.keymap.set("n", "<Leader>ms", function()
  vim.cmd("make % -s --log-level=debug")
end, { desc = "Pytest: Make with -s and log level debug" })

-- Keymap to toggle right pane/buffer
local mark_A_open = false
vim.keymap.set("n", "<Leader>ml", function()
  -- * don't know how to check if mark A window is already closed
  -- * don't know how to check if focus is still on the mark A window 
  if mark_A_open then
    vim.cmd("close") -- Closes the current window. Assumes focus is on the pane to be closed.
  else
    -- Opens a new vertical split, moves to it, and jumps to mark A.
    vim.cmd([[vnew | norm <C-w>L ]])
    vim.cmd([[norm 'A]])
  end
  mark_A_open = not mark_A_open
end, {
  desc = "Toggle mark A at right Pane, assuming mark A points to tmp/make.txt",
  noremap = true,
})
