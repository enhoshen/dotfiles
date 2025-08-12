function PythonPath()
  -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
  -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
  -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
  local cwd = vim.fn.getcwd()
  if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
    return cwd .. "/venv/bin/python"
  elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
    return cwd .. "/.venv/bin/python"
  else
    return "/usr/bin/python"
  end
end
local dappy = require("dap-python")
local dap = require("dap")
dappy.test_runner = "pytest"
dappy.setup(PythonPath())
table.insert(dap.configurations.python, 1, {
  --- refer to dap-python.lua::M.test_runners.pytest
  --- this equals to debugpy -m pytest ${file}
  type = "python",
  request = "launch",
  name = "debugpy + pytest",
  module = "pytest",
  args = { "${file}" },
  --- options can be found at
  --- https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
  justMyCode = false,
  subProcess = true,
})
table.insert(dap.configurations.python, 2, {
  type = "python",
  request = "attach",
  name = "pytest then attach on 127.0.0.1:5678",
  connect = function()
    --- get windows and buffer info so we can switch back to it
    win_id = vim.fn.win_getid()
    buf_id = vim.fn.bufnr()
    --- run pytest in the background by opening a terminal emulator
    vim.cmd(":term pytest % > /tmp/make.txt")
    --- switch back to previous window and buffer
    vim.fn.win_gotoid(win_id)
    vim.cmd.buffer(buf_id)
    return { host = "127.0.0.1", port = 5678 }
  end,
  justMyCode = false,
  subProcess = true,
})
table.insert(dap.configurations.python, 3, {
  type = "python",
  request = "attach",
  name = "pytest then attach",
  connect = function()
    --- get windows and buffer info so we can switch back to it
    win_id = vim.fn.win_getid()
    buf_id = vim.fn.bufnr()
    --- run pytest in the background by opening a terminal emulator
    vim.cmd(":term pytest % > /tmp/make.txt")
    --- switch back to previous window and buffer
    vim.fn.win_gotoid(win_id)
    vim.cmd.buffer(buf_id)
    local host = vim.fn.input("Host [127.0.0.1]: ")
    host = host ~= "" and host or "127.0.0.1"
    local port = tonumber(vim.fn.input("Port [5678]: ")) or 5678
    return { host = host, port = port }
  end,
  justMyCode = false,
  subProcess = true,
})
