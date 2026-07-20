--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : GuiTestSkeleton
-- Layer         : Engineering
-- Category      : Templates
--
-- Purpose       : Provides the reusable foundation for GUI test modules.
--
-- Standard      : TPL-004
--
-- Dependencies  : TestSkeleton
--
--------------------------------------------------------------------------------

local TestSkeleton =
    require("Documentation.Engineering.Templates.TestSkeleton")

local GuiTestSkeleton = {}

--------------------------------------------------------------------------------
-- Constants
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Private State
--------------------------------------------------------------------------------

local State = {}

--------------------------------------------------------------------------------
-- Private Functions
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Constructor
--------------------------------------------------------------------------------

function GuiTestSkeleton.New(configuration)

    local self =
        TestSkeleton.New(configuration)

    --------------------------------------------------------------------------------
    -- GUI State
    --------------------------------------------------------------------------------

    local GuiState =
    {
        Context = nil,
        Frame = 0,
        Initialized = false
    }

    --------------------------------------------------------------------------------
    -- Protected Access
    --------------------------------------------------------------------------------

    function self.GetGuiState()

        return GuiState

    end

    return self

end

--------------------------------------------------------------------------------
-- GUI Lifecycle
--------------------------------------------------------------------------------

function self.InitializeGUI(context)

    local guiState =
        self.GetGuiState()

    guiState.Context =
        context

    guiState.Frame =
        0

    guiState.Initialized =
        true

end

--------------------------------------------------------------------------------

function self.BeginFrame()

    local guiState =
        self.GetGuiState()

    if not guiState.Initialized then
        return false
    end

    guiState.Frame =
        guiState.Frame + 1

    return true

end

--------------------------------------------------------------------------------

function self.EndFrame()

    local guiState =
        self.GetGuiState()

    if not guiState.Initialized then
        return
    end

end

--------------------------------------------------------------------------------

function self.ShutdownGUI()

    local guiState =
        self.GetGuiState()

    guiState.Context =
        nil

    guiState.Frame =
        0

    guiState.Initialized =
        false

end

--------------------------------------------------------------------------------
-- GUI Services
--------------------------------------------------------------------------------

function self.GetGuiContext()

    return self.GetGuiState().Context

end

--------------------------------------------------------------------------------

function self.GetFrameCount()

    return self.GetGuiState().Frame

end

--------------------------------------------------------------------------------

function self.IsGuiInitialized()

    return self.GetGuiState().Initialized

end

--------------------------------------------------------------------------------

function self.ResetFrameCounter()

    self.GetGuiState().Frame =
        0

end

--------------------------------------------------------------------------------
-- Extension Hooks
--------------------------------------------------------------------------------

function self.OnInitializeGUI()

    -- Default implementation.
    -- Intended to be overridden by derived GUI test skeletons.

end

--------------------------------------------------------------------------------

function self.OnBeginFrame()

    -- Default implementation.
    -- Intended to be overridden by derived GUI test skeletons.

end

--------------------------------------------------------------------------------

function self.OnEndFrame()

    -- Default implementation.
    -- Intended to be overridden by derived GUI test skeletons.

end

--------------------------------------------------------------------------------

function self.OnShutdownGUI()

    -- Default implementation.
    -- Intended to be overridden by derived GUI test skeletons.

end

--------------------------------------------------------------------------------
-- Public API
--------------------------------------------------------------------------------

GuiTestSkeleton.New =
    GuiTestSkeleton.New

--------------------------------------------------------------------------------

return GuiTestSkeleton