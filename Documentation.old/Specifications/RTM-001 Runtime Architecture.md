ACP Studio
RTM-001 Runtime Architecture
----------------------------

Document ID

RTM-001

Status

Certified

Version

1.0

---

Purpose

Define the architecture of the ACP Studio Runtime.

This document describes the Runtime components, their
responsibilities, relationships, lifecycle, and architectural
constraints.

This document serves as the architectural reference for all Runtime
components implemented within ACP Studio.

---

1. Scope

This document defines the architecture of the ACP Studio Runtime.

The Runtime architecture provides the execution environment used to
synchronize the DSP Runtime with the Lua application layer.

This document defines:

- Runtime architecture
- Runtime components
- Component responsibilities
- Runtime lifecycle
- Dependency rules
- Engineering principles
- Design constraints

This document does not define:

- DSP algorithms
- Audio analysis algorithms
- Runtime implementation details
- Component testing procedures

---

2. Runtime Overview

The ACP Studio Runtime is organized as a layered architecture.

Each Runtime component owns a single responsibility.

Runtime components communicate through explicit ownership and
well-defined public interfaces.

Runtime data flows from the DSP Runtime toward the Lua Runtime through
the synchronization layer.

The Runtime architecture isolates hardware and IPC concerns from the
application layer.

This separation allows Runtime components to evolve independently
while preserving architectural stability.

---

3. Runtime Architecture

The ACP Studio Runtime is organized as a layered architecture.

Each Runtime layer owns a single responsibility.

Dependencies shall flow downward only.

The Runtime architecture is composed of the following components.

The following diagram represents the Runtime architecture.

                RuntimeSession
                      │
                      ▼
              RuntimeController
               │             │
               ▼             ▼
        RuntimeObserver   RuntimeModel
               │
               ▼
         SharedMemory
               │
               ▼
        ACP_Baseline.jsfx

The RuntimeSession represents the Runtime lifecycle.

The RuntimeController coordinates Runtime operations.

The RuntimeObserver synchronizes Runtime data from the DSP Runtime
into the RuntimeModel.

The RuntimeModel represents the Runtime state.

SharedMemory provides the communication layer between the Lua Runtime
and the DSP Runtime.

ACP_Baseline.jsfx represents the Runtime implementation executing
inside the DSP engine.

Runtime data shall flow upward through the Runtime architecture.

Control flow shall propagate downward through the Runtime
architecture.

---

4. Runtime Components

The ACP Studio Runtime is composed of six architectural components.

Each component owns a single responsibility and communicates through
well-defined public interfaces.

The Runtime components are listed below.

RuntimeSession

Purpose

Manage the Runtime lifecycle.

Owns the RuntimeController.

Provides the public Runtime lifecycle interface.

---

RuntimeController

Purpose

Coordinate Runtime operations.

Owns the RuntimeModel.

Owns the RuntimeObserver.

Coordinates Runtime synchronization.

Provides the public Runtime interface.

---

RuntimeObserver

Purpose

Synchronize Runtime data.

Reads Runtime data from SharedMemory.

Updates the RuntimeModel.

Shall not implement Runtime logic.

---

RuntimeModel

Purpose

Represent the Runtime state.

Stores Runtime information.

Provides Runtime state accessors.

Shall not access SharedMemory.

Shall not coordinate Runtime execution.

---

SharedMemory

Purpose

Provide the communication interface between the Lua Runtime and the
DSP Runtime.

Provides controlled access to Runtime registers.

Shall not implement Runtime logic.

---

ACP_Baseline.jsfx

Purpose

Provide the DSP Runtime implementation.

Maintains the Runtime state executed by the DSP engine.

Publishes Runtime information through SharedMemory.

Shall not contain Lua Runtime logic.

---

5. Component Responsibilities

Each Runtime component shall own one architectural responsibility.

Responsibilities shall not overlap.

A Runtime component shall not assume responsibilities assigned to
another Runtime component.

RuntimeSession

Responsible for the Runtime lifecycle.

Coordinates Runtime initialization, execution, and termination.

Shall communicate with the Runtime only through the
RuntimeController.

---

RuntimeController

Responsible for Runtime orchestration.

Coordinates Runtime operations.

Owns the RuntimeModel.

Owns the RuntimeObserver.

Shall not access SharedMemory directly.

---

RuntimeObserver

Responsible for Runtime synchronization.

Reads Runtime information from SharedMemory.

Updates the RuntimeModel.

Shall not coordinate Runtime execution.

---

RuntimeModel

Responsible for Runtime state representation.

Stores Runtime information.

