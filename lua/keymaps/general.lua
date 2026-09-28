return {
	-- window navigation
	{ { "n", "v", "i" }, "<C-h>", "<C-w>h", "Go to left window" },
	{ { "n", "v", "i" }, "<C-j>", "<C-w>j", "Go to lower window" },
	{ { "n", "v", "i" }, "<C-k>", "<C-w>k", "Go to upper window" },
	{ { "n", "v", "i" }, "<C-l>", "<C-w>l", "Go to right window" },

	-- save / quit
	{ { "n", "i" }, "<C-s>", "<cmd>w<CR>", "Save file" },
	{ { "n", "i" }, "<A-s>", "<cmd>noautocmd w<CR>", "Save without auto-formatting" },
	{ { "n", "i" }, "<C-q>", "<cmd>q<CR>", "Quit file" },

	-- indentation
	{ "n", "<S-Tab>", "<<", "Remove indentation inline" },
	{ "i", "<S-Tab>", "<C-d>", "Remove indentation inline" },
	{ "v", "<S-Tab>", "<gv", "Remove indentation inline" },
	{ "v", "<", "<gv", "Indent left and reselect" },
	{ "v", ">", ">gv", "Indent right and reselect" },

	-- delete without clobbering the unnamed register
	{ { "n", "v" }, "x", '"_x', "Delete character without copying" },
	{ "v", "p", '"_dP', "Paste without replacing register" },

	-- scroll + center
	{ "n", "<C-d>", "<C-d>zz", "Scroll down and center" },
	{ "n", "<C-u>", "<C-u>zz", "Scroll up and center" },

	-- search navigation + center
	{ "n", "n", "nzzzv", "Next search result and center" },
	{ "n", "N", "Nzzzv", "Previous search result and center" },

	-- window resizing
	{ "n", "<Up>", ":resize -2<CR>", "Decrease window height" },
	{ "n", "<Down>", ":resize +2<CR>", "Increase window height" },
	{ "n", "<Left>", ":vertical resize -2<CR>", "Decrease window width" },
	{ "n", "<Right>", ":vertical resize +2<CR>", "Increase window width" },
}
