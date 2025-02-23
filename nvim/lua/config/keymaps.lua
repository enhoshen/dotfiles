-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- from https://github.com/neovim/nvim-lspconfig
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
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

-- dap
-- based on TJ https://github.com/tjdevries/config.nvim/blob/master/lua/custom/plugins/dap.lua
dap = require("dap")
vim.keymap.set(
  "n",
  "<space>b",
  dap.toggle_breakpoint,
  { desc = "dap toggle breakpoint" }
)
vim.keymap.set(
  "n",
  "<space>gb",
  dap.run_to_cursor,
  { desc = "dap run to cursor" }
)
-- Eval var under cursor
vim.keymap.set("n", "<space>?", function()
  require("dapui").eval(nil, { enter = true })
end, { desc = "dap evaluate under cursor" })

vim.keymap.set("n", "<F1>", dap.continue, { desc = "dap continue" })
vim.keymap.set("n", "<F2>", dap.step_into, { desc = "dap step into" })
vim.keymap.set("n", "<F3>", dap.step_over, { desc = "dap step over" })
vim.keymap.set("n", "<F4>", dap.step_out, { desc = "dap step out" })
vim.keymap.set("n", "<F5>", dap.step_back, { desc = "dap step back" })
vim.keymap.set("n", "<F13>", dap.restart, { desc = "dap restart" })
