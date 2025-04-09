return {
  "saghen/blink.cmp",
  opts = {
    sources = {
      providers = {
        snippets = {
          opts = {
            search_paths = {
              vim.env.DOTFILES .. "/snippets",
            },
          },
        },
      },
    },
  },
}
