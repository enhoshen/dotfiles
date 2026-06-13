vim.keymap.set("n", "<leader>pp", "<cmd>PasteImage<cr>", {
  desc = "Paste image from system clipboard, ask for file name",
})
vim.keymap.set("n", "<leader>pP", function()
  require("img-clip").paste_image({ prompt_for_file_name = false })
end, {
  desc = "Paste image from system clipboard w/o asking for file name",
})
