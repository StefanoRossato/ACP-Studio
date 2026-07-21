--------------------------------------------------------------------------------
-- ACP Studio
--
-- Script        : ACP Monitor
-- Purpose       : Entry point for ACP Monitor.
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Resolve Repository Root
--------------------------------------------------------------------------------

local source = debug.getinfo(1, "S").source
local scriptPath = source:sub(2):match("(.*/)")
local repositoryRoot = scriptPath:gsub("/$", "")

--------------------------------------------------------------------------------
-- Configure Package Path
--------------------------------------------------------------------------------

local modulePaths = {
    repositoryRoot .. "/?.lua",
    repositoryRoot .. "/?/init.lua"
}

for _, modulePath in ipairs(modulePaths) do
    if not package.path:find(modulePath, 1, true) then
        package.path = package.path .. ";" .. modulePath
    end
end

--------------------------------------------------------------------------------
-- Bootstrap
--------------------------------------------------------------------------------

local Bootstrap =
    require("Core.Application.Bootstrap")

assert(
    Bootstrap.Initialize(),
    "Unable to initialize ACP Monitor.")

--------------------------------------------------------------------------------
-- Application
--------------------------------------------------------------------------------

local MonitorApplication =
    require("Core.Application.Monitor.MonitorApplication")

MonitorApplication.Initialize()
MonitorApplication.Run()