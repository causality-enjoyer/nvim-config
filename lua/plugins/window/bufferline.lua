-- https://github.com/akinsho/bufferline.nvim
-- Keymaps (Alt-Tab cycling, Alt-1..9, close buffer) live in
-- lua/keymaps/buffers.lua.
local colors = require("colors")

return {
	"akinsho/bufferline.nvim",
	dependencies = {
		"moll/vim-bbye",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("bufferline").setup({
			options = {
				mode = "buffers",
				themable = true,
				numbers = "none",
				close_command = "Bdelete! %d",
				buffer_close_icon = "⨯",
				close_icon = "⨯",
				path_components = 1,
				modified_icon = "●",
				left_trunc_marker = "",
				right_trunc_marker = "",
				max_name_length = 30,
				max_prefix_length = 30,
				tab_size = 17,
				diagnostics = false,
				diagnostics_update_in_insert = false,
				color_icons = true,
				show_buffer_icons = true,
				show_buffer_close_icons = true,
				show_close_icon = true,
				persist_buffer_sort = true,
				separator_style = "slope",
				enforce_regular_tabs = true,
				always_show_bufferline = false,
				show_tab_indicators = false,
				indicator = {
					style = "underline",
				},
				icon_pinned = "󰐃",
				minimum_padding = 1,
				maximum_padding = 5,
				maximum_length = 15,
				sort_by = "insert_at_end",
			},
			highlights = {
				buffer_selected = {
					bold = true,
					italic = false,
					fg = colors.on_primary_container,
				},
				buffer_visible = {
					bold = true,
					italic = false,
					fg = colors.on_primary_container,
				},
				separator = {
					fg = colors.on_secondary,
				},
				separator_selected = {
					fg = colors.on_secondary,
				},
				separator_visible = {
					fg = colors.on_secondary,
				},
				indicator_selected = {
					fg = colors.primary,
					bg = colors.primary,
				},
				indicator_visible = {
					fg = colors.primary,
					bg = colors.primary,
				},
				tab = {
					fg = colors.on_secondary,
				},
				tab_selected = {
					fg = colors.on_secondary,
				},
			},
		})
	end,
}
