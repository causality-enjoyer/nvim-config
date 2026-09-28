-- contextual (filetype-local) keymaps.

local ft_modules = {
	"keymaps.ft.markdown",
	"keymaps.ft.latex",
	"keymaps.ft.cpp",
	"keymaps.ft.jupyter",
}

local by_filetype = {}

for _, modname in ipairs(ft_modules) do
	local ok, spec = pcall(require, modname)
	if ok and type(spec) == "table" and spec.setup then
		for _, ft in ipairs(spec.filetypes or {}) do
			by_filetype[ft] = by_filetype[ft] or {}
			table.insert(by_filetype[ft], spec.setup)
		end
	else
		vim.notify("contextual keymaps: failed to load " .. modname, vim.log.levels.WARN)
	end
end

local filetypes = vim.tbl_keys(by_filetype)
if #filetypes > 0 then
	vim.api.nvim_create_autocmd("FileType", {
		pattern = filetypes,
		callback = function(args)
			for _, setup in ipairs(by_filetype[args.match] or {}) do
				setup(args.buf)
			end
		end,
	})
end
