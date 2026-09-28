-- Shared Mason bootstrap. This installs mason.nvim + mason-lspconfig with an
-- empty ensure_installed list; every language-specific plugin file (see
-- lua/plugins/language/*.lua) appends its own LSP servers / tools to that
-- list via its own `opts = function(_, opts) vim.list_extend(...) end`, so
-- adding or removing a language never requires touching this file.

return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		opts = {},
	},

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = {},
		},
	},

	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		event = "VeryLazy",
		opts = {
			ensure_installed = require("config.languages").tools(),
		},
	},
}
