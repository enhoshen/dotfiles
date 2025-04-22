-- !! using lazyvim, DO NOT require("config.keymaps")
-- here, default lazyvim keymaps might not be properly overidden.
-- this may be affected by the order I setup config in init.lua:
-- config.lazy then config.init

-- mason
require("mason").setup({
  registries = {
    "github:mason-org/mason-registry",
  },
})

-- dap
require("config.dap")

-- lsp
require("config.lsp")

-- treesitter
-- require("config.treesitters")

-- conform
require("config.conform")
