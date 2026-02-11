-- Keymap to toggle right pane/buffer
local qlist_open = false
vim.keymap.set("n", "<Leader>qo", function()
  if qlist_open then
    vim.cmd([[cclose]])
  else
    -- Open quickfix and swap to it
    vim.cmd([[cope | wincmd L]])
  end
  qlist_open = not qlist_open
end, {
  desc = "Open quickfix list on the right pane",
  noremap = true,
})
