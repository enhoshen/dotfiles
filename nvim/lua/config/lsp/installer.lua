-- from https://github.com/alpha2phi/neovim-for-beginner/tree/main/lua/config/lsp
local lsp_installer_servers = require "mason-lspconfig"
local lspconfig = require "lspconfig"

local M = {}

function M.setup(servers, options)
  lsp_installer_servers.setup{
    ensure_installed = servers,
  }
  for server_name, server_opt in pairs(servers) do
    lspconfig[server_name].setup{
      server_opt
    }

    --lsp_installer_servers.server_name.setup{}
    --local server_available, server = lsp_installer_servers.get_server(server_name)

    --if server_available then
    --  server:on_ready(function()
    --    local opts = vim.tbl_deep_extend("force", options, servers[server.name] or {})
    --    server:setup(opts)
    --  end)

    --  if not server:is_installed() then
    --    utils.info("Installing " .. server.name)
    --    server:install()
    --  end
    --else
    --  utils.error(server)
    --end
  end
end

return M
