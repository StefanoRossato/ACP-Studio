--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : ActionBar
-- Layer         : GUI
-- Purpose       : Renders the analysis action bar.
-- Specification : GUI-212
--------------------------------------------------------------------------------

local ActionBar = {}

function ActionBar.New()

    local Model =
    {
    }

    return Model

end

--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

function ActionBar.Render(context,model)

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

return ActionBar