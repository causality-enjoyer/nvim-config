-- lua/plugins/language/cpp.lua
-- Compile/run and DAP debugger keymaps ("cr", "cb", "cd*") live buffer-locally
-- in lua/keymaps/ft/cpp.lua, not here. clangd itself is registered into the
-- shared LSP registry (lua/config/lsp_servers.lua) and actually configured
-- centrally in lua/plugins/workflow/lsp.lua -- see the comment there for why
-- there's only ever one real nvim-lspconfig `config` function.

require("config.lsp_servers").register("clangd", {
	cmd = {
		"clangd",
		"--background-index",
		"--clang-tidy",
		"--completion-style=detailed",
		"--header-insertion=iwyu",
	},
})

return {
	{
		"williamboman/mason-lspconfig.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "clangd" })
		end,
	},

	{
		"williamboman/mason.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "codelldb", "clang-format" })
		end,
	},

	-- clangd_extensions.nvim: inlay hints and an AST viewer (:ClangdAST).
	-- Attaches itself to clangd automatically once clangd is running.
	{
		"p00f/clangd_extensions.nvim",
		lazy = true,
		event = "LspAttach",
		opts = {
			inlay_hints = {
				inline = false,
			},
			ast = {
				role_icons = {
					type = "",
					declaration = "",
					expression = "",
					specifier = "",
					statement = "",
					["template argument"] = "",
				},
			},
		},
		config = function(_, opts)
			require("clangd_extensions").setup(opts)
		end,
	},

	-- nvim-dap: the debugger core, wired to codelldb for C/C++.
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"williamboman/mason.nvim",
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
		},
		ft = { "c", "cpp" },
		config = function()
			local dap = require("dap")
			local mason_registry = require("mason-registry")

			-- codelldb's install path includes a version hash, so we ask
			-- mason-registry for it at runtime rather than hardcoding a path.
			local codelldb_path = mason_registry.get_package("codelldb"):get_install_path() .. "/extension/"
			local codelldb_cmd = codelldb_path .. "adapter/codelldb"

			dap.adapters.codelldb = {
				type = "server",
				port = "${port}",
				executable = {
					command = codelldb_cmd,
					args = { "--port", "${port}" },
				},
			}

			dap.configurations.cpp = {
				{
					name = "Launch file",
					type = "codelldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
					args = {},
				},
			}
			dap.configurations.c = dap.configurations.cpp

			local dapui = require("dapui")
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},

	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		opts = {},
	},
}
