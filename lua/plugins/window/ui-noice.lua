-- https://github.com/folke/noice.nvim
-- noice.nvim: replaces the cmdline, messages, and popups with styled floating windows.
-- Keymaps live in lua/keymaps/ui.lua.
return {
	"folke/noice.nvim",
	lazy = false,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},

	opts = {
		cmdline = {
			enabled = true,
			view = "cmdline_popup",
			format = {
				cmdline = { icon = ">" },
				search_down = { icon = " " },
				search_up = { icon = " " },
				filter = { icon = "$" },
				lua = { icon = "☾" },
				help = { icon = "?" },
			},
		},

		messages = {
			enabled = true,
			view = "notify",
			view_error = "notify",
			view_warn = "notify",
			view_history = "messages",
			view_search = "virtualtext",
		},

		lsp = {
			progress = {
				enabled = true,
				view = "mini",
			},
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
			hover = { enabled = true },
			signature = { enabled = true },
			message = { enabled = true, view = "notify" },
		},

		popupmenu = {
			enabled = true,
			backend = "nui",
		},

		presets = {
			bottom_search = true,
			command_palette = true,
			long_message_to_split = true,
			inc_rename = false,
			lsp_doc_border = true,
		},

		routes = {
			{
				filter = { event = "msg_show", kind = "", find = "written" },
				opts = { skip = false },
				view = "mini",
			},
			{
				filter = { event = "msg_show", find = "search hit" },
				opts = { skip = true },
			},
			{
				filter = { event = "msg_show", find = "No more valid" },
				opts = { skip = true },
			},
		},

		views = {
			notify = {
				merge = false,
				replace = false,
			},
			mini = {
				win_options = { winblend = 0 },
				timeout = 200,
			},
		},
	},

	config = function(_, opts)
		require("notify").setup({
			background_color = "#2E3440",
		})

		require("noice").setup(opts)
	end,
}
