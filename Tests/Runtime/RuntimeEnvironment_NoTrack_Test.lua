
dofile(
    debug.getinfo(1, "S").source:match("@?(.*[/\\])") ..
    "../TestSetup.lua"
)
local Environment = require("Core.Runtime.RuntimeEnvironment")


assert(Environment.Initialize())

assert(Environment.GetRuntimeTrack() == nil)

assert(Environment.Validate() == false)

assert(Environment.GetRuntimeTrack() == nil)

assert(Environment.IsReady() == false)
