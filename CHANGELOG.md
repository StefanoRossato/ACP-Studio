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