# ACP Studio v0.1

## 0.1.1
- Bootstrap

## 0.1.2
- Track detection

## 0.1.3
- JSFX integration

## 0.1.4
- Lua ↔ JSFX communication

## 0.1.5
- Peak analyzer (work in progress)

## Baseline 0.1.6
- Refactored ACP_Main.lua
- Refactored ACP_Analyzer.jsfx
- Defined GMEM layout
- Stabilized project foundation

## baseline-0.1.7 - BT-001 Baseline DSP

### Added

* Implemented `ACP_Baseline.jsfx`.
* Implemented the Baseline DSP Runtime architecture.
* Added deterministic runtime execution pipeline.
* Added runtime state machine.
* Added Shared Memory communication.
* Added heartbeat counter.
* Added sample counter.
* Added transparent audio pass-through.
* Implemented `RuntimeMonitor.lua`.
* Added `DIAG-001 Runtime Monitor` engineering specification.

### Validation

* Validated Shared Memory communication between JSFX and Lua.
* Validated runtime state publication.
* Validated heartbeat and sample counter operation.
* Validated transparent audio pass-through.
* BT-001 certification completed.

### Documentation

* Approved `ENG-OPEN Engineering Open Issues`.
* Defined the Engineering Open Issue data model.
* Defined the Engineering Issue Management process.
* Established the Engineering Data Model Review process.

### Documentation

* Approved `DEV-002 Engineering Recovery`.
* Defined the Engineering Recovery process.
* Established the Engineering Recovery Process Model.
* Defined the Project Recovery workflow.

### Changed

- BT-002 Bootstrap infrastructure completed.

## [Unreleased]

### Added

- BT-002 Runtime Command Interface.
- Runtime commands: RESET, START and STOP.
- Command-driven runtime state machine.
- Runtime command decoder.
- Experimental Validation workflow added to DEV-001 Development Workflow.

### Changed

- Runtime execution changed from automatic startup to explicit command control.
- JSFX development workflow now requires isolated experimental validation before production integration.

### Engineering

- ENG-001 Documentation Standard completely redesigned.
- Introduced the official ACP Studio documentation standard.
- Standardized the official engineering document header.
- Introduced the documentation workflow and lifecycle.
- Formalized documentation review and certification rules.

- DEV-001 Engineering Workflow completely redesigned.
- Introduced the official ACP Studio engineering workflow.
- Introduced Architecture Review.
- Introduced Repository Cleanup.
- Standardized the engineering lifecycle.

### Documentation

- README completely redesigned.
- Introduced a project overview for new contributors.
- Added technology stack information.
- Documented the certified project foundation.
- Added the official engineering workflow overview.
- Updated the project mission and current development status.

### Changed

- Standardized engineering document headers across the repository.
- Approved ENG-001 Documentation Standard v4.0.
- Updated DEV-001, BT-003, CMP-001, and TST-001 to the new documentation standard.
- Formalized document identification and versioning rules.

### Added

- Implemented Test Monitor runtime observation infrastructure.
- Added Runtime attachment API.
- Added Runtime state snapshot rendering.
- Added experimental validation for Runtime observation.

### Engineering
- ENG-001: Introduced the certified ACP Studio Module Skeleton standard, defining the mandatory structure for all Lua modules.

### Engineering

- DEV-001: Updated the Implementation phase to require the certified ACP Studio Module Skeleton before development begins.

### Engineering

- ENG-OPEN: Introduced the Engineering Open Issues Register.
- ENG-OPEN: Added EOI-001 (Unified Test Logging Infrastructure).

### Engineering

- BT-003: Added the RuntimeObserver component and certified the initial RuntimeObserver integration interface.

### Engineering

- BT-003: RuntimeObserver now synchronizes the Runtime State from Shared Memory into the RuntimeModel.

### Engineering

- BT-003: Completed RuntimeObserver synchronization between Shared Memory and RuntimeModel.

### Engineering

- BT-003: Completed RuntimeObserver synchronization for all Runtime registers and finalized the Runtime Analysis pipeline.

### Documentation

- Added TST-001 Test Template Standard.
- Introduced Certified Templates engineering process.
- Added TestSkeleton.lua as the first certified ACP Studio template.
- Validated the Certified Template workflow through RuntimeController_Test.lua generation.

### Added

- Implemented RuntimeSession.
- Added RuntimeSession lifecycle interface.
- Added RuntimeSession_Test.
- Certified BT-003 WP-8 Runtime Session.

## [Unreleased]

### Documentation

