require("conform").setup({
  -- TODO: lazy loading with callback
  formatters = {
    black = {
      prepend_args = { "-l", "80" },
    },
  },
  formatters_by_ft = {
    python = { "black" },
  },
})
