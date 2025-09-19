local function get_terminal_size()
	local handle = io.popen("stty size", "r")
	if not handle then
		return 24, 80
	end -- fallback
	local result = handle:read("*a")
	handle:close()
	local rows, cols = result:match("(%d+)%s+(%d+)")
	return tonumber(rows), tonumber(cols)
end

local rows, cols = get_terminal_size()
print("Rows:", rows, "Cols:", cols)
