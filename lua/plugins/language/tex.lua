-- https://github.com/lervag/vimtex
-- texlab LSP is registered here too (rather than the generic misc-lsp file),
-- since it's LaTeX-specific -- keeps all LaTeX config, vimtex + LSP, in one
-- place per your request.

local lsp_servers = require("config.lsp_servers")

lsp_servers.register("texlab", {
	settings = {
		texlab = {
			build = { onSave = false },
			forwardSearch = { executable = "" }, -- disable, so that vimtex will handle it
		},
	},
})

return {
	{
		"williamboman/mason-lspconfig.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "texlab" })
		end,
	},

	{
		"lervag/vimtex",
		lazy = false,
		ft = { "tex", "latex" },
		init = function()
			vim.g.vimtex_view_method = "sioyek"
			vim.g.vimtex_view_general_viewer = "sioyek --new-instance"
			vim.g.vimtex_view_general_options = "--synctex-forward @line: @col:@pdf @pdf"

			vim.g.vimtex_compiler_method = "latexmk"
			vim.g.vimtex_compiler_latexmk = {
				build_dir = "build",
				options = {
					"-pdf",
					"-interaction=nonstopmode",
					"-synctex=1",
				},
			}

			vim.g.vimtex_view_automatic = 1
			vim.g.vimtex_quickfix_mode = 2
		end,
	},
}
