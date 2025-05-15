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
})
