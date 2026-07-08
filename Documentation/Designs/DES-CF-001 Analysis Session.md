# DES-CF-001
## Analysis Session Design

| Field | Value |
|--------|-------|
| Document ID | DES-CF-001 |
| Version | 0.1 |
| Status | Approved |
| Phase | Core Features |
| Component | Analysis Session |
| Author | ACP Studio |

---

# 1. Purpose

This document describes the software architecture used to implement the Analysis Session defined in SPEC-CF-001.

It defines the internal modules, their responsibilities, interactions and execution flow.

---

# 2. Design Goals

The Analysis Session architecture is designed to:

- Keep ACP_Main.lua as a minimal application entry point.
- Isolate JSFX communication within a dedicated module.
- Separate orchestration from data acquisition.
- Support future Core Features without architectural changes.
- Promote modularity, maintainability and testability.

# 3. Architecture Overview

The Analysis Session is composed of five cooperating modules.

The Session module acts as the Application Controller and coordinates all other modules.

The following component diagram illustrates the relationships between these modules.

- Session
- State Machine
- Analyzer
- Result
- Report

Each module has a single responsibility.

---

# 4. Component Diagram

                    ACP_Main.lua
                          │
                          ▼
                  Session.Run()
                          │
        ┌─────────────────┼─────────────────┐
        ▼                 ▼                 ▼
 StateMachine        Analyzer          Result
        │                 │                 │
        └─────────────────┴─────────────────┘
                          │
                          ▼
                       Report

                       
# 5. Module Responsibilities

## Session

Responsibilities:

- Coordinate the complete analysis lifecycle.
- Create and initialize all analysis components.
- Control execution flow.
- Handle errors.
- Terminate the session.

---

## State Machine

Responsibilities:

- Maintain the current session state.
- Validate state transitions.
- Apply valid state changes.
- Reject invalid transitions.
- Notify state changes.

---

## Analyzer

Responsibilities:

- Communicate with ACP Analyzer.
- Read analysis values.
- Validate analyzer communication.
- Reset the analyzer.
- Detect analyzer availability.

---

## Result

Responsibilities:

- Store collected measurements.
- Provide immutable session results.
- Validate result completeness.

---

## Report

Responsibilities:

- Generate the final analysis report.
- Present collected measurements.
- Format output.

---

# 6. Module Relationships

The Session module coordinates all other modules.

ACP_Main
      │
      ▼
   Session
 ┌────┼────┬────┐
 ▼    ▼    ▼    ▼
SM Analyzer Result Report

---

# 7. Session Lifecycle

The session executes the following phases.

Initialization

↓

Analyzer Reset

↓

Waiting

↓

Analysis

↓

Completion Detection

↓

Result Generation

↓

Reporting

↓

Termination

---

# 8. State Machine

The Analysis Session is implemented as a deterministic state machine.

Only valid state transitions are permitted.

| State | Description |
|--------|-------------|
| IDLE | Session not started. |
| INITIALIZING | Analysis components are created and initialized. |
| RESETTING | ACP Analyzer is reset before acquisition begins. |
| WAITING | Waiting for ACP Analyzer to become ready. |
| ANALYZING | Audio measurements are being acquired. |
| COMPLETED | Analysis has successfully finished. |
| REPORTING | The Analysis Result is formatted and presented. |
| TERMINATED | Session execution has ended and all resources have been released. |

The session shall always progress through valid state transitions.

Invalid transitions shall be rejected by the State Machine.

The Session module is responsible for requesting state transitions, while the State Machine validates and applies them.

---

# 9. Analyzer Communication

The Analyzer module shall be the only component allowed to communicate with ACP Analyzer.

Other modules shall never access JSFX communication directly.

---

# 10. Public Interfaces

## Session

Run()

Terminate()

---

## Analyzer

Initialize()

Reset()

Update()

IsReady()

Read()

---

## State Machine

SetState()

GetState()

Update()

---

## Result

Set()

Get()

Validate()

---

## Report

Generate()

Print()

The public interfaces defined in this section represent the only supported interaction between Analysis Session modules.

---

# 11. Error Management

Errors shall be propagated to the Session module.

The Session module shall decide whether to:

- Continue execution
- Retry the operation
- Terminate the session

No module shall terminate the application autonomously.

Errors shall never propagate directly between modules.

---

# 12. Design Principles

The implementation shall follow these principles.

- Single Responsibility Principle
- Explicit State Management
- Deterministic Execution
- Loose Coupling
- High Cohesion
- Modular Components
- Fail Safe Behaviour
- Encapsulation

---

# 13. Future Extensions

The architecture supports future integration with:

- Track Analyzer
- Gain Staging
- Analog Profiles
- Preparation Engine
- User Interface
