
local lookuptable = {
	["lua"] = { "--", "%-%-" },
	["c"] = { "//" },
	["rust"] = { "//" },
	["fish"] = { "#" },
	["bash"] = { "#" },
	["gdscript"] = { "#" },
	["python"] = { "#" },
}

local sepwhitespace = function(text)
	local text = tostring(text)
	local i = text:find("%S") or 1
	local l = text:len()
	return text:sub(1, i - 1), text:sub(i, l)
end

local commentstr = function()
	local t = lookuptable[vim.bo.filetype] or { "//" }
	return t[1], t[2] or t[1]
end

local iscommented = function(text)
	local _, rest = sepwhitespace(text)
	local cstr = commentstr()
	local potential = rest:sub(1, cstr:len())
	return cstr == potential
end

local comment = function(text)
	local wspace, rest = sepwhitespace(text)
	return string.format("%s%s %s", wspace, commentstr(), rest)
end

local uncomment = function(text)
	local _, cstr = commentstr()
	local sub, n = string.gsub(text, cstr .. " ?", "", 1)
	return sub
end

F = function()
	local startline = vim.fn.line('v')
	local endline = vim.fn.line('.')

	local cursor = vim.fn.getpos('.')
	local hasmoved = false
	for ln = startline, endline, 1 do
		local linetext = vim.fn.getline(ln)
		if iscommented(linetext) then
			if not hasmoved then
				cursor[3] = cursor[3] - 3
				vim.fn.setpos('.', cursor)
				hasmoved = true
			end
			vim.fn.setline(ln, uncomment(linetext))
		else
			vim.fn.setline(ln, comment(linetext))
			if not hasmoved then
				cursor[3] = cursor[3] + 3
				vim.fn.setpos('.', cursor)
				hasmoved = true
			end
		end
	end
end

-- vim.keymap.set("n", "", F)

return F
