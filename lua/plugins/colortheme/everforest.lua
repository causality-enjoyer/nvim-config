-- https://github.com/neanias/everforest-nvim

local vars = require("vars")

return {
	"sainnhe/everforest",
	lazy = false,
	priority = 1000,
	config = function()
		vim.g.everforest_enable_italic = true
		if vars.initial_bg_transparency == true then
			vim.g.everforest_transparent_background = 2
		else
			vim.g.everforest_transparent_background = 0
		end
		vim.cmd.colorscheme("everforest")

		local bg_transparent = true

		local function toggle_transparency()
			bg_transparent = not bg_transparent

			if bg_transparent then
				vim.g.everforest_transparent_background = 2
				vim.cmd.colorscheme("everforest")
			else
				vim.g.everforest_transparent_background = 0
				vim.cmd.colorscheme("everforest")
			end
		end

		vim.keymap.set(
			"n",
			"<leader>ub",
			toggle_transparency,
			{ noremap = true, silent = true, desc = "Toggle background transparency" }
		)
	end,
}
