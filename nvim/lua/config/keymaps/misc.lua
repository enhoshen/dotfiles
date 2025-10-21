vim.keymap.set("i", "<C-e>", "<Esc>", { desc = "interrupt; mnemonic: end" })
vim.keymap.set("n", "<leader>tn", ":ToggleNext<CR>", {
  desc = "Toggle <leader><tab> and <S-Tab> *next mode, cycling between cnext, bnext, lnext",
})
vim.keymap.set("n", "<leader>ff", ":Files<CR>", {
  desc = "Find files with fzf-vim",
})
vim.keymap.set("n", "<leader>fh", ":History<CR>", {
  desc = "Find history files with fzf-vim",
})
vim.keymap.set("n", "<leader>f:", ":History:<CR>", {
  desc = "Find history commands with fzf-vim",
})
vim.keymap.set("t", "<CR>", "<CR><C-\\><C-N>", {
  desc = "Leave terminal mode after repeated enter",
})
