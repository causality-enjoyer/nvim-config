-- files for custom nvim functions that i
-- sometimes use, its helpful,
-- but not necessarily important for me

local cmd = vim.api.nvim_create_autocmd
local diagnostic = vim.diagnostic.config
local user_cmd = vim.api.nvim_create_user_command

cmd("BufWritePost", {
	pattern = { "*.ipynb" },
	callback = function()
		if require("molten.status").initialized() == "Molten" then
			vim.cmd("MoltenExportOutput!")
		end
	end,
})

local function open_dir()
	vim.ui.input({ prompt = "Directory (relative to ~): " }, function(input)
		if not input or input == "" then
			return
		end

		local path = vim.fn.expand("~/" .. input)

		if vim.fn.isdirectory(path) == 0 then
			vim.notify("Not a directory: " .. path, vim.log.levels.ERROR)
			return
		end

		vim.cmd("cd " .. vim.fn.fnameescape(path))
		vim.cmd("e.")
	end)
end
user_cmd("OpenDir", open_dir, {})

diagnostic({
	jump = {
		on_jump = function()
			vim.diagnostic.open_float()
		end,
	},
})