- Approved ANL-001 Analysis Engine Architecture.
- Defined the architectural foundation of the Analysis Engine.
- Formalized the component architecture, lifecycle, data flow,
  design rules and architectural compliance requirements.
- Established ANL-001 as the normative architectural reference for
  all Analysis Engine implementations.

  ### Documentation

- Added `ArchitectureSkeleton.md` certified architecture document template.
- Added `ARC-001 Architecture Skeleton Standard`.
- Certified the Architecture Skeleton documentation standard (v1.0.0).
- Started `DSH-001 Developer Environment Architecture`.
- Defined the Developer Environment as a dedicated engineering subsystem.
- Introduced Engineering Observability as a fundamental architectural principle.
- Suspended `BT-004 Analysis Engine Foundation` pending completion of the Developer Environment architecture.

### Added

- Certified MOD-001 Module Template Standard.
- Added certified ModuleSkeleton.lua.
- Certified TST-002 Test Template Standard.
- Updated and certified TestSkeleton.lua.

### OBS-001 - Runtime Observability

Added
- OBS-001 Observability Infrastructure Architecture.
- ObservationProvider component.
- ObservationSnapshot component.
- ObservationProvider unit test.
- ObservationSnapshot unit test.

Changed
- ObservationProvider aligned with RuntimeModel public interface.
- ObservationSnapshot aligned with RuntimeModel public interface.
- Observability modules moved to Core/Observability.
- Observability tests organized under Tests/Observability.

Architecture
- Introduced the Observability Infrastructure architecture.
- Established RuntimeModel as the authoritative source of
  observable runtime information.
- Defined the Runtime/Observability subsystem boundary.
- Established read-only observability architecture.
- Defined observation pipeline:
  RuntimeObserver → RuntimeModel →
  ObservationProvider → ObservationSnapshot →
  Engineering Tools.

Engineering
- OBS-001 Architecture approved (v1.0.0).

### OBS-001 - Runtime Observability

Added
- ObservationCollector component.
- ObservationCollector unit test.

Architecture
- Completed the observation pipeline.
- Introduced ObservationCollector as the component responsible
  for creating immutable ObservationSnapshot instances from the
  current RuntimeModel state exposed by ObservationProvider.

  ### Added

#### RuntimeMonitor Foundation

- Added RuntimeMonitor module.
- Implemented certified module skeleton.
- Added Initialize() public method.
- Added RuntimeMonitor unit test.
- Verified module construction and initialization.

### Added

#### RuntimeMonitor

- Added Display() public method.
- Added snapshot visualization support.
- Implemented console rendering of ObservationSnapshot data.
- Verified RuntimeMonitor display functionality.

### Added

#### Observability Integration

- Added ObservabilityPipeline integration test.
- Verified RuntimeModel, ObservationProvider, ObservationCollector and RuntimeMonitor integration.
- Verified ObservationSnapshot collection through the complete observation pipeline.
- Verified end-to-end snapshot visualization using RuntimeMonitor.

### Certified

#### OBS-001 Runtime Observability

The Runtime Observability infrastructure has been completed and certified.

Implemented components:

- RuntimeObserver
- RuntimeModel
- ObservationProvider
- ObservationCollector
- ObservationSnapshot
- RuntimeMonitor

Completed verification:

- Unit tests
- Integration pipeline test
- End-to-end observation flow validation

## [OBS-002] - Runtime Metrics - Certified

### Added

* Added `RuntimeMetrics` model.
* Added runtime metrics support to the observability pipeline.
* Added deep-clone support for runtime metrics.
* Added immutable runtime metrics snapshots.
* Added runtime metrics visualization in `RuntimeMonitor`.

### Changed

* Refactored `RuntimeModel` into a pure data model.
* Removed getter/setter API from `RuntimeModel`.
* Added `RuntimeMetrics` integration to `RuntimeModel`.
* Refactored `ObservationProvider` to expose the complete runtime model.
* Refactored `ObservationCollector` to collect complete runtime models.
* Refactored `ObservationSnapshot` to clone the runtime model.
* Refactored `RuntimeMonitor` to display the new runtime model structure.
* Simplified the complete observability pipeline architecture.

### Tests

* Added `RuntimeMetrics_Test`.
* Updated `RuntimeModel_Test`.
* Updated `ObservationProvider_Test`.
* Updated `ObservationCollector_Test`.
* Updated `ObservationSnapshot_Test`.
* Updated `RuntimeMonitor_Test`.
* Updated `ObservabilityPipeline_Test`.

### Certification

OBS-002 Runtime Metrics completed and certified.

