-- Use which-key to group keymaps
return {
  "folke/which-key.nvim",
  opts = {
    spec = {
      { "<Leader>gp", group = "Gpt prompt" },
      { "<Leader>m", group = "Make" },
      { "<Leader>h", group = "Harpoon" },
      { "<Leader>D", group = "Diff" },
      { "<Leader>t", group = "Toggle", mode = { "n", "i", "v" } },
      { "<Leader>g", group = "Git/Gemini", mode = { "n", "i", "v" } },
      { "<Leader>a", group = "Avante", mode = { "n", "i", "v" } },
      {
        "<Leader>q",
        group = "quit/session/quickfix",
        mode = { "n", "i", "v" },
      },
      { "<Leader>c", group = "Code/Copy", mode = { "n", "i", "v" } },
      { "<Leader>/", group = "Grep", mode = { "n", "i", "v" } },
    },
  },
}
