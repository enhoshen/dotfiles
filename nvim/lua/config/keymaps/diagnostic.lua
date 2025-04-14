-- from https://github.com/neovim/nvim-lspconfig
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
--- diagnostic
vim.keymap.set(
  "n",
  "<Leader>xf",
  vim.diagnostic.open_float,
  { desc = "diagnostic open float" }
)
--vim.keymap.set(
--  "n",
--  "[d",
--  vim.diagnostic.goto_prev,
--  { desc = "diagnostic go previous" }
--)
--vim.keymap.set(
--  "n",
--  "]d",
--  vim.diagnostic.goto_next,
--  { desc = "diagnostic go next" }
--)

vim.keymap.set(
  "n",
  --  Why isn't this working
  -- "<Leader>xq",
  "<Leader>xc",
  vim.diagnostic.setqflist,
  { desc = "diagnostic set quickfix list" }
)