The Runtime Observability infrastructure now supports immutable runtime models, runtime metrics, deep-copy snapshots and an end-to-end validated observability pipeline.

## [OBS-003] - Observation Recorder

### Added

* Implemented `ObservationRecorder`.
* Added support for recording `ObservationSnapshot` instances.
* Introduced history management through `Record()`, `Get()`, `GetAll()`, `GetCount()`, and `Clear()`.
* Added and certified `ObservationRecorder_Test`.

### Improved

* Updated `TestSkeleton.lua` to reflect the official ACP Studio module loading convention.
* Consolidated the Test Template Standard into `TST-001`.
* Removed the obsolete `TST-002` standard to eliminate duplicated documentation.

### Certified

* ObservationRecorder
* ObservationRecorder_Test
* TestSkeleton.lua (updated)
* TST-001 Test Template Standard (revised)

## [Unreleased]

### Added

#### DOM-001 — Domain Model Architecture

Introduced the Domain Model architectural foundation.

Established the Domain layer as the technology-independent representation of ACP Studio business entities.

Defined:

- Domain layer responsibilities;
- Domain Entity architectural principles;
- relationship between Domain and Infrastructure;
- Domain Entity lifecycle;
- Domain design rules;
- certification requirements for future Domain Entities.

This architecture establishes the foundation for all future Domain Entities and formalizes the separation between business concepts and external technologies.

## Added

### ADS-004 — Analysis State

Implemented the first Domain capability for the Analysis model.

Added:

- AnalysisState domain module
- Analysis state validation
- State transition validation
- ADS-004 certification test

Certification:

- ADS-004 capability certified

## [Unreleased]

### Added

#### Domain Architecture

- Reworked **DOM-001 Domain Model Architecture** to version 2.1.0.
- Introduced the Domain Component model:
  - Aggregate Root
  - Entity
  - Value Object
  - Domain Service
- Documented the complete Analysis Domain architecture.
- Formalized the Domain Capability lifecycle.
- Standardized the relationship between Domain and Infrastructure.

#### Analysis Domain Specifications

- Added **ADS-001 – Analysis Session Aggregate**.
- Added **ADS-002 – Measurement**.
- Added **ADS-003 – Measurement Result**.
- Added **ADS-004 – Analysis State**.
- Added **ADS-005 – Analysis Service**.

### Changed

- Standardized all Domain Capability specifications using the common capability template.
- Completed the architectural design of **WP-DOM-001**.

## Added

### Domain Layer

* Implemented **ADS-003 — MeasurementResult** domain capability.
* Added immutable aggregation of analysis measurements.
* Added value-based equality comparison for `MeasurementResult`.
* Added validation of aggregated `Measurement` instances.
* Added timestamp validation according to the domain specification.

### Tests

* Added **MeasurementResult Capability Test**.
* Verified valid construction.
* Verified invalid construction rejection.
* Verified getters.
* Verified value-based equality.
* Verified timestamp validation.
* Certified **ADS-003 — MeasurementResult**.

## [Unreleased]

### Added

#### ADS-005 — Analysis Service
- Implemented immutable AnalysisService domain capability.
- Added lifecycle coordination for Analysis Sessions.
- Implemented CreateSession().
- Implemented Start().
- Implemented Complete().
- Implemented Fail().
- Implemented Cancel().
- Added AnalysisService capability test.
- Certified ADS-005.

### Changed

#### ADS-003 — Measurement Result
- Added MeasurementResult.Empty() factory method.
- Introduced immutable empty Measurement Result.
- Eliminated null MeasurementResult from the Domain Model.
- Updated specification and capability tests.

#### ADS-004 — Analysis State
- Refactored AnalysisState as immutable Value Object.
- Added GetValue().
- Added Equals().
- Updated capability specification.
- Re-certified ADS-004.

### Certified

Completed WP-DOM-001 — Analysis Domain Model.

Certified capabilities:

- ADS-001 — Analysis Session
- ADS-002 — Measurement
- ADS-003 — Measurement Result
- ADS-004 — Analysis State
- ADS-005 — Analysis Service

The Analysis Domain Layer is now fully implemented, immutable,
stateless where appropriate, and completely independent from
Runtime, Infrastructure and REAPER.

## [Unreleased]

### Added

#### Application Architecture

- Added APP-001 — Analysis Application Layer specification.
- Defined the responsibilities and architectural boundaries of the Application Layer.
- Specified the interaction model between the Application Layer and the Domain Layer.
- Defined the interaction model between the Application Layer and the Infrastructure Layer.
- Documented application workflows and application service responsibilities.
- Established public interface guidelines and design constraints.
- Defined certification criteria for the Application Layer.
- Documented future evolution guidelines for application services.

