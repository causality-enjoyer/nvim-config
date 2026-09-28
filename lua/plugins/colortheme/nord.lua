-- github.com/shaunsingh/nord.nvim
local vars = require("vars")

return {
	"shaunsingh/nord.nvim",
	priority = 1000, -- Ensure it loads first
	config = function()
		vim.g.nord_disable_background = vars.initial_bg_transparency

		require("notify").setup({
			background_colour = "#2E3440",
			merge_duplicates = true,
		})

		require("nord").set()

		local bg_transparent = vars.initial_bg_transparency

		local toggle_transparency = function()
			bg_transparent = not bg_transparent
			vim.g.nord_disable_background = bg_transparent
			require("nord").set()
			-- nord setting colors washes away lualine's colors, so:
			require("lualine").setup(require("lualine").get_config())
		end

		vim.keymap.set("n", "<leader>ub", toggle_transparency, { noremap = true, silent = false })
	end,
}
