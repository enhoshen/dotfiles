require("config.keymaps.dap")
require("config.keymaps.gp")

--- diagnostic
vim.keymap.set(
  "n",
  "<space>e",
  vim.diagnostic.open_float,
  { desc = "diagnostic open float" }
)
vim.keymap.set(
  "n",
  "[d",
  vim.diagnostic.goto_prev,
  { desc = "diagnostic open float" }
)
vim.keymap.set(
  "n",
  "]d",
  vim.diagnostic.goto_next,
  { desc = "diagnostic open float" }
)
vim.keymap.set(
  "n",
  "<space>q",
  vim.diagnostic.setloclist,
  { desc = "diagnostic open float" }
)
