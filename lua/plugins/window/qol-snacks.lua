-- https://github.com/folke/snacks.nvim
-- Picker keymaps (<leader>ff/fg/fr/fb/fs/f/) live in lua/keymaps/find.lua.

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		dashboard = { enabled = false }, -- we use alpha.nvim instead, see plugins/window/greeter.lua
		explorer = { enabled = false },
		indent = { enabled = false },
		input = { enabled = true },
		picker = {
			enabled = true,
			sources = {
				files = {
					hidden = true,
				},
			},
		},
		notifier = { enabled = false },
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
	},
}
