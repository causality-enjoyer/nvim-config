-- The single real "neovim/nvim-lspconfig" spec. Every language file
-- (lua/plugins/language/*.lua) registers its server(s) into
-- config.lsp_servers *before* this runs, by requiring that module at the
-- top of their own file and calling .register(). Since plain `require()`
-- calls are cached and run immediately (unlike lazy.nvim `opts`/`config`
-- merging), registration order doesn't matter -- by the time lazy.nvim
-- actually loads this plugin and calls `config()`, every language file's
-- top-level `lsp_servers.register(...)` call has already executed.

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"saghen/blink.cmp",
	},
	config = function()
		local capabilities = require("config.lsp_capabilities").get()
		local lsp_servers = require("config.lsp_servers")

		local names = {}
		for name, opts in pairs(lsp_servers.servers) do
			local merged = vim.tbl_deep_extend("force", { capabilities = capabilities }, opts)
			vim.lsp.config(name, merged)
			table.insert(names, name)
		end

		vim.lsp.enable(names)
	end,
}
