-- Bootstrap lazy.nvim
-- https://github.com/lazyvim/lazyvim
local theme = require("vars")
local colorscheme = theme.theme
if colorscheme == "onelight" then
	colorscheme = "onedark"
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	require("plugins.window.ui-noice"),
	require("plugins.window.neo-tree"),
	require("plugins.window.qol-snacks"),
	require("plugins.window.bufferline"),
	require("plugins.window.lualine"),
	require("plugins.window.dashboard-alpha"),
	require("plugins.window.indent-blankline"),

	require("plugins.colortheme." .. theme.theme),

	require("plugins.language.lua"),
	require("plugins.language.cpp"),
	require("plugins.language.typescript"),
	require("plugins.language.tex"),
	require("plugins.language.markdown"),
	require("plugins.language.misc-lsp"),
	require("plugins.language.live-server-php"),
	require("plugins.language.lazydev"),
	require("plugins.language.python"),

	-- this lsp file is a binding file
	-- takes all the languages and is then finally loaded
	-- so it must be after all the plugins.language.* files
	require("plugins.workflow.lsp"),

	require("plugins.workflow.treesitter"),
	require("plugins.workflow.telescope"),
	require("plugins.workflow.mason"),
	require("plugins.workflow.completion"),
	require("plugins.workflow.zen-mode"),
	require("plugins.workflow.conform"),
	require("plugins.workflow.autopairs"),
	require("plugins.workflow.session"),

	require("plugins.utils.markdown-preview"),
	require("plugins.utils.img-clip"),
	require("plugins.utils.markdown-renderer"),
	require("plugins.utils.git"),
	require("plugins.utils.image-cursor"),
	require("plugins.utils.image-preview"),
	require("plugins.utils.toggleterm"),

	install = { colorscheme = { "habamax" } },
	checker = { enabled = true },
})
