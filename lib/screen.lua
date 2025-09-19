local M = {}

---Get console size
---@return integer, integer
M.get_size = function()
	local handle = io.popen("stty size", "r")
	if not handle then
		return 0, 0
	end
	local result = handle:read("a")
	handle:close()
	return result:match("(%d+)%s+(%d+)")
end

function M.fill_screen(str)
	local h, w = M.get_size()
	print(string.rep(str, h * w))
end

return M