### Architecture

- Application Layer architecture is now formally specified and approved.
- Domain and Application architectural boundaries are fully documented.

## [Unreleased]

### Added

#### Application Layer

- Added APS-001 — Analysis Application Service capability specification.
- Defined the responsibilities of the Analysis Application Service.
- Specified the application service execution model.
- Defined the public API for application workflow execution.
- Established application workflow rules.
- Documented design principles for application services.
- Defined certification criteria for the Analysis Application Service.

### Architecture

- Application Layer capability model is now formally specified.
- Application service responsibilities are clearly separated from Domain services.
- Application workflow orchestration is fully documented.

## [Unreleased]

### Added

#### Application Layer

- Implemented AnalysisApplicationService (APS-001).
- Added the initial application workflow orchestration.
- Introduced the AnalysisApplicationService public API.
- Implemented the Execute(request) application entry point.
- Integrated the Application Layer with the Analysis Domain Service.
- Added the AnalysisApplicationService capability test.
- Certified the initial Analysis Application Service implementation.

### Tests

- Added APS-001 Capability Test.
- Verified module loading.
- Verified public API availability.
- Verified application workflow execution.
- Verified AnalysisSession creation.

## [Unreleased]

### Added

#### Runtime Layer

- Added RTS-001 — Analysis Executor capability specification.
- Implemented AnalysisExecutor.
- Introduced the Runtime execution entry point.
- Implemented the Execute(session) public API.
- Integrated the Runtime Layer with the Analysis Domain model.
- Added the AnalysisExecutor capability test.
- Certified the initial Analysis Executor implementation.

### Tests

- Added RTS-001 Capability Test.
- Verified module loading.
- Verified public API availability.
- Verified analysis execution entry point.
- Verified MeasurementResult creation.

## [Unreleased]

### Added
- Implemented `SharedMemoryGateway.Attach()`.
- Implemented `SharedMemoryGateway.Read(register)`.
- Implemented `SharedMemoryGateway.Write(register, value)`.
- Implemented `SharedMemoryGateway.Reset()`.
- Completed RTG-002 capability implementation.
- Added complete RTG-002 Capability Test covering Attach, Write, Read and Reset.
- Approved RTG-002 — Shared Memory Gateway specification.
- Added incremental implementation section to RTG-002 specification.

### Changed
- Encapsulated all shared memory access inside `SharedMemoryGateway`.
- Runtime shared memory operations are now accessed through the gateway abstraction.

## [Unreleased]

### Added
- Implemented `SharedMemoryProtocol` Runtime component.
- Added semantic Runtime communication interface.
- Added Runtime Start command support.
- Added Runtime Reset command support.
- Added Runtime state read support.
- Added Runtime measurement read support.
- Added complete RTP-001 Capability Test.

### Changed
- Refactored `SharedMemoryProtocol` to use IPC protocol definitions.
- Removed duplicated protocol constants from Runtime layer.
- Integrated `Registers`, `RuntimeCommands` and `RuntimeStates` from the IPC layer.
- Updated RTP-001 specification to reflect the final Runtime architecture.
- Certified RTP-001 — Shared Memory Protocol capability.

### Verified
- SharedMemoryProtocol Capability Test PASSED.
- Start command verified.
- Reset command verified.
- Runtime state read verified.
- Runtime measurement read verified.
- RTP-001 certification completed.

## [Unreleased]

### Added

- Added Observation Layer foundation.
- Added `Core/Observation/Monitor/ACP_Monitor.lua`.
- Added `Tests/Observation/Monitor/ACP_Monitor_Test.lua`.
- Implemented the `ACP_Monitor` lifecycle (`Initialize`, `Render`, `Shutdown`).
- Added ImGui context initialization and shutdown.
- Introduced the initial Observation Monitor state management.
- Certified the first Observation Layer component (OBS-001).

### Added

Added GUI-001 — ReaImGui Platform
Introduced Platform Certification documentation category.
Defined ReaImGui certification process and Approved API model.

## [Unreleased]

### Added

#### GUI Foundation

- Added `GuiTestSkeleton.lua` as the certified graphical test framework.
- Implemented standardized GUI lifecycle:
  - Load
  - Initialize
  - Render Loop
  - Shutdown
- Added automatic ReaImGui context management.
- Added extensibility hooks:
  - `OnInitialize()`
  - `OnRender()`
  - `OnShutdown()`
- Added support for test identification through:
  - `TestName`
  - `TestId`
