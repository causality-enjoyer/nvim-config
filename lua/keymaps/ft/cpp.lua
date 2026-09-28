return {
	filetypes = { "c", "cpp" },
	setup = function(bufnr)
		local function map(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
		end

		-- cr to compile and run current file
		map("n", "cr", function()
			local file = vim.fn.expand("%:p")
			local dir = vim.fn.expand("%:p:h")
			local name = vim.fn.expand("%:t:r")

			local ext = vim.fn.expand("%:e")
			local compiler = (ext == "c") and "clang" or "clang++"
			local std_flag = (ext == "c") and "-std=c17" or "-std=c++20"

			local compile_cmd = string.format(
				"%s %s -Wall -Wextra -g -o %s/%s %s && %s/%s",
				compiler,
				std_flag,
				dir,
				name,
				file,
				dir,
				name
			)

			local Terminal = require("toggleterm.terminal").Terminal
			local run_term = Terminal:new({
				cmd = compile_cmd,
				direction = "float",
				close_on_exit = false,
			})
			run_term:toggle()
		end, "[C]ompile & [R]un current file")

		-- cb to cmake build
		map("n", "cb", function()
			local Terminal = require("toggleterm.terminal").Terminal
			local build_term = Terminal:new({
				cmd = "cmake --build build",
				direction = "horizontal",
				close_on_exit = false,
			})
			build_term:toggle()
		end, "[C]make [B]uild")

		-- cd = c debugger, under which we have:
		map("n", "cdb", function() -- toggle breakpoint
			require("dap").toggle_breakpoint()
		end, "[C]/[D]ebug: toggle [B]reakpoint")

		map("n", "cdc", function() -- continue/start
			require("dap").continue()
		end, "[C]/[D]ebug: [C]ontinue / start")

		map("n", "cdi", function() -- step into
			require("dap").step_into()
		end, "[C]/[D]ebug: step [I]nto")

		map("n", "cdo", function() -- step over
			require("dap").step_over()
		end, "[C]/[D]ebug: step [O]ver")

		map("n", "cdO", function() -- step out
			require("dap").step_out()
		end, "[C]/[D]ebug: step [O]ut")

		map("n", "cdt", function() -- terminate
			require("dap").terminate()
		end, "[C]/[D]ebug: [T]erminate")

		map("n", "cdu", function() -- toggle
			require("dapui").toggle()
		end, "[C]/[D]ebug: toggle [U]I")
	end,
}
