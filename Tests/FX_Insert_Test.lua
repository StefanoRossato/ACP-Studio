----------------------------------------------------------------------
-- ACP Studio
-- FX_Insert_Test.lua
--
-- Purpose : Verify TrackFX_AddByName()
----------------------------------------------------------------------

local JSFX_NAME = "JS: ACP GMem Test"

local track = reaper.GetSelectedTrack(0, 0)

if not track then
    reaper.ShowConsoleMsg("No track selected.\n")
    return
end

local fxCount = reaper.TrackFX_GetCount(track)

reaper.ShowConsoleMsg("--------------------------------------\n")
reaper.ShowConsoleMsg("FX Count : " .. fxCount .. "\n")
reaper.ShowConsoleMsg("--------------------------------------\n")

for i = 0, fxCount - 1 do

    local ok, name =
        reaper.TrackFX_GetFXName(track, i, "")

    if ok then
        reaper.ShowConsoleMsg(
            string.format("[%d] %s\n", i, name)
        )
    end

end

reaper.ShowConsoleMsg("--------------------------------------\n")
reaper.ShowConsoleMsg("Adding : " .. JSFX_NAME .. "\n")

local index =
    reaper.TrackFX_AddByName(
        track,
        JSFX_NAME,
        false,
        1
    )

reaper.ShowConsoleMsg(
    "Returned Index : " ..
    tostring(index) ..
    "\n"
)

reaper.ShowConsoleMsg("--------------------------------------\n")