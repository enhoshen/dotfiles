vim.keymap.set("n", "<leader>cf", ':let @0=expand("%")<CR>', {
  desc = "Copy buffer file path to register 0",
})
