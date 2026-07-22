--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : TrackSelectionPanel
-- Layer         : GUI
-- Purpose       : Renders the track selection panel.
-- Specification : GUI-212
--------------------------------------------------------------------------------

local TrackSelectionPanel = {}

function TrackSelectionPanel.New()

    local Model =
    {
    }

    return Model

end

--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

function TrackSelectionPanel.Render(context,model)

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

return TrackSelectionPanel