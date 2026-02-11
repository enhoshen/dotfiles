-- Keymap to toggle right pane/buffer
vim.keymap.set("n", "<Leader>qo", function()
  -- If there's more than one window, assume the right pane is open and close it.
  -- Otherwise, open the right pane with a new vertical split.
  if vim.fn.winnr("$") > 1 then
    vim.cmd("close") -- Closes the current window. Assumes focus is on the pane to be closed.
  else
    -- Open quickfix and swap to it
    vim.cmd([[cope | wincmd L]])
  end
end, {
  desc = "Open quickfix list on the right pane",
  noremap = true,
})
