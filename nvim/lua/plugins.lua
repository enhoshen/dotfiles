-- from https://github.com/alpha2phi/neovim-for-beginner/blob/main/lua/plugins.lua
local M = {}

function M.setup()
  -- Indicate first time installation
  local is_boostrap = false

  -- packer.nvim configuration
  local conf = {
    profile = {
      enable = true,
      threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
    },

    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },
  }

  -- Check if packer.nvim is installed
  -- Run PackerCompile if there are changes in this file
  local function packer_init()
    local fn = vim.fn
    local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
      fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
      }
      is_boostrap = true
      vim.cmd [[packadd packer.nvim]]
    end

    -- Run PackerCompile if there are changes in this file
    -- vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
    local packer_grp = vim.api.nvim_create_augroup("packer_user_config", { clear = true })
    vim.api.nvim_create_autocmd(
      { "BufWritePost" },
      { pattern = vim.fn.expand "$MYVIMRC", command = "source <afile> | PackerCompile", group = packer_grp }
    )
  end

  -- Plugins
  local function plugins(use)
    -- nvim-treesitter
    use {
      'nvim-treesitter/nvim-treesitter',
      run = function () require('nvim-treesitter.install').update({ with_sync =true }) end,
    }
    -- Mason
    use {
      "williamboman/mason.nvim",
      run = ":MasonUpdate",
    }
    -- LSP
    use {
      "williamboman/mason-lspconfig.nvim",
    }
    use {
      "neovim/nvim-lspconfig",
      opt = true,
      event = "BufReadPre",
      config = function()
        require("config.lsp").setup()
      end,
    }


    -- ChatGPT
    --use({
    --  "jackMort/ChatGPT.nvim",
    --    config = function()
    --      require("chatgpt").setup()
    --    end,
    --    requires = {
    --      "MunifTanjim/nui.nvim",
    --      "nvim-lua/plenary.nvim",
    --      "nvim-telescope/telescope.nvim"
    --    }
    --})

    if is_boostrap then
      print "Neovim restart is required after installation!"
      require("packer").sync()
    end
  end

  -- Init and start packer
  packer_init()
  local packer = require "packer"

  -- Performance
  pcall(require, "impatient")
  -- pcall(require, "packer_compiled")

  packer.init(conf)
  packer.startup(plugins)
end
return M