- Added automatic window lifecycle and cleanup.

#### GUI Testing

- Reimplemented `GUI-003 — Basic Widgets Test`.
- Integrated the new `GuiTestSkeleton` framework.
- Added Bootstrap loading and test environment initialization.
- Certified the following basic widgets:
  - Text
  - Button
  - Separator
  - SameLine
  - Dummy
- Verified complete GUI lifecycle:
  - Context creation
  - Rendering
  - Window close
  - Context destruction
- Certified end-to-end execution of the GUI testing framework.

### Certified

- GUI-003 — Basic Widgets
- GST-001 — GUI Test Template Standard
- GuiTestSkeleton v1

## [Unreleased]

### Added
- GUI-004 — ACP Monitor lifecycle completed.
- Added callback-based completion notification (`Run(onFinished)`).
- GUI test rewritten to validate component lifecycle without managing it.
- First certified GUI component based on autonomous lifecycle management.

### Changed
- Refactored `ACP_Monitor` lifecycle ownership.
- `RenderLoop()` now preserves the completion callback before shutdown.
- Simplified `GUI-004 ACP Monitor Test` by removing duplicated lifecycle management.
- GUI test now waits for user window closure before completing.

### Fixed
- Fixed callback lifecycle bug where `State.OnFinished` was cleared before invocation.
- Fixed premature test termination caused by external shutdown management.
- Corrected GUI component shutdown sequence.

## Added

### GUI-005 — Runtime Information Panel

Implemented the first Runtime Information Panel vertical slice.

Added:

- ObservationSnapshot foundation
- ObservationProvider foundation
- Runtime Information Panel layout
- GUI-005 Runtime Information Panel capability test

The ACP Monitor now provides the initial observation interface organized into the following sections:

- Runtime
- Observation
- Analysis
- Shared Memory

The graphical architecture is now prepared for incremental integration with the Observation pipeline.

## [GUI-006] - Certified GUI Test Skeleton

### Added
- Introduced `Tests/GUI/Framework/GuiTestSkeleton.lua` as the certified GUI test framework.
- Centralized the common GUI test lifecycle into a reusable framework.
- Added a shared Test API (`Log`, `Pass`) for GUI test callbacks.

### Changed
- Migrated `GUI-004 ACP Monitor Test` to the new `GuiTestSkeleton`.
- Migrated `GUI-005 Runtime Information Panel Test` to the new `GuiTestSkeleton`.
- Separated bootstrap responsibilities from the GUI framework.
- GUI test entry points are now responsible only for environment initialization and test configuration.
- `GuiTestSkeleton` is now a pure framework module with no bootstrap dependencies.

### Architecture
- Established the official GUI Test Framework architecture:
  - Entry Point → GUI Test
  - Framework → GuiTestSkeleton
  - Component Under Test → ACP Monitor
- Eliminated duplicated lifecycle code across certified GUI tests.
- Preserved identical runtime behavior and console output after migration.

## [Unreleased]

### Added

- GUI-100 Main Window Foundation certified.
- Implemented `Core.GUI.MainWindow`.
- Implemented `Core.GUI.WindowLayout`.
- Implemented `Core.GUI.WindowLifecycle`.
- Introduced the certified Main Window execution model.
- Standardized the `Run(onCompleted)` entry point for Main Window modules.
- Added `GST-002 — Main Window Template`.
- Certified the Main Window architectural template.
- Integrated Main Window with the certified `GuiTestSkeleton` framework.
- Added GUI-100 Main Window Foundation Test.

## [Unreleased]

### Added
- Introduced `Core/GUI/Toolbar.lua` as the first dedicated GUI component.
- Established the GUI component architecture based on single responsibility.
- Integrated `Toolbar` into `WindowLayout`.

### Changed
- Refactored `WindowLayout` into a layout orchestrator responsible only for coordinating GUI components.
- Simplified toolbar implementation to use only certified ReaImGui capabilities (`Text` and `Separator`).
- Preserved complete separation between window lifecycle, layout orchestration and component rendering.

### Certified
- GUI-100 — Main Window Foundation certified.
- Main window lifecycle verified.
- Layout orchestration verified.
- Toolbar component integration verified.

### Added
- GUI-101 — Toolbar Foundation.
- Introduced the certified Toolbar component lifecycle.
- Toolbar rendering consolidated into an independent GUI module.
- Added GUI-101 Toolbar Foundation Test.
- Certified Toolbar as an autonomous GUI component.

### Architecture
- Preserved MainWindow responsibilities.
- Preserved WindowLayout as the GUI orchestrator.
- Established Toolbar as the first reusable GUI component.

