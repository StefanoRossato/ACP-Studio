reaper.gmem_attach("ACP_STUDIO")

reaper.gmem_write(0, 2)

local command = reaper.gmem_read(0)

reaper.ShowConsoleMsg(
    string.format("COMMAND = %.0f\n", command)
)