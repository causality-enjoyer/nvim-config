local vars = require("languages")

local M = {}

local function as_list(value)
	if value == nil then
		return {}
	end
	if type(value) == "string" then
		return { value }
	end
	return value
end

local function sorted_languages()
	local names = vim.tbl_keys(vars.languages)
	table.sort(names) -- stable order, regardless of pairs()
	local out = {}
	for _, name in ipairs(names) do
		table.insert(out, { name = name, spec = vars.languages[name] })
	end
	return out
end

local function collect(field, extra)
	local seen, out = {}, {}
	local function add(items)
		for _, item in ipairs(as_list(items)) do
			if not seen[item] then
				seen[item] = true
				table.insert(out, item)
			end
		end
	end
	for _, lang in ipairs(sorted_languages()) do
		add(lang.spec[field])
	end
	add(extra)
	return out
end

function M.lsp_servers()
	return collect("lsp")
end

function M.tools()
	return collect("tools")
end

function M.treesitter()
	return collect("ts", vars.treesitter_extra)
end

function M.formatters_by_ft()
	local out = {}
	for _, lang in ipairs(sorted_languages()) do
		local spec = lang.spec
		if spec.formatter then
			local formatter = as_list(spec.formatter)
			for _, ft in ipairs(as_list(spec.ft or lang.name)) do
				out[ft] = formatter
			end
		end
	end
	return out
end

return M
