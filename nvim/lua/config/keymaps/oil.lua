vim.api.nvim_create_user_command("Explore", ":Oil", {})

vim.keymap.set(
  "n",
  "<leader>fe",
  ":Oil<CR>",
  { desc = "Toggle Oil on parent directory" }
)
vim.keymap.set("n", "<leader>fE", function()
  require("oil").open(vim.fn.getcwd())
end, { desc = "Toggle Oil on parent directory" })
