------------------------------------------------------------------------------
-- ACP Studio
-- Toolbar
--
-- GUI-101 — Toolbar Foundation
--
-- Responsibility:
--   Render the application toolbar.
--
-- This module owns the toolbar lifecycle and rendering.
-- No business logic is implemented here.
------------------------------------------------------------------------------

local Toolbar = {}

------------------------------------------------------------------------------
-- Lifecycle
------------------------------------------------------------------------------

function Toolbar.Initialize()
    -- Reserved for future initialization.
end

function Toolbar.Shutdown()
    -- Reserved for future cleanup.
end

------------------------------------------------------------------------------
-- Rendering
------------------------------------------------------------------------------

function Toolbar.Render(ctx)

    if not ctx then
        return
    end

    reaper.ImGui_SeparatorText(ctx, "Toolbar")

end

return Toolbar