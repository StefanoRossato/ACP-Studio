----------------------------------------------------------------------
-- ACP Studio
-- WindowLayout
----------------------------------------------------------------------

local WindowLayout = {}

----------------------------------------------------------------------
-- Render
----------------------------------------------------------------------

function WindowLayout.Render(context)

    reaper.ImGui_Text(context, "ACP Studio")
    reaper.ImGui_Separator(context)
    reaper.ImGui_Text(context, "Main Window Foundation")

end

----------------------------------------------------------------------
-- Module
----------------------------------------------------------------------

return WindowLayout