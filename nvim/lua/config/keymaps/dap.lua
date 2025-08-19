--- dap
-- based on TJ https://github.com/tjdevries/config.nvim/blob/master/lua/custom/plugins/dap.lua
dap = require("dap")
vim.keymap.set(
  "n",
  "<leader>b",
  dap.toggle_breakpoint,
  { desc = "dap toggle breakpoint" }
)

vim.keymap.set("n", "<space>cb", function()
  dap.toggle_breakpoint(vim.fn.input(""))
end, { desc = "dap toggle conditional breakpoint" })

vim.keymap.set(
  "n",
  "<leader>gb",
  dap.run_to_cursor,
  { desc = "dap run to cursor" }
)

vim.keymap.set("n", "<Leader>di", dap.step_into, { desc = "dap step into" })
vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "dap continue" })
vim.keymap.set("n", "<Leader>ds", dap.step_over, { desc = "dap step over" })
vim.keymap.set("n", "<Leader>do", dap.step_out, { desc = "dap step out" })
vim.keymap.set("n", "<Leader>db", dap.step_back, { desc = "dap step back" })
vim.keymap.set("n", "<Leader>dr", dap.restart, { desc = "dap restart" })
vim.keymap.set("n", "<Leader>dq", dap.terminate, { desc = "dap terminate" })

vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
  require("dap.ui.widgets").hover()
end, { desc = "dap widget preview" })
vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
  require("dap.ui.widgets").preview()
end, { desc = "dap widget preview" })
vim.keymap.set("n", "<Leader>df", function()
  local widgets = require("dap.ui.widgets")
  widgets.centered_float(widgets.frames)
end, { desc = "dap widget frames" })
vim.keymap.set("n", "<Leader>dt", function()
  local widgets = require("dap.ui.widgets")
  widgets.centered_float(widgets.threads)
end, { desc = "dap widget threads " })
vim.keymap.set("n", "<Leader>db", function()
  dap.list_breakpoints()
end, { desc = "dap list breakpoints in quicklist" })

--- dapui
vim.keymap.set("n", "<Leader>dut", function()
  require("dapui").toggle()
end, { desc = "dapui windows toggle" })
-- Eval var under cursor
vim.keymap.set("n", "<Leader>due", function()
  require("dapui").eval(nil, { enter = true })
end, { desc = "dap evaluate under cursor" })