Provides Runtime state access.

Shall not access SharedMemory.

Shall not coordinate Runtime execution.

Shall not modify Runtime lifecycle.

---

SharedMemory

Responsible for Runtime communication.

Provides controlled register access.

Shall not implement Runtime behavior.

---

ACP_Baseline.jsfx

Responsible for DSP Runtime execution.

Maintains the Runtime state inside the DSP engine.

Publishes Runtime information through SharedMemory.

Shall not contain Lua Runtime responsibilities.

---

6. Runtime Lifecycle

The Runtime lifecycle is managed exclusively by the RuntimeSession.

The Runtime lifecycle shall consist of the following phases.

New()

↓

Initialize()

↓

Update()

↓

Terminate()

The Runtime lifecycle begins with RuntimeSession construction.

Initialization prepares the Runtime for execution.

The Runtime may execute zero or more Update() operations.

Termination concludes the Runtime lifecycle.

Runtime lifecycle transitions shall follow the order defined above.

Runtime components shall not modify the Runtime lifecycle directly.

Only RuntimeSession may coordinate lifecycle transitions.

RuntimeController shall execute Runtime operations during the
Update() phase.

RuntimeObserver shall synchronize Runtime data during Runtime
updates.

RuntimeModel shall represent the current Runtime state throughout
the Runtime lifecycle.

---

7. Dependency Rules

The ACP Studio Runtime shall implement a unidirectional dependency
model.

Dependencies shall flow downward through the Runtime architecture.

Runtime components shall not introduce circular dependencies.

RuntimeSession

Shall depend only on RuntimeController.

Shall not access RuntimeModel.

Shall not access RuntimeObserver.

Shall not access SharedMemory.

---

RuntimeController

Shall depend only on RuntimeModel and RuntimeObserver.

Shall not access SharedMemory directly.

Shall not depend on RuntimeSession.

---

RuntimeObserver

Shall depend only on SharedMemory and Runtime registers.

Shall not depend on RuntimeController.

Shall not depend on RuntimeSession.

Shall update RuntimeModel exclusively through its public interface.

---

RuntimeModel

Shall not depend on any Runtime component.

Shall not access SharedMemory.

Shall not coordinate Runtime execution.

---

SharedMemory

Shall provide the only communication interface between the Lua
Runtime and the DSP Runtime.

Shall not depend on Runtime components.

---

ACP_Baseline.jsfx

Shall not depend on Lua Runtime components.

Shall communicate with the Lua Runtime exclusively through
SharedMemory.

---

Future Runtime components shall preserve the dependency direction
defined by this document.

Architectural dependency violations shall require revision of this
document before implementation.

---

8. Engineering Principles

The ACP Studio Runtime shall be developed according to the following
engineering principles.

Single Responsibility

Each Runtime component shall own one architectural responsibility.

Responsibilities shall remain clearly separated.

---

Layered Architecture

Runtime components shall be organized in architectural layers.

Each layer shall depend only on the immediately lower layer.

Layer boundaries shall remain explicit.

---

Composition

Runtime behavior shall be obtained through component composition.

Runtime components shall not rely on inheritance to implement
Runtime behavior.

---

Explicit Ownership

Ownership relationships shall be explicit.

RuntimeSession shall own RuntimeController.

RuntimeController shall own RuntimeModel and RuntimeObserver.

Ownership shall not be shared.

---

Encapsulation

Each Runtime component shall expose only its public interface.

Internal implementation details shall remain private.

Runtime components shall communicate exclusively through public
interfaces.

---

Controlled Communication

SharedMemory shall represent the only communication mechanism
between the Lua Runtime and the DSP Runtime.

Direct access to DSP Runtime components shall not be permitted.

---

Incremental Development

Runtime architecture shall evolve through small validated
increments.

Each architectural increment shall be implemented, tested,
reviewed, and certified before further development.

---

Architecture First

Architectural changes shall be defined before implementation.

Production code shall remain consistent with the Runtime
architecture defined by this document.

---

9. Future Evolution

The Runtime architecture defined by this document shall serve as the
foundation for future Runtime development.

Future Runtime components shall preserve the architectural principles,
dependency rules, and lifecycle defined by this document.

Architectural extensions shall be introduced through new Runtime
components rather than by expanding existing component
responsibilities.

Future Runtime services shall be integrated through RuntimeSession or
RuntimeController according to their architectural responsibility.

Changes affecting Runtime architecture shall require revision of this
document before implementation.

Architectural revisions shall preserve backward compatibility whenever
reasonably possible.

---

End of Document