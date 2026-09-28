local keymaps = {
	{ "n", "<A-Tab>", ":bnext<CR>", "Next buffer" },
	{ "n", "<A-S-Tab>", ":bprevious<CR>", "Previous buffer" },
	{ "n", "<A-w>", ":Bdelete!<CR>", "Close buffer" },
	{ "n", "bn", "<cmd>enew<CR>", "Open new buffer" },
	{ "n", "b[", "<cmd>BufferLineMovePrev<CR>", "Move buffer left" },
	{ "n", "b]", "<cmd>BufferLineMovePrev<CR>", "Move buffer right" },
}

for i = 1, 9 do
	table.insert(keymaps, {
		"n",
		"<A-" .. i .. ">",
		"<cmd>BufferLineGoToBuffer " .. i .. "<CR>",
		"Go to buffer " .. i,
	})
end

return keymaps
