snack = require("snacks")
vim.api.nvim_create_autocmd({ "User" }, {
  pattern = { "OilActionsPost" },
  callback = function(ev)
    for _, a in ipairs(ev.data.actions) do
      if a.type ~= "create" then
        return
      end
      local prefix = "oil://"
      local uri = string.sub(a.url, string.len(prefix) + 1)
      local file_extension = vim.fn.fnamemodify(uri, ":e")
      local template_file =
          string.format("~/.vim/templates/skeleton.%s", file_extension)
      -- expand home directory and such
      template_file = vim.fn.expand(template_file)
      if vim.fn.filereadable(template_file) == 0 then
        snack.notify(
          string.format("Template file not found: %s", template_file)
        )
        return
      end
      -- without using vim.fn:
      -- local tfile, err = io.open(template_file, "r")
      -- local content = tfile:read("*a")
      local lines = vim.fn.readfile(template_file)
      local content = table.concat(lines, "\n")
      content = vim.fn.substitute(
        content,
        -- * we need double backlash because lua interpret string once, then
        --   vim interpret it again, so we need to escape it twice
        -- * {-} in vim is non-greedy matching 0 or more of the precieding atom,
        --   like {}? in python
        "\\[:VIM_EVAL:\\]\\(.\\{-}\\)\\[:END_EVAL:\\]",
        -- see :help sub-replace-expression to understand \=
        "\\=eval(submatch(1))",
        "ge"
      )
      vim.fn.writefile(vim.split(content, "\n"), uri)
      -- without using vim.fn:
      -- urifile, err = io.open(uri, "w")
      -- urifile:write(content)
      -- urifile:close()
    end
  end,
})
