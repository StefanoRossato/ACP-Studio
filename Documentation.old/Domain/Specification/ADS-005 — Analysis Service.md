------------------------------------------------------------------------------

ACP Studio

Capability      : ADS-005
Title           : Analysis Service

Category        : Domain Capability
Status          : Approved

Version         : 1.0.0

Author          : ACP Studio

Dependencies    : DOM-001 Domain Model Architecture
                  ADS-001 Analysis Session Aggregate
                  ADS-002 Measurement
                  ADS-003 Measurement Result
                  ADS-004 Analysis State

------------------------------------------------------------------------------

# 1. Purpose

This document defines the Analysis Service used by the ACP Studio Analysis domain.

The Analysis Service coordinates the execution of domain operations and
ensures the consistent creation and evolution of Analysis Sessions.

The Analysis Service contains no business state.

Its responsibility is limited to coordinating domain behavior.

------------------------------------------------------------------------------

# 2. Responsibilities

The Analysis Service is responsible for:

- coordinating Analysis Session operations;
- enforcing domain rules during analysis execution;
- creating valid Analysis Sessions;
- producing consistent Measurement Results;
- preserving aggregate consistency.

The Analysis Service is not responsible for:

- storing business state;
- representing business entities;
- performing audio analysis;
- communicating with the runtime;
- accessing shared memory;
- interacting with REAPER.

------------------------------------------------------------------------------

# 3. Domain Model

The Analysis Service coordinates the Analysis Aggregate.

```text
                 AnalysisService
                        │
                        ▼
                AnalysisSession
                        │
        ┌───────────────┴───────────────┐
        ▼                               ▼
 AnalysisState                MeasurementResult
                                         │
                               ┌─────────┴─────────┐
                               ▼                   ▼
                         RMS Measurement    Peak Measurement
```

The Analysis Service shall never own domain state.

Its responsibility is limited to coordinating interactions between domain
components while preserving aggregate consistency.

------------------------------------------------------------------------------

# 4. Public API

### CreateSession

```lua
AnalysisService.CreateSession()
```

Creates a new Analysis Session initialized with:

- AnalysisState.Created
- MeasurementResult.Empty()

------------------------------------------------------------------------------

### Start

```lua
AnalysisService.Start(session)
```

Starts the specified Analysis Session.

------------------------------------------------------------------------------

### Complete

```lua
AnalysisService.Complete(
    session,
    result)
```

Completes an Analysis Session using the specified Measurement Result.

------------------------------------------------------------------------------

### Fail

```lua
AnalysisService.Fail(session)
```

Transitions the Analysis Session to the Failed state.

------------------------------------------------------------------------------

### Cancel

```lua
AnalysisService.Cancel(session)
```

Transitions the Analysis Session to the Cancelled state.

Each operation returns a new immutable Analysis Session representing the updated domain state.

------------------------------------------------------------------------------

# 5. Domain Rules

The Analysis Service shall enforce the following rules.

- Every Analysis Session shall begin in the Created state.
- Every newly created Analysis Session shall contain an empty Measurement Result.
- Only valid lifecycle transitions shall be accepted.
- A completed Analysis Session shall contain a valid Measurement Result.
- Failed and Cancelled sessions shall preserve aggregate consistency.
- Domain operations shall never violate aggregate invariants.

------------------------------------------------------------------------------

# 6. Design Principles

The Analysis Service shall:

- own no business state;
- coordinate domain operations only;
- preserve aggregate consistency;
- remain independent from infrastructure;
- expose a minimal public API;
- avoid speculative functionality.

------------------------------------------------------------------------------

# 7. Certification Criteria

The Analysis Service is certified when:

- valid Analysis Sessions can be created;
- valid lifecycle transitions are coordinated correctly;
- invalid transitions are rejected;
- valid Measurement Results are accepted;
- aggregate consistency is preserved;
- the service remains stateless.

------------------------------------------------------------------------------
End of Document
------------------------------------------------------------------------------