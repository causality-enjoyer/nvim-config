-- lua/plugins/language/lua.lua
-- lua_ls only. Split out so Lua's LSP config can be touched in isolation
-- from every other language -- see lua/plugins/workflow/lsp.lua and
-- lua/config/lsp_servers.lua for how the pieces fit together.

require("config.lsp_servers").register("lua_ls")

return {
	{
		"williamboman/mason-lspconfig.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "lua_ls" })
		end,
	},
}
