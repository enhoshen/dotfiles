local M = {}
local code_diff = require("codediff")
local index = 0
M.file_pair = {}
function M.add()
  M.file_pair[index] = vim.fn.expand("%")
  index = (index + 1) % 2
end
function M.clear()
  M.file_pair = {}
end
vim.api.nvim_create_user_command("DiffThis", M.add, {})
vim.api.nvim_create_user_command("DiffClear", M.clear, {})
vim.api.nvim_create_user_command("DiffFile", function()
  vim.cmd({
    cmd = "CodeDiff",
    args = { "file", M.file_pair[0], M.file_pair[1] },
  })
end, {})

return M
