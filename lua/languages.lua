return {
	languages = {
		lua = { formatter = "stylua", tools = "stylua", ts = "lua" },
		cpp = {
			ft = { "c", "cpp" },
			formatter = "clang-format",
			tools = { "clang-format", "codelldb" },
			ts = { "c", "cpp" },
		},
		typescript = {
			ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
			formatter = { "prettierd", "prettier", stop_after_first = true },
			tools = "prettierd",
			ts = { "javascript", "typescript", "tsx" },
		},

		-- default-config languages
		python = {
			lsp = { "pyright", "ruff" },
			formatter = { "ruff_organize_imports", "ruff_format" },
			tools = "ruff",
			ts = "python",
		},
		json = { lsp = "jsonls", formatter = "prettierd", tools = "prettierd", ts = "json" },
		bash = {
			ft = { "sh", "bash" },
			lsp = "bashls",
			formatter = "shfmt",
			tools = "shfmt",
			ts = "bash",
		},
		css = {
			lsp = { "cssls", "tailwindcss" },
			formatter = "prettierd",
			tools = "prettierd",
			ts = "css",
		},
		html = { ts = "html" },
		verilog = {
			ft = { "verilog", "systemverilog" },
			lsp = "verible",
			formatter = "verible_verilog_format",
			tools = "verible",
			ts = "verilog",
		},
		markdown = { ts = { "markdown", "markdown_inline" } }, -- marksman lives in language/markdown.lua
	},

	-- parsers that aren't tied to any language entry above
	treesitter_extra = { "vim", "vimdoc", "regex", "gitignore", "sql", "toml", "yaml", "make", "cmake", "m" },
}
