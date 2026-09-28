return {
	filetypes = { "python", "ipynb" },
	setup = function(bufnr)
		local function map(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
		end

		map("n", "ji", "<cmd>MoltenInit<CR>", "[J]upyter [I]nit kernel")
		map("n", "je", "<cmd>MoltenEvaluateOperator<CR>", "[J]upyter [E]valuate operator")
		map("n", "jl", "<cmd>MoltenEvaluateLine<CR>", "[J]upyter evaluate [L]ine")
		map("n", "jc", "<cmd>MoltenReevaluateCell<CR>", "[J]upyter re-evaluate [C]ell")
		map("n", "jd", "<cmd>MoltenDelete<CR>", "[J]upyter [D]elete cell")
		map("n", "jh", "<cmd>MoltenHideOutput<CR>", "[J]upyter [H]ide output")
		map("v", "jv", ":<C-u>MoltenEvaluateVisual<CR>gv", "[J]upyter evaluate [V]isual selection")
	end,
}
