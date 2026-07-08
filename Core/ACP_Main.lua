--------------------------------------------------
-- ACP Studio v0.1
-- Baseline 0.1.6
-- ACP_Main.lua
--------------------------------------------------

--------------------------------------------------
-- Constants
--------------------------------------------------

local VERSION = "0.1.0"
local ANALYZER_NAME = "JS:ACP Studio/ACP_Analyzer"

--------------------------------------------------
-- GMEM Layout
--------------------------------------------------

local GMEM_PEAK_LINEAR = 0
local GMEM_RMS_AVERAGE = 1
local GMEM_RMS_MAXIMUM = 2

local GMEM_COMMAND = 100

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
        reaper.GetMediaTrackInfo_Value(
            track,
            "IP_TRACKNUMBER"
        )
    )

    local sampleRate =
        reaper.GetSetProjectInfo(
            0,
            "PROJECT_SRATE",
            0,
            false
        )

    if sampleRate == 0 then
        sampleRate = 48000
    end

    reaper.ShowConsoleMsg("Track\n")
    reaper.ShowConsoleMsg("------------------------------\n")
    reaper.ShowConsoleMsg("Name        : " .. name .. "\n")
    reaper.ShowConsoleMsg("Track Index : " .. index .. "\n")
    reaper.ShowConsoleMsg(
        string.format(
            "Sample Rate : %.0f\n\n",
            sampleRate
        )
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

    reaper.ShowConsoleMsg(
        "FX Slot     : " .. slot .. "\n"
    )

end

--------------------------------------------------
-- Session
--------------------------------------------------

local function readAnalyzer()

    reaper.gmem_attach("ACP_STUDIO")

    return {

        peakLinear =
            reaper.gmem_read(GMEM_PEAK_LINEAR),

        rmsAverage =
            reaper.gmem_read(GMEM_RMS_AVERAGE),

        rmsMaximum =
            reaper.gmem_read(GMEM_RMS_MAXIMUM)

    }

end

--------------------------------------------------
-- Report
--------------------------------------------------

local function printReport(data)

    reaper.ShowConsoleMsg("\n")

    reaper.ShowConsoleMsg("Peak\n")
    reaper.ShowConsoleMsg("------------------------------\n")

    reaper.ShowConsoleMsg(
        string.format(
            "Linear : %.6f\n",
            data.peakLinear
        )
    )

end

--------------------------------------------------
-- Main
--------------------------------------------------

local function main()

    printHeader()

    local track = getSelectedTrack()

    if not track then

        reaper.ShowConsoleMsg(
            "No track selected.\n"
        )

        return

    end

    printTrackInfo(track)

    local slot, inserted =
        ensureAnalyzer(track)

    printAnalyzerStatus(
        slot,
        inserted
    )

    local analyzer =
        readAnalyzer()

    printReport(analyzer)

end

main()