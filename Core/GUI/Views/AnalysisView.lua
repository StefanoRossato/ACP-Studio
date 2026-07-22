--------------------------------------------------------------------------------
-- ACP Studio
--
-- Module        : AnalysisView
-- Layer         : GUI
-- Purpose       : Defines the analysis application view.
-- Specification : GUI-212
--------------------------------------------------------------------------------

local BaseView =
    require("Core.GUI.BaseView")

local ViewId =
    require("Core.Application.Navigation.ViewId")

local AnalysisHeader =
    require("Core.Application.Views.Analysis.Components.AnalysisHeader")

local TrackSelectionPanel =
    require("Core.Application.Views.Analysis.Components.TrackSelectionPanel")

local AnalysisStatusPanel =
    require("Core.Application.Views.Analysis.Components.AnalysisStatusPanel")

local MeasurementPanel =
    require("Core.Application.Views.Analysis.Components.MeasurementPanel")

local ActionBar =
    require("Core.Application.Views.Analysis.Components.ActionBar")

local AnalysisPresentationModel =
    require("Core.Application.Views.Analysis.AnalysisPresentationModel")    

local AnalysisView = {}

--------------------------------------------------------------------------------
-- Constructor
--------------------------------------------------------------------------------

function AnalysisView.New()

    local View =
        BaseView.New(
            ViewId.Analysis,
            "Analysis"
        )

    View.Model =
        AnalysisPresentationModel.New()
    
    setmetatable(
        View,
        {
            __index = AnalysisView
        }
    )

    return View

end

--------------------------------------------------------------------------------
-- Lifecycle
--------------------------------------------------------------------------------

function AnalysisView:OnEnter()

end

--------------------------------------------------------------------------------

function AnalysisView:OnExit()

end

--------------------------------------------------------------------------------
-- Rendering
--------------------------------------------------------------------------------

function AnalysisHeader.Render(context,model)

    AnalysisHeader.Render(context,self.Model)

    TrackSelectionPanel.Render(context,self.Model)

    AnalysisStatusPanel.Render(context,self.Model)

    MeasurementPanel.Render(context,self.Model)

    ActionBar.Render(context,self.Model)

end

--------------------------------------------------------------------------------
-- End of Module
--------------------------------------------------------------------------------

return AnalysisView