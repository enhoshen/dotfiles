vim.keymap.set(
  "n",
  "<Leader>/w",
  -- ":grep <C-R><C-W><CR>",
  ":grep <cword><CR>",
  { desc = "Grep the word under cursor" }
)
vim.keymap.set(
  "n",
  "<Leader>/W",
  ":grep <cWORD><CR>",
  { desc = "Grep the WORD under cursor" }
)
