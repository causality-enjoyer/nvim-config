-- lua/plugins/language/markdown.lua
-- marksman LSP for markdown. Rendering/preview plugins (render-markdown.nvim,
-- markdown-preview.nvim) stay in lua/plugins/utils/ since they're not LSP --
-- this file is specifically markdown's LSP config, split out per your
-- request alongside LaTeX's.

require("config.lsp_servers").register("marksman")

return {
	{
		"williamboman/mason-lspconfig.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "marksman" })
		end,
	},
}
