--------------------------------------------------
-- ACP Studio v0.1
-- Analog Preparation Assistant
--------------------------------------------------

--------------------------------------------------
-- Constants
--------------------------------------------------

local VERSION = "0.1.0"
local ANALYZER_NAME = "JS:ACP Studio/ACP_Analyzer"

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
-- Track
--------------------------------------------------

local function getSelectedTrack()

    return reaper.GetSelectedTrack(0, 0)

end

local function printTrackInfo(track)

    local _, name = reaper.GetTrackName(track)
    local index = math.floor(
        reaper.GetMediaTrackInfo_Value(track, "IP_TRACKNUMBER")
    )

    local sampleRate =
        reaper.GetSetProjectInfo(0, "PROJECT_SRATE", 0, false)

    if sampleRate == 0 then
        sampleRate = 48000
    end

    reaper.ShowConsoleMsg("Track\n")
    reaper.ShowConsoleMsg("------------------------------\n")
    reaper.ShowConsoleMsg("Name        : " .. name .. "\n")
    reaper.ShowConsoleMsg("Track Index : " .. index .. "\n")
    reaper.ShowConsoleMsg(
        string.format("Sample Rate : %.0f\n\n", sampleRate)
    )

end

--------------------------------------------------
-- Analyzer
--------------------------------------------------

local function findAnalyzer(track)

    return reaper.TrackFX_AddByName(
        track,
        ANALYZER_NAME,
        false,
        0
    )

end

local function insertAnalyzer(track)

    return reaper.TrackFX_AddByName(
        track,
        ANALYZER_NAME,
        false,
        -1
    )

end

local function ensureAnalyzer(track)

    local slot = findAnalyzer(track)

    if slot >= 0 then
        return slot, false
    end

    slot = insertAnalyzer(track)

    return slot, true

end

local function printAnalyzerStatus(slot, inserted)

    reaper.ShowConsoleMsg("Analyzer\n")
    reaper.ShowConsoleMsg("------------------------------\n")

    if inserted then
        reaper.ShowConsoleMsg("Status      : Inserted\n")
    else
        reaper.ShowConsoleMsg("Status      : Already present\n")
    end

    reaper.ShowConsoleMsg("FX Slot     : " .. slot .. "\n")

end

--------------------------------------------------
-- Main
--------------------------------------------------

local function main()

    printHeader()

    --------------------------------------------------
    -- Selected Track
    --------------------------------------------------

    local track = getSelectedTrack()

    if not track then
        reaper.ShowConsoleMsg("No track selected.\n")
        return
    end

    printTrackInfo(track)

    --------------------------------------------------
    -- Analyzer
    --------------------------------------------------

    local slot, inserted = ensureAnalyzer(track)

    printAnalyzerStatus(slot, inserted)

    --------------------------------------------------
    -- Read Analyzer Data
    --------------------------------------------------

    --------------------------------------------------
    -- Peak
    --------------------------------------------------

    reaper.gmem_attach("ACP_STUDIO")

    local peak = reaper.gmem_read(0)

    reaper.ShowConsoleMsg("\n")
    reaper.ShowConsoleMsg("Peak\n")
    reaper.ShowConsoleMsg("------------------------------\n")
    reaper.ShowConsoleMsg(string.format("Linear : %.6f\n", peak))
end

main()