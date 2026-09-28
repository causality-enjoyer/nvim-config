return {
	{
		"n",
		"<leader>ff",
		function()
			Snacks.picker.files()
		end,
		"[F]ind [F]iles",
	},
	{
		"n",
		"<leader>fg",
		function()
			Snacks.picker.grep()
		end,
		"[F]ind by [G]rep",
	},
	{
		"n",
		"<leader>fr",
		function()
			Snacks.picker.recent()
		end,
		"[F]ind [R]ecent files",
	},
	{
		"n",
		"<leader>fb",
		function()
			Snacks.picker.buffers()
		end,
		"[F]ind [B]uffers",
	},
	{
		"n",
		"<leader>fs",
		function()
			Snacks.picker.lsp_symbols()
		end,
		"[F]ind LSP [S]ymbols",
	},
	{
		"n",
		"<leader>f/",
		function()
			Snacks.picker.grep_buffers()
		end,
		"[F]ind grep in open buffers",
	},
}
