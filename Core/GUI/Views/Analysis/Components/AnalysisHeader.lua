--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : AnalysisHeader
-- Layer         : GUI
-- Purpose       : Renders the Analysis view header.
-- Specification : GUI-212
--------------------------------------------------------------------------------

local AnalysisHeader = {}

function AnalysisHeader.New()

    local Model =
    {
    }

    return Model

end

--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

function AnalysisHeader.Render(context,model)

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

return AnalysisHeader