return {
	{
		"n",
		"<leader>nd",
		function()
			require("noice").cmd("dismiss")
		end,
		"Dismiss all notifications",
	},
	{
		"n",
		"<leader>nl",
		function()
			require("noice").cmd("last")
		end,
		"Show last notification",
	},
	{
		"n",
		"<leader>nh",
		function()
			require("noice").cmd("history")
		end,
		"Notification history",
	},
	{
		{ "i", "n", "s" },
		"<C-f>",
		function()
			if not require("noice.lsp").scroll(4) then
				return "<C-f>"
			end
		end,
		"Scroll noice popup down",
		{ expr = true },
	},
	{
		{ "i", "n", "s" },
		"<C-b>",
		function()
			if not require("noice.lsp").scroll(-4) then
				return "<C-b>"
			end
		end,
		"Scroll noice popup up",
		{ expr = true },
	},

	-- image paste
	{ "n", "<leader>pi", "<cmd>PasteImage<CR>", "[P]aste [I]mage from clipboard" },
}
