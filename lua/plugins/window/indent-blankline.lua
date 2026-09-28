-- https://github.com/lukas-reineke/indent-blankline.nvim
return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = { "BufReadPost", "BufNewFile" },
	---@module "ibl"
	---@type ibl.config
	opts = {
		indent = {
			char = "│",
		},
		scope = {
			enabled = true,
			show_start = false,
			show_end = false,
		},
		exclude = {
			filetypes = {
				"help",
				"alpha",
				"dashboard",
				"neo-tree",
				"Trouble",
				"lazy",
				"mason",
				"notify",
				"toggleterm",
			},
		},
	},
}
