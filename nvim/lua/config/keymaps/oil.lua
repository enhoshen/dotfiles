vim.api.nvim_create_user_command("Explore", ":Oil", {})

vim.keymap.set(
  "n",
  "<leader>e",
  ":Oil<CR>",
  { desc = "Toggle Oil on parent directory" }
)
vim.keymap.set("n", "<leader>E", function()
  require("oil").open(vim.fn.getcwd())
end, { desc = "Toggle Oil on working directory" })
