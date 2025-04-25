local wk = require("which-key")
wk.add({
  group = "Make",
  {
    mode = { "n" },
    {
      "<Leader>mc",
      function()
        vim.cmd("make %")
        vim.cmd("vnew copen")
      end,
      desc = "Make the current file and open qlist",
    },
  },
})
