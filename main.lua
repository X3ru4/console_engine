local scr = require("lib.screen")
local api = require("lib.api")

local height, width = scr.get_size()

scr.fill_screen(".")
api.print("Huy")
api.print("Hello", { "\x1b[34m", " Huy" })
