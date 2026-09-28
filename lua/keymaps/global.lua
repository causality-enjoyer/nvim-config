local map = vim.keymap.set

local modules = {
	"keymaps.general",
	"keymaps.windows",
	"keymaps.tabs",
	"keymaps.buffers",
	"keymaps.find",
	"keymaps.lsp",
	"keymaps.git",
	"keymaps.neotree",
	"keymaps.terminal",
	"keymaps.ui",
}

for _, mod in ipairs(modules) do
	local ok, keymaps = pcall(require, mod)
	if not ok then
		vim.notify("keymaps: failed to load " .. mod .. ": " .. keymaps, vim.log.levels.WARN)
	elseif type(keymaps) == "table" then
		for _, keymap in ipairs(keymaps) do
			local modes, lhs, rhs, desc, opts = keymap[1], keymap[2], keymap[3], keymap[4], keymap[5]
			local final_opts = vim.tbl_extend("force", { silent = true, noremap = true, desc = desc }, opts or {})
			map(modes, lhs, rhs, final_opts)
		end
	end
end

map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, desc = "Down (wrap-aware)" })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, desc = "Up (wrap-aware)" })
