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