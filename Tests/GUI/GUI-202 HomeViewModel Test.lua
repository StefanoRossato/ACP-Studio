--------------------------------------------------------------------------------
-- ACP Studio
--
-- Test         : GUI-202 HomeViewModel Test
-- File         : Tests/Application/GUI-202 HomeViewModel Test.lua
--
-- Purpose
-- -------
-- Certifies the HomeViewModel application component.
--
-- Certification
-- -------------
-- GUI-202 : Home View Model Foundation
--------------------------------------------------------------------------------


local function LoadBootstrap()

    local path =
        debug.getinfo(1, "S").source:match("@?(.*)")


    path =
        path:gsub("[/\\][^/\\]+$", "")


    while path ~= "" do

        local candidate =
            path .. "/Bootstrap.lua"


        local file =
            io.open(candidate, "r")


        if file then

            file:close()

            return dofile(candidate), 
                path:gsub("/Tests$", "")

        end


        path =
            path:gsub("[/\\][^/\\]+$", "")

    end


    error("Bootstrap.lua not found")

end


local Bootstrap, Root =
    LoadBootstrap()


assert(
    Bootstrap.Initialize(Root)
)


reaper.ClearConsole()


reaper.ShowConsoleMsg(
"========================================\n"
)

reaper.ShowConsoleMsg(
"HomeViewModel Test\n"
)

reaper.ShowConsoleMsg(
"GUI-202\n"
)

reaper.ShowConsoleMsg(
"========================================\n\n"
)


local HomeViewModel =
    require(
        "Core.Application.Views.Home.HomeViewModel"
    )


if HomeViewModel then

    reaper.ShowConsoleMsg(
        "PASS - Module loaded\n"
    )

end


local Model =
    HomeViewModel.Create()


if Model then

    reaper.ShowConsoleMsg(
        "PASS - Model created\n"
    )

end


assert(Model.Runtime)

reaper.ShowConsoleMsg(
"PASS - Runtime data available\n"
)


assert(Model.Project)

reaper.ShowConsoleMsg(
"PASS - Project data available\n"
)


assert(Model.Analysis)

reaper.ShowConsoleMsg(
"PASS - Analysis data available\n"
)


reaper.ShowConsoleMsg(
"\nPASS - HomeViewModel contract certified\n"
)


reaper.ShowConsoleMsg(
"\n========================================\n"
)

reaper.ShowConsoleMsg(
"GUI-202 PASSED\n"
)

reaper.ShowConsoleMsg(
"========================================\n"
)