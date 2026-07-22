--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : MeasurementPanel
-- Layer         : GUI
-- Purpose       : Renders the measurement panel.
-- Specification : GUI-212
--------------------------------------------------------------------------------

local MeasurementPanel = {}


function MeasurementPanel.New()

    local Model =
    {
    }

    return Model

end

--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

function MeasurementPanel.Render(context,model)

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

return MeasurementPanel