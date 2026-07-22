--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : AnalysisStatusPanel
-- Layer         : GUI
-- Purpose       : Renders the analysis status panel.
-- Specification : GUI-212
--------------------------------------------------------------------------------

local AnalysisStatusPanel = {}


function AnalysisStatusPanel.New()

    local Model =
    {
    }

    return Model

end

--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

function AnalysisStatusPanel.Render(context,model)

    reaper.ImGui_Text(
        context,
        "Track Selection")

    if model.SelectedTrack then

        reaper.ImGui_Text(
            context,
            model.SelectedTrack.Name)

    else

        reaper.ImGui_Text(
            context,
            "No track selected.")

    end

end

--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return AnalysisStatusPanel