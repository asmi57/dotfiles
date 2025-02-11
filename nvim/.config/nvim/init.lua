require("config")
local pipepath = vim.fn.stdpath("cache") .. "/server.pipe"
if not vim.loop.fs_stat(pipepath) then
	local m = vim.fn.serverstart(pipepath)
	-- print(m)
end
