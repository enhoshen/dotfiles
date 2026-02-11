vim.keymap.set("n", "<Leader>mc", function()
  vim.cmd("make %")
end, { desc = "Make the current file" })

vim.keymap.set("n", "<Leader>ms", function()
  vim.cmd("make % -s --log-level=debug")
end, { desc = "Pytest: Make with -s and log level debug" })

-- Keymap to toggle right pane/buffer
vim.keymap.set("n", "<Leader>ml", function()
  -- If there's more than one window, assume the right pane is open and close it.
  -- Otherwise, open the right pane with a new vertical split.
  if vim.fn.winnr("$") > 1 then
    vim.cmd("close") -- Closes the current window. Assumes focus is on the pane to be closed.
  else
    -- Opens a new vertical split, moves to it, and jumps to mark A.
    vim.cmd([[vnew | norm <C-w>L ]])
    vim.cmd([[norm 'A]])
  end
end, {
  desc = "Toggle mark A at right Pane, assuming mark A points to tmp/make.txt",
  noremap = true,
})
