return {
	filetypes = { "tex", "latex", "markdown" },
	setup = function(bufnr)
		local function map(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
		end

		-- l- keybinds would interfere with hjkl navigation
		-- so leader key for latex file is L for latex
		map("n", "Lc", ":VimtexCompile<CR>", "[L]aTeX [C]ompile")
		map("n", "Lv", ":VimtexView<CR>", "[L]aTeX [V]iew PDF")
		map("n", "Lx", ":VimtexClean<CR>", "[L]aTeX clean au[X] files")
		map("n", "Lk", ":VimtexStop<CR>", "[L]aTeX [K]ill/stop compilation")
		map("n", "Le", ":VimtexErrors<CR>", "[L]aTeX [E]rrors")
		map("n", "Lt", ":VimtexTocToggle<CR>", "[L]aTeX [T]oc toggle")
		map("n", "LI", ":VimtexInfo<CR>", "[L]aTeX [I]nfo")

		map("n", "Lq", [[o$$\begin{equation}<CR>\end{equation}$$<Esc>O<Tab>]], "[L]aTeX e[Q]uation env")
		map("n", "La", [[o$$\begin{align}<CR>\end{align}$$<Esc>O<Tab>]], "[L]aTeX [A]lign env")
		map("v", "Lm", [[c$<C-r>"$<Esc>]], "[L]aTeX wrap in $...$ ([M]ath)")
		map("v", "LM", [[c$$<CR><C-r>"<CR>$$<Esc>]], "[L]aTeX wrap in $$...$$ (display [M]ath)")
	end,
}