## [GUI-102] - Toolbar Controls

### Added
- Certified GUI capability GUI-102 — Toolbar Controls.
- Toolbar rendering lifecycle documentation.
- Certified Toolbar architectural responsibilities.
- Toolbar graphical control capability specification.
- Architectural constraints for future Toolbar evolution.
- Certified development rules for Toolbar implementations.

### Changed
- Toolbar architecture extended from structural foundation (GUI-101)
  to graphical control capability.
- Certified rendering lifecycle standardized as:
  Render() → Begin() → DrawControls() → End().

### Certified
- GUI-102 — Toolbar Controls.

### Changed
- Reorganized Toolbar module into its dedicated GUI subsystem.
- Updated module dependencies to reflect the new Toolbar directory structure.
- No functional changes.

## GUI-104 - Menu Bar Foundation

### Added
- Implemented MenuBar component.
- Added MenuBar lifecycle management.
- Added menu registration API.
- Added menu retrieval API.
- Added GUI-104 certification test.
- Certified Menu Bar Foundation milestone.

## GUI-105 — View Management Foundation

### Added

- Introduced View base class.
- Added HomeView implementation.
- Implemented ViewManager lifecycle management.
- Added active view management.
- Added GUI-105 certified test.
- Established View Management architecture for future application views.

GUI-106 — View Framework Foundation

Added

- Foundation Specification for the ACP Studio View Framework.
- View lifecycle architecture.
- View activation model.
- ViewManager responsibilities.
- Dependency model.
- Design constraints.
- Extension guidelines.
- Compliance requirements.

Result

The ACP Studio View Framework now has a complete architectural foundation
defining the contracts governing every View independently of the Window
Framework.

## [Unreleased]

### Added

#### GUI Foundation Completed

Completed and certified the ACP Studio GUI Foundation.

New certified milestones:

- GUI-108 — ViewManager Foundation
- GUI-109 — BaseView Foundation
- GUI-110 — HomeView Foundation
- GUI-111 — View Integration Foundation

Implemented the complete View Framework architecture:

- ViewManager lifecycle management
- BaseView abstraction
- HomeView reference implementation
- View registration
- View activation and deactivation
- Active View rendering
- Integration certification

The GUI architecture is now composed of:

MainWindow
├── WindowLifecycle
├── WindowLayout
├── Toolbar
├── Workspace
│   └── ViewManager
│       └── BaseView
│           └── HomeView
└── StatusBar

The GUI Foundation is now considered stable and certified.
Future GUI development will focus on application Views and features built on top of this framework.

## APS-001 — Analysis Application Service

Completed and certified.

Implemented:
- AnalysisApplicationService application coordinator
- Execute(request) public interface
- Application workflow foundation
- Domain Service coordination
- APS-001 certification test

## GUI-200 — Home Dashboard Foundation

### Added
- Introduced HomeView as the first Application View.
- Added Core/Application/Views/Home/HomeView.lua.
- HomeView now derives from GUI BaseView.
- Implemented standard View lifecycle:
  - New()
  - OnEnter()
  - OnExit()
  - Render()

### Added
- GUI-200 Home Dashboard Foundation certification test.
- Certified:
  - Module loading
  - Constructor
  - View identity
  - Lifecycle
  - Render contract

### Architecture
- Established separation between GUI Framework and Application Views.
- Rendering is delegated to the GUI Framework through a valid ImGui context.
- Foundation certification validates the View contract without requiring an active ImGui context.

Status:
GUI-200 Certified

## [Unreleased]

### Added

#### GUI Architecture
- Introduced View Package Architecture (GUI-110).
- Standardized Application View organization.
- Introduced View Components architecture.
- Introduced View Panels architecture.

#### Home Dashboard
- Added HomeView package.
- Added HomeHeader component.
- Added HomeWelcome component.
- Added HomeDashboard component.
- Added HomeWorkspace component.
- Added RuntimeStatusPanel placeholder.
- Added ProjectInformationPanel placeholder.
- Added AnalysisOverviewPanel placeholder.

### Certified

- GUI-200 — Home Dashboard Foundation

# Changelog

## [GUI-201] — Home Dashboard Layout
Status: Certified

### Added

- Completed Home Dashboard graphical architecture.
- Implemented HomeView composition structure.
- Added Home Components package:
  - HomeHeader
  - HomeWelcome
  - HomeDashboard
  - HomeWorkspace

- Added Home Panels package:
  - RuntimeStatusPanel
  - ProjectInformationPanel
  - AnalysisOverviewPanel


### GUI Testing

