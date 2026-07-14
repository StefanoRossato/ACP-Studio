local RuntimeMonitor = {}
RuntimeMonitor.__index = RuntimeMonitor

--------------------------------------------------------------------------------
-- Constructor
--------------------------------------------------------------------------------

function RuntimeMonitor.New()

    local self = setmetatable({}, RuntimeMonitor)

    -- Initialization ----------------------------------------------------------

    return self

end

--------------------------------------------------------------------------------
-- Public Methods
--------------------------------------------------------------------------------

function RuntimeMonitor:Initialize()

    -- Implementation ----------------------------------------------------------

end

function RuntimeMonitor:Display(snapshot)

    if snapshot == nil then
        return
    end

    for key, value in pairs(snapshot) do
        reaper.ShowConsoleMsg(
            string.format("%-24s : %s\n", key, tostring(value))
        )
    end

end

--------------------------------------------------------------------------------
-- Private Methods
--------------------------------------------------------------------------------

function RuntimeMonitor:PrivateMethod()

    -- Implementation ----------------------------------------------------------

end

--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return RuntimeMonitor