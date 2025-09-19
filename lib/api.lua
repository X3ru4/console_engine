local M = {}

--ANSI escape code api
M.ansi = {}

---Ex: move_cursor("5;20")
---@param val string
---@return string
function M.ansi.move_cursor(val)
	return "\x1b[" .. val .. "H"
end

function M.ansi.move_cursor_up(val)
	return "\x1b[" .. val .. "A"
end

function M.ansi.move_cursor_down(val)
	return "\x1b[" .. val .. "B"
end

function M.ansi.clear_console()
	print("\x1b[2J\x1b[H")
end

function M.ansi.hide_cursor(val)
	if val == 1 then
		print("\x1b[?25l")
	elseif val == 0 then
		print("\x1b[?25h")
	end
end

---Like lua print() but useful for ANSI
---@param val string
---@param modify string|table|nil
function M.print(val, modify)
	if type(modify) == "table" then
		print("\x1b[H" .. modify[1] .. val .. modify[2])
	elseif type(modify) == "string" then
		print("\x1b[H" .. modify .. val)
	elseif type(modify) == nil then
		print("\x1b[H" .. val)
	end
end

return M
