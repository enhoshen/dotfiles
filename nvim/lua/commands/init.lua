vim.api.nvim_create_user_command("Setgrep", function(opts)
  vim.opt.grepprg = "grep -HIn $* /dev/null"
  vim.opt.grepformat = "%f:%l:%m,%f:%l%m,%f  %l%m"
end, { nargs = "*", desc = "Set grepprg and grepformat to default" })
vim.api.nvim_create_user_command("Setripgrep", function(opts)
  vim.opt.grepprg = "rg --vimgrep"
  vim.opt.grepformat = "%f:%l:%c:%m"
end, { nargs = "*", desc = "Set grepprg and grepformat for ripgrep" })
