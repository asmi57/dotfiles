local default_args = {
	pylint = {
		'-m', 'pylint',
		'-f', 'json',
		'--from-stdin',
		function() return vim.api.nvim_buf_get_name(0) end,
		'--disable=import-error',
		'--disable=assignment-from-no-return',
		'--disable=wrong-import-position',
		'--max-line-length=999',
	},
	mypy = {
		'-m', 'mypy',
		'--strict',
		'--disallow-untyped-defs',
		-- '--disable-error-code=empty-body',
		-- '--disable-error-code=return',
		'--explicit-package-bases',
		'--show-column-numbers',
		'--show-error-end',
		'--hide-error-context',
		'--no-color-output',
		'--no-error-summary',
		'--no-pretty',
	}
}
LintArgs = default_args

local tableConcat = function(t1, t2)
	for i = 1, #t2 do
		t1[#t1 + 1] = t2[i]
	end
	return t1
end

AddLintArg = function(linter, arg)
	if type(arg) == "string" then
		table.insert(LintArgs[linter], arg)
	else
		tableConcat(LintArgs[linter], arg)
	end
	require('lint').linters[linter].args = LintArgs[linter]
end
ResetLintArgs = function()
	for k, v in pairs(default_args) do
		LintArgs[k] = v
		require('lint').linters[k].args = LintArgs[k]
	end
end


return {
	'mfussenegger/nvim-lint',
	config = function()
		local nvimlint = require('lint')
		-- Set linters
		nvimlint.linters_by_ft = {
			python = { 'pylint', 'mypy' },
			markdown = { 'rumdl' },
		}

		-- Set running linters on buffer save
		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				nvimlint.try_lint()
			end,
		})

		-- Set pylint to work in virtualenv
		nvimlint.linters.pylint.cmd = 'python'
		nvimlint.linters.pylint.args = LintArgs.pylint

		nvimlint.linters.mypy.cmd = 'python'
		nvimlint.linters.mypy.args = LintArgs.mypy

		nvimlint.linters.rumdl.cmd = 'rumdl'
		nvimlint.linters.rumdl.args = { "check" }
	end
}
