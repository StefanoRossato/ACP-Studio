---

ACP Studio

Capability      : ADS-001
Title           : Analysis Session Aggregate

Category        : Domain Aggregate
Status          : Approved

Version         : 1.0.0

Author          : ACP Studio

Dependencies    : DOM-001 Domain Model Architecture
                  ADS-003 Measurement Result
                  ADS-004 Analysis State

---

# 1. Purpose

---

This document defines the Analysis Session aggregate used by the ACP Studio Analysis domain.

The Analysis Session is the aggregate root of the Analysis domain. It coordinates the analysis lifecycle and guarantees the consistency of the domain state and the associated measurement results.

---

# 2. Responsibilities

---

The Analysis Session is responsible for:

* representing a single analysis session;
* owning the Analysis State;
* owning the Measurement Result;
* preserving domain consistency;
* coordinating the lifecycle of the analysis session;
* providing immutable access to the current domain state.

The Analysis Session is not responsible for:

* performing audio analysis;
* calculating measurements;
* communicating with the runtime;
* accessing shared memory;
* interacting with REAPER.

---

# 3. Domain Model

---

AnalysisSession shall be the aggregate root of the Analysis domain.

```text
AnalysisSession
        │
        ├── State
        │       │
        │       ▼
        │   AnalysisState
        │
        └── Result
                │
                ▼
        MeasurementResult
                │
                ├── RMS
                │
                └── Peak
                        │
                        ▼
                    Measurement
```

AnalysisSession shall own its aggregated domain objects.

The aggregate shall preserve the consistency between the current Analysis State and the associated Measurement Result.

---

# 4. Public API

---

### Constructor

```lua
AnalysisSession.New(
    state,
    result)
```

Creates a new immutable Analysis Session.

---

### GetState

```lua
AnalysisSession:GetState()
```

Returns the current Analysis State.

---

### GetResult

```lua
AnalysisSession:GetResult()
```

Returns the associated Measurement Result.

---

### Equals

```lua
AnalysisSession:Equals(other)
```

Returns `true` when both Analysis Sessions represent the same domain state.

---

# 5. Invariants

---

An Analysis Session shall always satisfy the following rules.

* State shall be a valid Analysis State.
* Result shall be a valid Measurement Result.
* The aggregate shall preserve the consistency of its owned domain objects.
* The aggregate shall be immutable after construction.

---

# 6. Design Principles

---

The Analysis Session shall:

* remain immutable;
* act as the aggregate root of the Analysis domain;
* expose a minimal public API;
* remain independent from infrastructure;
* preserve domain consistency;
* aggregate only immutable domain objects.

---

# 7. Aggregate Rules

---

Aggregated domain objects shall not be exposed for direct modification.

Aggregated domain objects shall not modify the aggregate state.

The aggregate shall guarantee that every exposed Measurement Result is consistent with the current Analysis State.

---

# 8. Certification Criteria

---

The Analysis Session is certified when:

* valid instances can be created;
* invalid construction is rejected;
* all getters return the expected values;
* equality comparison behaves correctly;
* aggregate consistency is preserved;
* immutability is preserved.

---

# 9. Analysis Domain Model

The current Analysis domain is organized according to the following Domain-Driven Design model.

Analysis Domain
│
├── Aggregate Root
│   │
│   ▼
│   AnalysisSession
│
├── Entity
│   │
│   ▼
│   MeasurementResult
│
├── Value Objects
│   │
│   ├── AnalysisState
│   │
│   └── Measurement
│
└── Domain Service
    │
    ▼
    AnalysisService

The relationships between the domain components are illustrated below.

AnalysisSession
        │
        ├── State
        │       │
        │       ▼
        │   AnalysisState
        │
        └── Result
                │
                ▼
        MeasurementResult
                │
                ├── RMS
                │
                └── Peak
                        │
                        ▼
                    Measurement

AnalysisService
        │
        └── Creates and coordinates AnalysisSession

The Analysis Session is the Aggregate Root of the Analysis domain.

All access to the Analysis domain shall occur through the Analysis Session aggregate.

The Analysis Service coordinates domain operations without owning domain state.

------------------------------------------------------------------------------
End of Document
------------------------------------------------------------------------------