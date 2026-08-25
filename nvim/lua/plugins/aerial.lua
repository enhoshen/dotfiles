return {
  "stevearc/aerial.nvim",
  opts = {
    backends = {
      ["_"] = { "lsp", "treesitter", "markdown", "asciidoc", "man" },
      markdown = { "treesitter" },
    },
    layout = {
      default_direction = "prefer_left",
    },
  },
  -- Optional dependencies
  branch = "nvim-0.9",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
}
