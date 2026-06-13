return {
  "stevearc/oil.nvim",
  opts = {
    keymaps = {
      ["?"] = { "actions.show_help", mode = "n" },
      ["gd"] = {
        desc = "Toggle file detail view",
        callback = function()
          detail = not detail
          if detail then
            require("oil").set_columns({
              "icon",
              "permissions",
              "size",
              "mtime",
            })
          else
            require("oil").set_columns({ "icon" })
          end
        end,
      },
    },
    view_options = {
      show_hidden = true,
    },
  },
  lazy = false,
}
