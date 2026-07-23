--------------------------------------------------------------------------------
-- ACP Studio
--
-- Script        : ACP Monitor
-- Purpose       : Entry point for ACP Monitor.
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Resolve Repository Root
--------------------------------------------------------------------------------

local source =
    debug.getinfo(1, "S").source

local scriptPath =
    source:sub(2):match("(.*/)")

local repositoryRoot =
    scriptPath:gsub("/$", "")

--------------------------------------------------------------------------------
-- Configure Package Path
--------------------------------------------------------------------------------

package.path =
    package.path
    .. ";"
    .. repositoryRoot
    .. "/?.lua"
    .. ";"
    .. repositoryRoot
    .. "/?/init.lua"

--------------------------------------------------------------------------------
-- Bootstrap
--------------------------------------------------------------------------------

local Bootstrap =
    require(
        "Core.Application.ApplicationBootstrapper"
    )

assert(
    Bootstrap.Initialize(),
    "Unable to initialize ACP Monitor."
)

--------------------------------------------------------------------------------
-- Application
--------------------------------------------------------------------------------

local MonitorApplication =
    require(
        "Core.Application.Monitor.MonitorApplication"
    )

MonitorApplication.Initialize()

MonitorApplication.Run()