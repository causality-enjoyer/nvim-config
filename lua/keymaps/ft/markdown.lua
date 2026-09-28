-- Markdown contextual keymaps: prefix "m", buffer-local, no <leader> needed.
-- e.g. in a markdown buffer, typing `mp` previews, `mr` toggles rendering.

return {
	filetypes = { "markdown" },
	setup = function(bufnr)
		local function map(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
		end

		map("n", "mp", "<cmd>MarkdownPreview<CR>", "[M]arkdown [P]review (split)")
		map("n", "mr", "<cmd>RenderMarkdown toggle<CR>", "[M]arkdown [R]ender toggle")
		map("v", "mb", [[c**<C-r>"**<Esc>]], "[M]arkdown wrap in [B]old")
		map("v", "mi", [[c*<C-r>"*<Esc>]], "[M]arkdown wrap in [B]old")

		-- `*` -> `**`, `**` -> `****` with cursor left in the middle
		vim.keymap.set("i", "*", function()
			local line = vim.api.nvim_get_current_line()
			local col = vim.api.nvim_win_get_cursor(0)[2]

			local char_before = line:sub(col, col)
			local char_after = line:sub(col + 1, col + 1)

			if char_before == "*" and char_after == "*" then
				return "**<Left>"
			end

			if char_before == "*" then
				return "*<Right>**<Left><Left>"
			end

			if char_after == "*" then
				return "<Right>"
			end

			return "**<Left>"
		end, {
			expr = true,
			buffer = bufnr,
			silent = true,
			desc = "Smart ** wrapping",
		})
	end,
}
