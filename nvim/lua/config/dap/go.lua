-- based on TJ https://github.com/tjdevries/config.nvim/blob/master/lua/custom/plugins/dap.lua
--require("dap-go").setup()
--ui = require("dapui")
--dap = require("dap")
--Handled by nvim-dap-go
--dap.adapters.go = {
--  type = "server",
--  port = "${port}",
--  executable = {
--    command = "dlv",
--    args = { "dap", "-l", "127.0.0.1:${port}" },
--  },
--}

--if elixir_ls_debugger ~= "" then
--local elixir_ls_debugger = vim.fn.exepath("elixir-ls-debugger")
--  dap.adapters.mix_task = {
--    type = "executable",
--    command = elixir_ls_debugger,
--  }

--dap.configurations.elixir = {
--  {
--    type = "mix_task",
--    name = "phoenix server",
--    task = "phx.server",
--    request = "launch",
--    projectDir = "${workspaceFolder}",
--    exitAfterTaskReturns = false,
--    debugAutoInterpretAllModules = false,
--  },
--}
--
