------------------------------------------------------------------------------
-- ACP Studio
-- GUI-103
-- Toolbar Actions Test
------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Dependencies
--------------------------------------------------------------------------------

local GuiTestSkeleton =
    require("Tests.GUI.Framework.GuiTestSkeleton")

--------------------------------------------------------------------------------
-- Execute
--------------------------------------------------------------------------------

GuiTestSkeleton.Run({

    Id =
        "GUI-103",

    Name =
        "Toolbar Actions Test",

    ModuleName =
        "Core.GUI.Toolbar.Actions",

    ModuleDisplayName =
        "Toolbar Actions",

    OpenMessage =
        "Running Toolbar Actions tests...",

    CloseMessage =
        "Toolbar Actions tests completed.",

    OnCompleted = function(Test)

        ------------------------------------------------------------------------
        -- Dependencies
        ------------------------------------------------------------------------

        local Actions =
            require("Core.GUI.Toolbar.Actions")

        ------------------------------------------------------------------------
        -- Initialize
        ------------------------------------------------------------------------

        Actions.Initialize()

        assert(

            Actions.Get() ==
                Actions.Type.None,

            "Initialize failed."

        )

        Test.Pass("Actions initialized")

        ------------------------------------------------------------------------
        -- Set / Get
        ------------------------------------------------------------------------

        Actions.Set(
            Actions.Type.PrepareTrack)

        assert(

            Actions.Get() ==
                Actions.Type.PrepareTrack,

            "Set/Get failed."

        )

        Test.Pass("Action stored")

        ------------------------------------------------------------------------
        -- Clear
        ------------------------------------------------------------------------

        Actions.Clear()

        assert(

            Actions.Get() ==
                Actions.Type.None,

            "Clear failed."

        )

        Test.Pass("Action cleared")

        ------------------------------------------------------------------------
        -- Shutdown
        ------------------------------------------------------------------------

        Actions.Shutdown()

        assert(

            Actions.Get() ==
                Actions.Type.None,

            "Shutdown failed."

        )

        Test.Pass("Actions shutdown")

    end

})