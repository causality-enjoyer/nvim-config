-- shared blink.cmp LSP capabilities, used by every language's LSP setup

local M = {}

function M.get()
	return require("blink.cmp").get_lsp_capabilities()
end

return M
