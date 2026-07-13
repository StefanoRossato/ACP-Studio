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