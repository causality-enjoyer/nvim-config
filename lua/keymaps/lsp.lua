return {
	-- navigation: bare
	{ "n", "gd", vim.lsp.buf.definition, "Go to definition" },
	{ "n", "gD", vim.lsp.buf.declaration, "Go to declaration" },
	{ "n", "gr", vim.lsp.buf.references, "Go to references" },
	{ "n", "gi", vim.lsp.buf.implementation, "Go to implementation" },
	{ "n", "gsh", vim.lsp.buf.signature_help, "Signature help" },
	{ "n", "K", vim.lsp.buf.hover, "Hover documentation" },

	-- actions: <leader>l = "lsp" (global scope, distinct from the buffer-local
	{ "n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol" },
	{ "n", "<leader>ca", vim.lsp.buf.code_action, "Code action" },
	{
		"n",
		"<leader>ld",
		function()
			vim.diagnostic.open_float({ scope = "line" })
		end,
		"Line diagnostics",
	},
	{
		"n",
		"<leader>lf",
		function()
			vim.lsp.buf.format({ async = true })
		end,
		"Format document",
	},
	{
		"n",
		"<leader>ls",
		function()
			local clients = vim.lsp.get_clients()
			local names = {}
			for _, client in ipairs(clients) do
				table.insert(names, client.name)
			end
			vim.notify(
				"Active LSP clients: " .. table.concat(names, " "),
				vim.log.levels.INFO,
				{ title = "LSP Status" }
			)
		end,
		"Show LSP status",
	},
	{
		"n",
		"<leader>lr",
		function()
			vim.cmd("e")
			vim.notify("Reloaded buffer / LSP restarted", vim.log.levels.INFO)
		end,
		"Reload buffer / LSP restart",
	},

	-- diagnostics
	{
		"n",
		"d]",
		function()
			vim.diagnostic.jump({ count = 1 })
		end,
		"Next diagnostic",
	},
	{
		"n",
		"d[",
		function()
			vim.diagnostic.jump({ count = -1 })
		end,
		"Previous diagnostic",
	},
	{ "n", "<leader>dx", vim.diagnostic.setloclist, "Diagnostics loclist" },
}
