-- https://github.com/olimorris/onedarkpro.nvim

local vars = require("vars")
local transparency = vars.theme ~= "onelight"

return {
	"olimorris/onedarkpro.nvim",
	priority = 1000, -- Ensure it loads first
	config = function()
		require("onedarkpro").setup({
			options = {
				transparency = transparency,
			},
		})

		require("notify").setup({
			background_colour = "#000000",
		})

		vim.cmd.colorscheme(vars.theme)

		vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#FFFFFF", bg = "#282e37", bold = true })
		vim.api.nvim_set_hl(0, "AlphaButtons", { link = "Function" })
		vim.api.nvim_set_hl(0, "AlphaShortcut", { link = "Keyword" })
		vim.api.nvim_set_hl(0, "AlphaFooter", { link = "Identifier" })

		local bg_transparent = transparency

		local toggle_transparency = function()
			bg_transparent = not bg_transparent
			require("onedarkpro").setup({
				options = {
					transparency = bg_transparent,
				},
			})
			vim.cmd.colorscheme(vars.theme)
		end

		vim.keymap.set("n", "<leader>ub", toggle_transparency, { noremap = true, silent = false })
	end,
}
