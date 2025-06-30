vim.keymap.set("i", "<C-e>", "<Esc>", { desc = "interrupt; mnemonic: end" })
vim.keymap.set("n", "<leader>tn", ":ToggleNext<CR>", {
  desc = "Toggle <leader><tab> and <S-Tab> *next mode, cycling between cnext, bnext, lnext",
})
