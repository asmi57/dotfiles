local grp = "FunkyFolds"
local grpid = vim.api.nvim_create_augroup(grp, { clear = true })


vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	group = grpid,
	pattern = { "*.java", "*.c", "*.h", "*.cpp", "*.hpp", "*.rs" },
	desc = "",
	callback = function(event)
		local win = vim.fn.bufwinid(event.buf)
		vim.wo[win].foldmethod = "expr"
		vim.wo[win].foldexpr = 'luaeval("(FoldHandlers)(vim.v.lnum)")'

		FoldHandler = function(lnum)
			local line = vim.fn.getline(lnum)
			local starts = string.find(line, "^%s*/%*.*$") ~= nil
			local ends = string.find(line, "^.*%*/.*$") ~= nil
			Ret = { starts, ends }

			if starts and not ends then
				return "a1"
			end

			if ends and not starts then
				return "s1"
			end

			return "-1"
		end
	end
})

FoldHandler = function ()
	return "-1"
end