- Extended GUI Test Skeleton with interactive rendering support.
- Added asynchronous GUI certification workflow.
- Added real ImGui context based component tests.


### Certified Tests

- GUI-201 HomeHeader Component Test
- GUI-201 HomeWelcome Component Test
- GUI-201 HomeDashboard Component Test
- GUI-201 HomeWorkspace Component Test
- GUI-201 RuntimeStatusPanel Test
- GUI-201 ProjectInformationPanel Test
- GUI-201 AnalysisOverviewPanel Test
- GUI-201 HomeView Integration Test


### Architecture

Certified View Package Architecture:

Application View

    HomeView

        Components
            |
            +-- HomeHeader
            +-- HomeWelcome
            +-- HomeDashboard
            +-- HomeWorkspace

        Panels
            |
            +-- RuntimeStatusPanel
            +-- ProjectInformationPanel
            +-- AnalysisOverviewPanel


### Status

GUI-201 completed and frozen.

Next milestone:

GUI-202 — Home View Model Foundation

## GUI-202 — Home View Model Foundation

Status: Certified

### Added

- Introduced HomeViewModel application component.
- Added Home View data contract.
- Established separation between Application state and GUI rendering.


### Implementation

Added:

Core/Application/Views/Home/HomeViewModel.lua


The View Model provides:

- Runtime state placeholder.
- Project information placeholder.
- Analysis state placeholder.


### Testing

Added:

Tests/Application/GUI-202 HomeViewModel Test.lua


Certified:

- Module loading.
- Factory creation.
- Runtime contract.
- Project contract.
- Analysis contract.


### Status

GUI-202 Home View Model Foundation completed and frozen.

## GUI-203 — Home View Data Binding Foundation

### Added
- Introduced the Home View data binding architecture.
- Implemented `HomeViewModel.GetModel()` as the Presentation Model provider.
- Connected `HomeView` to `HomeViewModel`.
- Established the Presentation Model pipeline from the Application Layer to the GUI Layer.
- Updated Home components to accept the Presentation Model (`HomeHeader`, `HomeWelcome`, `HomeDashboard`, `HomeWorkspace`).
- Added the GUI-203 certification test.

### Changed
- Refactored `HomeView` to retrieve and distribute the Presentation Model.
- Updated component interfaces to support data binding.
- Promoted GUI-203 specification from **Approved** to **Certified**.

### Certified
- GUI-203 — Home View Data Binding Foundation.

## [Unreleased]

### Added

#### GUI-204 — Home View Refresh Foundation

Implemented the certified Home View refresh lifecycle.

##### Home View

- Added Presentation Model cache.
- Introduced `RefreshModel()` as the certified model acquisition mechanism.
- `OnEnter()` now initializes the Presentation Model.
- `Render()` now consumes only the cached Presentation Model.
- Separated Presentation Model acquisition from graphical rendering.

##### Testing

- Added **GUI-204 — Home View Refresh Foundation Test**.
- Certified Presentation Model cache initialization.
- Certified Home View refresh lifecycle.
- Certified rendering using the cached Presentation Model.

##### Architecture

- Established the first certified Home View refresh lifecycle.
- Introduced the architectural foundation for future refresh operations.
- Preserved one-way dependency between `HomeViewModel` and `HomeView`.

GUI-205 — Home Component Composition

Added

- Standardized Home component architecture
- Unified component rendering contract
- HomeView delegates rendering to Home components
- Presentation Model shared across all components

Testing

- GUI-205 Home Component Composition Test

Architecture

- Home View acts as a composition root
- Home components are stateless
- Rendering responsibilities delegated to dedicated components

## [Unreleased]

### Added

- GUI-206 — Dashboard Panel Composition.
- Introduced modular dashboard composition architecture.
- Added AnalysisOverviewPanel component.
- Added RuntimeStatusPanel component.
- Added ProjectInformationPanel component.
- Refactored HomeDashboard into a composition component.
- Added certified GUI-206 Dashboard Panel Composition test.
- Added GUI-206 foundation specification.

## [Unreleased]

### Added

#### Engineering Standards
- Certified ENG-001 — Engineering Documentation Standard.
- Certified ENG-002 — Engineering Review Standard.
- Certified ENG-003 — Engineering Versioning Standard.
- Certified ENG-004 — Engineering Change Management Standard.

#### Template Standards
- Introduced the new TPL (Template Standards) family.
- Certified TPL-001 — Lua Module Template Standard.

### Changed

