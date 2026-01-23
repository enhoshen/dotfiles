return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      menu = {
        draw = {
          source_name = {
            width = { max = 30 },
            text = function(ctx)
              return ctx.source_name
            end,
            highlight = "BlinkCmpSource",
          },
          columns = {
            { "label", "label_description", gap = 1 },
            { "kind_icon", "kind" },
            { "source_name" },
          },
        },
      },
    },
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
