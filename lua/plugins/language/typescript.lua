-- lua/plugins/language/typescript.lua
-- JavaScript/TypeScript/React (ts_ls + eslint). Split out as one of your
-- three primary languages; cssls/tailwindcss/jsonls stay in
-- lua/plugins/language/misc-lsp.lua since they're secondary/shared tooling
-- rather than TS/JS-specific.

local lsp_servers = require("config.lsp_servers")

lsp_servers.register("ts_ls", {
	settings = {
		completions = {
			completeFunctionCalls = true,
		},
		typescript = {
			suggest = {
				includeCompletionsForModuleExports = true,
			},
			preferences = {
				includePackageJsonAutoImports = "auto",
			},
		},
		javascript = {
			suggest = {
				includeCompletionsForModuleExports = true,
			},
			preferences = {
				includePackageJsonAutoImports = "auto",
			},
		},
	},
})

lsp_servers.register("eslint")

return {
	{
		"williamboman/mason-lspconfig.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "ts_ls", "eslint" })
		end,
	},
}
