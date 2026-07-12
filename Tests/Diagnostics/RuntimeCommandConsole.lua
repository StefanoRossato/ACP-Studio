reaper.gmem_attach("ACP_STUDIO")

reaper.gmem_write(0, 2)

reaper.ShowMessageBox(
    "COMMAND = START sent.",
    "ACP Studio",
    0
)