-- Shared LSP server registry.
--
-- Usage from a language file:
--   local lsp_servers = require("config.lsp_servers")
--   lsp_servers.register("clangd", {
--     cmd = { "clangd", "--background-index" },
--   })
-- `opts` is optional and merged with `{ capabilities = ... }` automatically.

local M = {}

M.servers = {}

-- for lsp's context when when i forget it
--- Register a language server to be configured and enabled.
---@param name string server name as known to nvim-lspconfig / mason-lspconfig
---@param opts table? extra options merged into vim.lsp.config(name, opts)
function M.register(name, opts)
	M.servers[name] = opts or {}
end

return M
