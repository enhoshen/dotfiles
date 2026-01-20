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
    },
  },
}
