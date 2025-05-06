-- change grepprg
vim.api.nvim_create_user_command("Setgrep", function(opts)
  vim.opt.grepprg = "grep -HIn $* /dev/null"
  vim.opt.grepformat = "%f:%l:%m,%f:%l%m,%f  %l%m"
end, { nargs = "*", desc = "Set grepprg and grepformat to default" })
vim.api.nvim_create_user_command("Setripgrep", function(opts)
  vim.opt.grepprg = "rg --vimgrep"
  vim.opt.grepformat = "%f:%l:%c:%m"
end, { nargs = "*", desc = "Set grepprg and grepformat for ripgrep" })

-- set transparent background
vim.api.nvim_create_user_command("SetTransparent", function(opts)
  -- vim.api.nvim_set_hl(0, "Normal", {guibg=NONE})
  vim.cmd("hi Normal guibg=NONE")
end, { nargs = "*", desc = "Set background highlights to NONE" })
vim.api.nvim_create_user_command("ReloadColor", function(opts)
  -- expand g:colors_name the current colorscheme
  -- and pass it to command :colorscheme using :exe
  vim.cmd('exe "colo" g:colors_name')
end, { nargs = "*", desc = "Reload colorscheme" })
