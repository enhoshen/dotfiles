vim.keymap.set("n", "<Leader>Dd", ":CodeDiff<CR>", { desc = "Start code diff" })
vim.keymap.set(
  "n",
  "<Leader>Da",
  ":DiffThis<CR>",
  { desc = "Add current file to diff list" }
)
vim.keymap.set(
  "n",
  "<Leader>Dc",
  ":DiffClear<CR>",
  { desc = "Clear diff list" }
)
vim.keymap.set("n", "<Leader>Df", ":DiffFile<CR>", { desc = "Clear diff list" })
