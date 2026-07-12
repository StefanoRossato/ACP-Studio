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