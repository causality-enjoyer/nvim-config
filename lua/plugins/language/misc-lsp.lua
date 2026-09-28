local languages = require("config.languages")
local servers = languages.lsp_servers()

for _, name in ipairs(servers) do
	require("config.lsp_servers").register(name)
end

return {
	{
		"williamboman/mason-lspconfig.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, servers)
		end,
	},
}
