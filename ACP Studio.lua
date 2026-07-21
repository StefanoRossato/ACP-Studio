--------------------------------------------------------------------------------
-- ACP Studio
--
-- Script        : ACP Studio
-- Purpose       : Entry point for ACP Studio.
--------------------------------------------------------------------------------

local Bootstrap =
    require("Core.Application.Bootstrap")

local MonitorApplication =
    require("Core.Application.MonitorApplication")

assert(
    Bootstrap.Initialize(),
    "Unable to initialize ACP Studio.")

MonitorApplication.Initialize()
MonitorApplication.Run()