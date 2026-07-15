--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module      : RuntimeMonitor
-- Description : Displays runtime observation snapshots.
--------------------------------------------------------------------------------

local RuntimeMonitor = {}
RuntimeMonitor.__index = RuntimeMonitor

--------------------------------------------------------------------------------
-- Dependencies
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Constants
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Construction
--------------------------------------------------------------------------------

function RuntimeMonitor.New()

    local self = setmetatable({}, RuntimeMonitor)

    -- Initialization ----------------------------------------------------------

    return self

end

--------------------------------------------------------------------------------
-- Public Methods
--------------------------------------------------------------------------------

function RuntimeMonitor:Display(snapshot)

    -- Implementation ----------------------------------------------------------

    if snapshot == nil then
        return
    end

    local model = snapshot:GetModel()

    if model == nil then
        return
    end

    reaper.ClearConsole()

    reaper.ShowConsoleMsg("========================================\n")
    reaper.ShowConsoleMsg("Runtime Monitor\n")
    reaper.ShowConsoleMsg("========================================\n")

    --------------------------------------------------------------------------
    -- Runtime State
    --------------------------------------------------------------------------

    reaper.ShowConsoleMsg(
        string.format("%-24s : %s\n", "State", tostring(model.State))
    )

    --------------------------------------------------------------------------
    -- Analysis
    --------------------------------------------------------------------------

    reaper.ShowConsoleMsg(
        string.format("%-24s : %s\n", "RMS", tostring(model.RMS))
    )

    reaper.ShowConsoleMsg(
        string.format("%-24s : %s\n", "Peak", tostring(model.Peak))
    )

    reaper.ShowConsoleMsg(
        string.format("%-24s : %s\n", "Crest Factor", tostring(model.CrestFactor))
    )

    --------------------------------------------------------------------------
    -- Runtime Information
    --------------------------------------------------------------------------

    reaper.ShowConsoleMsg(
        string.format("%-24s : %s\n", "Sample Count", tostring(model.SampleCount))
    )

    reaper.ShowConsoleMsg(
        string.format("%-24s : %s\n", "Timestamp", tostring(model.Timestamp))
    )

    --------------------------------------------------------------------------
    -- Metrics
    --------------------------------------------------------------------------

    reaper.ShowConsoleMsg(
        string.format("%-24s : %s\n", "Heartbeat",
            tostring(model.Metrics.Heartbeat))
    )

    reaper.ShowConsoleMsg(
        string.format("%-24s : %s\n", "Sample Counter",
            tostring(model.Metrics.SampleCounter))
    )

    reaper.ShowConsoleMsg(
        string.format("%-24s : %s\n", "Frames Processed",
            tostring(model.Metrics.FramesProcessed))
    )

    reaper.ShowConsoleMsg(
        string.format("%-24s : %s\n", "Update Timestamp",
            tostring(model.Metrics.UpdateTimestamp))
    )

end

--------------------------------------------------------------------------------
-- Private Methods
--------------------------------------------------------------------------------



--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return RuntimeMonitor