-------------------------------------------------------------------------------
-- Project      : ACP Studio
-- Component    : Menu Bar
-- Module       : MenuBar
-- File         : Core/GUI/MenuBar/MenuBar.lua
--
-- Purpose
-- -------
-- Provides the foundation of the application's Menu Bar.
--
-- Responsibilities
-- ----------------
-- • Manage the Menu Bar lifecycle.
-- • Maintain the menu registry.
-- • Expose a minimal public API.
--
-- Public API
-- ----------
-- Initialize(window)
-- Shutdown()
-- IsInitialized()
-- AddMenu(name)
-- GetMenu(name)
--
-- Certification
-- -------------
-- GUI-104 : Menu Bar Foundation
-------------------------------------------------------------------------------

local MenuBar = {}

-------------------------------------------------------------------------------
-- Private State
-------------------------------------------------------------------------------

local initialized = false
local mainWindow = nil
local menus = {}

--------------------------------------------------------------------------------
-- Initializes the component.
--
-- Parameters
-- ----------
-- window
--     Main Window instance.
-------------------------------------------------------------------------------
function MenuBar.Initialize(window)

    mainWindow = window
    menus = {}

    initialized = true

end

-------------------------------------------------------------------------------
-- Shuts down the component.
-------------------------------------------------------------------------------
function MenuBar.Shutdown()

    menus = {}
    mainWindow = nil

    initialized = false

end

-------------------------------------------------------------------------------
-- Returns whether the component has been initialized.
--
-- Returns
-- -------
-- True if initialized, otherwise false.
-------------------------------------------------------------------------------
function MenuBar.IsInitialized()

    return initialized

end

-------------------------------------------------------------------------------
-- Public API
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Registers a new menu.
--
-- Parameters
-- ----------
-- name
--     Menu name.
-------------------------------------------------------------------------------
function MenuBar.AddMenu(name)

    menus[name] = {}

end

-------------------------------------------------------------------------------
-- Returns a registered menu.
--
-- Parameters
-- ----------
-- name
--     Menu name.
--
-- Returns
-- -------
-- Registered menu or nil.
-------------------------------------------------------------------------------
function MenuBar.GetMenu(name)

    return menus[name]

end

return MenuBar