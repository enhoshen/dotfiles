-- keymaps
require("config.keymaps")

-- mason
require("mason").setup({
  registries = {
    "github:mason-org/mason-registry",
  },
})

-- dap
require("config.dap")

-- treesitter
-- require("config.treesitters")

-- conform
require("config.conform")
