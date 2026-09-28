-- NEEDS FIXING
-- Jupyter notebooks in Neovim: molten (kernel execution) + jupytext (.ipynb <-> .py conversion)
-- https://github.com/benlubas/molten-nvim
-- https://github.com/GCBallesteros/jupytext.nvim
-- Molten keymaps ("ji", "je", "jl", "jc", "jd", "jh", "jv") live buffer-locally
-- in lua/keymaps/ft/jupyter.lua, not here.
return {
	{
		"benlubas/molten-nvim",
		version = "^1.0.0", -- pin to major version; breaking changes happen across majors
		build = ":UpdateRemotePlugins",
		dependencies = { "3rd/image.nvim" },
		ft = { "python", "ipynb" },
		init = function()
			vim.g.molten_image_provider = "image.nvim"
			vim.g.molten_output_win_max_height = 20
			vim.g.molten_auto_open_output = true
			vim.g.molten_wrap_output = true
			vim.g.molten_virt_text_output = true
		end,
		config = function()
			vim.fn["remote#host#Require"]("python3")
		end,
	},
	{
		"GCBallesteros/jupytext.nvim",
		event = "BufReadPre *.ipynb",
		lazy = false,
		opts = {
			style = "markdown",
			output_extension = "md",
			force_ft = "markdown",
		},
	},
}
