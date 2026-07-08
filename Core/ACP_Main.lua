--------------------------------------------------
-- ACP Studio v0.1
-- Analog Preparation Assistant
--------------------------------------------------

local VERSION = "0.1.0"

--------------------------------------------------
-- Utility
--------------------------------------------------

local function printHeader()

    reaper.ClearConsole()

    reaper.ShowConsoleMsg(
        "==============================\n" ..
        "ACP Studio v" .. VERSION .. "\n" ..
        "Analog Preparation Assistant\n" ..
        "==============================\n\n"
    )

end

--------------------------------------------------
-- Track Detection
--------------------------------------------------

local function getSelectedTrack()

    return reaper.GetSelectedTrack(0, 0)

end

local function printTrackInfo(track)

    local _, name = reaper.GetTrackName(track)
    local index = math.floor(reaper.GetMediaTrackInfo_Value(track, "IP_TRACKNUMBER"))
    local sampleRate = reaper.GetSetProjectInfo(0, "PROJECT_SRATE", 0, false)

    if sampleRate == 0 then
        sampleRate = reaper.GetSetProjectInfo(0, "PROJECT_SRATE_USE", 0, false)
    end

    reaper.ShowConsoleMsg("Selected Track\n")
    reaper.ShowConsoleMsg("------------------------------\n")
    reaper.ShowConsoleMsg("Name        : " .. name .. "\n")
    reaper.ShowConsoleMsg("Track Index : " .. index .. "\n")
    reaper.ShowConsoleMsg(string.format("Sample Rate : %d\n", sampleRate))

end

--------------------------------------------------
-- Main
--------------------------------------------------

local function main()

    printHeader()

    local track = getSelectedTrack()

    if not track then

        reaper.ShowConsoleMsg("No track selected.\n")
        return

    end

    printTrackInfo(track)

end

main()