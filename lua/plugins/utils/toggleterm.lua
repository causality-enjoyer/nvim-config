-- lua/plugins/utils/toggleterm.lua
-- Float/vertical terminal toggles live in lua/keymaps/terminal.lua.
-- C/C++ compile-and-run / cmake-build terminals live buffer-locally in
-- lua/keymaps/ft/cpp.lua ("cr" / "cb").

return {
	"akinsho/toggleterm.nvim",
	version = "*",
	-- `cmd` + this raw open_mapping key cover lazy-loading: `<leader>tf`/`tv`
	-- (keymaps/terminal.lua) and "cr"/"cb" (keymaps/ft/cpp.lua) all resolve
	-- to :ToggleTerm / require("toggleterm...") under the hood, so `cmd`
	-- alone won't trigger lazy-loading for them since they're plain
	-- vim.keymap.set calls, not lazy.nvim `keys` specs. Simplest fix: don't
	-- lazy-load this one at all.
	lazy = false,
	opts = {
		size = function(term)
			if term.direction == "horizontal" then
				return 15
			elseif term.direction == "vertical" then
				return vim.o.columns * 0.4
			end
		end,
		open_mapping = [[<c-\>]],
		direction = "horizontal",
		shading_factor = 2,
		float_opts = {
			border = "curved",
		},
	},
	config = function(_, opts)
		require("toggleterm").setup(opts)

		local function set_terminal_keymaps()
			local map_opts = { buffer = 0 }
			vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], map_opts)
			vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], map_opts)
			vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], map_opts)
			vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], map_opts)
			vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], map_opts)
			vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], map_opts)
		end

		vim.api.nvim_create_autocmd("TermOpen", {
			pattern = "term://*toggleterm#*",
			callback = set_terminal_keymaps,
		})
	end,
}
