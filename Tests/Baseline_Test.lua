--=====================================================================
-- ACP Studio
-- Baseline Runtime Test
--
-- Verifies:
--   - Shared Memory attachment
--   - Runtime state
--   - Heartbeat
--   - Sample counter
--=====================================================================

local REG_COMMAND        = 0
local REG_STATE          = 1
local REG_HEARTBEAT      = 2
local REG_SAMPLE_COUNTER = 3

local STATE_IDLE         = 0
local STATE_RUNNING      = 1

reaper.ShowConsoleMsg("=================================\n")
reaper.ShowConsoleMsg("Baseline Runtime Test\n")
reaper.ShowConsoleMsg("=================================\n\n")

reaper.gmem_attach("ACP_STUDIO")

local state1      = reaper.gmem_read(REG_STATE)
local heartbeat1  = reaper.gmem_read(REG_HEARTBEAT)
local samples1    = reaper.gmem_read(REG_SAMPLE_COUNTER)

reaper.ShowConsoleMsg(string.format("State      : %.0f\n", state1))
reaper.ShowConsoleMsg(string.format("Heartbeat  : %.0f\n", heartbeat1))
reaper.ShowConsoleMsg(string.format("Samples    : %.0f\n\n", samples1))

reaper.defer(function()

    local state2      = reaper.gmem_read(REG_STATE)
    local heartbeat2  = reaper.gmem_read(REG_HEARTBEAT)
    local samples2    = reaper.gmem_read(REG_SAMPLE_COUNTER)

    reaper.ShowConsoleMsg("Second Read\n")
    reaper.ShowConsoleMsg("-----------------------------\n")

    reaper.ShowConsoleMsg(string.format("State      : %.0f\n", state2))
    reaper.ShowConsoleMsg(string.format("Heartbeat  : %.0f\n", heartbeat2))
    reaper.ShowConsoleMsg(string.format("Samples    : %.0f\n\n", samples2))

    local pass = true

    if state2 ~= STATE_RUNNING then
        pass = false
        reaper.ShowConsoleMsg("FAIL - Runtime not running\n")
    end

    if heartbeat2 <= heartbeat1 then
        pass = false
        reaper.ShowConsoleMsg("FAIL - Heartbeat not increasing\n")
    end

    if samples2 <= samples1 then
        pass = false
        reaper.ShowConsoleMsg("FAIL - Sample counter not increasing\n")
    end

    if pass then
        reaper.ShowConsoleMsg("PASS\n")
    end

end)