- Established the separation between Engineering Standards, Template Standards, and Reference Implementations.
- Adopted the new Engineering governance workflow:
  Engineering Standard → Template Standard → Reference Implementation → Engineering Review → Certification → Project Implementation.
- Designated first-generation templates (MOD-001, TST-001, ModuleSkeleton.lua, TestSkeleton.lua) as historical engineering artifacts pending replacement by the new TPL-based Reference Implementations.

### Notes

- ModuleSkeleton.lua certification intentionally deferred until its implementation as the official Reference Implementation for TPL-001.

## [Engineering] - Certified Engineering Templates

### Added

- Certified specification **TPL-001 — Lua Module Template Standard**.
- Certified specification **TPL-002 — Lua Test Template Standard**.
- Introduced the certified **ModuleSkeleton.lua** reference template.
- Introduced the certified **TestSkeleton.lua** reference template.
- Established the standardized engineering workflow for Lua modules and automated tests.
- Standardized the Test Environment initialization lifecycle.
- Standardized separation between Module Under Test and Test Dependencies.
- Standardized engineering test utilities (`ClearLog`, `Log`, `Pass`, `Fail`).
- Standardized deterministic test execution model.

### Changed

- Regenerated **ReferenceModule.lua** from the certified ModuleSkeleton.
- Regenerated **ReferenceModule_Test.lua** from the certified TestSkeleton.
- Refined Bootstrap loading and initialization workflow.
- Improved Bootstrap validation during test initialization.
- Removed temporary Bootstrap debugging output from the engineering test infrastructure.

### Certified

- **TPL-001 — Lua Module Template Standard**
- **Documentation/Engineering/Templates/ModuleSkeleton.lua**
- **Tests/Engineering/ReferenceModule.lua**

- **TPL-002 — Lua Test Template Standard**
- **Documentation/Engineering/Templates/TestSkeleton.lua**
- **Tests/Engineering/ReferenceModule_Test.lua**

## [Unreleased]

### Added
- Introduced the new ACP Monitor application bootstrap.
- Implemented MonitorApplication lifecycle coordinator.
- Refactored MainWindow according to the new GUI architecture.
- Implemented the new WindowLayout orchestration layer.
- Introduced the new MenuBar rendering component.
- Integrated Workspace with ViewManager.
- Migrated AnalysisView to the BaseView architecture.
- Migrated ResultsView to the BaseView architecture.
- Completed GUI-208 MainWindow Refactoring.
- Completed GUI-209 View Migration.
- Completed GUI-210 Menu Bar Rendering.

### Changed
- Removed the dependency on ViewRegistry from the GUI runtime.
- MainWindow now uses ViewManager directly.
- Unified all application views on the BaseView lifecycle model.
- Simplified the GUI rendering pipeline.

### Fixed
- Fixed application bootstrap sequence.
- Fixed ViewManager registration.
- Fixed Workspace rendering.
- Fixed MenuBar integration.
- Fixed ReaImGui rendering lifecycle.
- ACP Monitor now launches successfully using the new GUI architecture.

## [Unreleased]

### Added

- TPL-006 — Test Skeleton Framework.
- Defined the architectural hierarchy for ACP Studio test skeletons.
- Introduced BaseTestSkeleton as the common engineering foundation.
- Defined the specialization model for ModuleTestSkeleton, GuiTestSkeleton, and ViewTestSkeleton.

### Changed

- Aligned the TPL documentation family to the new Test Skeleton Framework.
- Updated document dependencies across TPL-002, TPL-003, TPL-004, and TPL-005.
- Improved architectural traceability between template specifications.

## [Unreleased]

### Added

- ENV-002 Runtime Environment Preparation completed.
- Automatic Runtime Environment provisioning.
- Automatic creation of the ACP Runtime track.
- Automatic insertion of the ACP Studio - Baseline DSP Runtime plugin.
- RuntimeEnvironment.Prepare() introduced.
- Runtime track provisioning extracted into CreateRuntimeTrack().
- Runtime plugin provisioning extracted into CreateRuntimePlugin().

### Changed

- Bootstrap initialization redesigned as an orchestration pipeline.

  Initialize()
      ↓
  Prepare()
      ↓
  Validate()

- RuntimeEnvironment responsibilities separated into:
  - Initialize()
  - Prepare()
  - Validate()

- ACP Monitor launcher simplified.
- Bootstrap no longer depends on repository-specific initialization.

### Fixed

- ACP Monitor now starts correctly on an empty REAPER project.
- Runtime Environment no longer requires manual project preparation.
- Automatic Runtime Track provisioning.
- Automatic Runtime Plugin provisioning.
- Clean application startup and shutdown verified.
