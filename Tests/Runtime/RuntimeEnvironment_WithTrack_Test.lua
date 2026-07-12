
dofile(
    debug.getinfo(1, "S").source:match("@?(.*[/\\])") ..
    "../TestSetup.lua"
)
local Environment = require("Core.Runtime.RuntimeEnvironment")


RuntimeEnvironment.Initialize()

RuntimeEnvironment.Validate()

RuntimeEnvironment.IsReady() == true

RuntimeEnvironment.GetRuntimeTrack() ~= nil

RuntimeEnvironment.GetRuntimePlugin() ~= nil