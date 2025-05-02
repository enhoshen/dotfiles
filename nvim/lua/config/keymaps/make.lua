local wk = require("which-key")
wk.add({
  {
    "<Leader>m",
    nil,
    desc = "Make",
  },
  {
    group = "Make",
    mode = { "n" },
    {
      "<Leader>mc",
      function()
        vim.cmd("make %")
      end,
      desc = "Make the current file",
    },
  },
})
