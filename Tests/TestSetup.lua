----------------------------------------------------------------------
-- ACP Studio
-- TestSetup.lua
--
-- Component     : Technical Bootstrap
-- Layer         : Infrastructure
-- Purpose       : Prepare the Lua execution environment required by
--                 ACP Studio engineering components.
--
-- Notes         :
--   - Resolves the repository location.
--   - Configures Lua package.path.
--   - Enables repository-wide require() calls.
--   - This is the technical bootstrap entry point.
----------------------------------------------------------------------

local scriptPath = debug.getinfo(1, "S").source:match("@?(.*[/\\])")

package.path = package.path
    .. ";" .. scriptPath .. "../?.lua"
    .. ";" .. scriptPath .. "../?/init.lua"
