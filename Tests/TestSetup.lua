
local scriptPath = debug.getinfo(1, "S").source:match("@?(.*[/\\])")

package.path = package.path
    .. ";" .. scriptPath .. "../?.lua"
    .. ";" .. scriptPath .. "../?/init.lua"
