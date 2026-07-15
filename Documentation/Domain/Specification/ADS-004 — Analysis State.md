------------------------------------------------------------------------------

ACP Studio

Capability      : ADS-004
Title           : Analysis State

Category        : Domain Capability
Status          : Approved

Version         : 1.0.0

Author          : ACP Studio

Dependencies    : DOM-001 Domain Model Architecture

------------------------------------------------------------------------------

# 1. Purpose

This document defines the Analysis State value object used by the ACP Studio Analysis domain.

An Analysis State represents the current lifecycle state of an Analysis Session.

The Analysis State provides a technology-independent and immutable representation of the progress of an analysis operation.

------------------------------------------------------------------------------

# 2. Responsibilities

The Analysis State is responsible for:

- representing the current state of an analysis session;
- preserving lifecycle consistency;
- providing immutable access to the current state;
- comparing analysis states for equality;
- validating lifecycle states;
- validating lifecycle transitions.

The Analysis State is not responsible for:

- executing analysis operations;
- coordinating the analysis lifecycle;
- performing audio analysis;
- calculating measurements;
- communicating with the runtime;
- accessing shared memory;
- interacting with REAPER.

------------------------------------------------------------------------------

# 3. Domain Model

Analysis State shall represent a single immutable domain value.

```text
AnalysisState
        │
        └── State
```

The state shall always represent a valid Analysis Session lifecycle state.

------------------------------------------------------------------------------

# 4. Lifecycle States

The Analysis domain defines the following lifecycle states.

```text
Created
        │
        ▼
Running
        │
        ├──────────────┐
        ▼              ▼
Completed          Failed
        │              │
        └──────┬───────┘
               ▼
           Cancelled
```

The valid domain states are:

- Created
- Running
- Completed
- Failed
- Cancelled

Only valid lifecycle transitions shall be accepted.

------------------------------------------------------------------------------

# 5. Public API

### Constructor

```lua
AnalysisState.New(state)
```

Creates a new immutable Analysis State.

------------------------------------------------------------------------------

### GetValue

```lua
AnalysisState:GetValue()
```

Returns the current lifecycle state.

------------------------------------------------------------------------------

### Equals

```lua
AnalysisState:Equals(other)
```

Returns `true` when both Analysis States represent the same lifecycle state.

------------------------------------------------------------------------------

### IsValid

```lua
AnalysisState:IsValid(state)
```

Returns `true` when the specified lifecycle state is valid.

------------------------------------------------------------------------------

### CanTransition

```lua
AnalysisState:CanTransition(fromState, toState)
```

Returns `true` when the specified lifecycle transition is allowed.

------------------------------------------------------------------------------

# 6. Invariants

An Analysis State shall always satisfy the following rules.

- State shall belong to the defined lifecycle.
- Invalid states shall be rejected.
- Empty states shall be rejected.
- Nil states shall be rejected.
- The object shall be immutable after construction.

------------------------------------------------------------------------------

# 7. Design Principles

The Analysis State shall:

- remain immutable;
- represent exactly one lifecycle state;
- expose a minimal public API;
- remain independent from infrastructure;
- preserve domain consistency;
- represent a single domain value.

The Analysis State shall centralize lifecycle validation rules for the Analysis domain.

------------------------------------------------------------------------------

# 8. Certification Criteria

The Analysis State is certified when:

- valid states can be created;
- invalid states are rejected;
- valid lifecycle transitions are accepted;
- invalid lifecycle transitions are rejected;
- lifecycle state validation behaves correctly;
- equality comparison behaves correctly;
- immutability is preserved.

------------------------------------------------------------------------------
End of Document
------------------------------------------------------------------------------