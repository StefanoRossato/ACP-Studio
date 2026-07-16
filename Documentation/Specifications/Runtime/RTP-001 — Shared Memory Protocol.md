--------------------------------------------------------------------------------
-- ACP Studio
-- Specification
--------------------------------------------------------------------------------

Title           : RTP-001 — Shared Memory Protocol
Identifier      : RTP-001
Author          : ACP Studio
Status          : Certified
Type            : Capability Specification
Layer           : Runtime
Component       : SharedMemoryProtocol

--------------------------------------------------------------------------------

# 1. Purpose

------------------------------------------------------------------------------

The Shared Memory Protocol provides the semantic communication interface between
Runtime components and the shared memory infrastructure.

It exposes runtime operations through a stable, deterministic API while hiding
all shared memory implementation details from Runtime components.

The Shared Memory Protocol performs no business logic, owns no runtime state,
and performs no direct shared memory access.

Its sole responsibility is to provide a semantic abstraction over the Runtime
communication protocol.

------------------------------------------------------------------------------

# 2. Responsibilities

------------------------------------------------------------------------------

The Shared Memory Protocol is responsible for:

* exposing semantic runtime operations;
* translating runtime operations into protocol commands;
* providing semantic access to runtime state;
* providing semantic access to runtime measurement data;
* delegating all shared memory access to the Shared Memory Gateway;
* maintaining protocol consistency across the Runtime Layer.

The Shared Memory Protocol is not responsible for:

* accessing shared memory directly;
* defining IPC protocol registers;
* defining IPC runtime commands;
* defining IPC runtime states;
* coordinating runtime communication;
* executing analysis workflows;
* applying business rules.

------------------------------------------------------------------------------

# 3. Protocol Model

------------------------------------------------------------------------------

The Shared Memory Protocol operates as the semantic communication component of
the Runtime Layer.

It exposes high-level Runtime operations while relying on the Shared Memory
Gateway for all physical memory access.

Protocol definitions, including registers, commands and runtime states, are
provided by the IPC Layer.

The Shared Memory Protocol therefore acts as the semantic adapter between the
Runtime Layer and the IPC Layer.

The Shared Memory Protocol therefore acts as the semantic adapter between the
Runtime Layer and the IPC Layer.

The IPC Layer remains the single source of truth for all protocol definitions.

------------------------------------------------------------------------------

# 4. Public API

------------------------------------------------------------------------------

### Start

```lua
SharedMemoryProtocol.Start()
```

Requests the Runtime infrastructure to start an analysis session.

------------------------------------------------------------------------------

### Reset

```lua
SharedMemoryProtocol.Reset()
```

Requests the Runtime infrastructure to reset the current execution state.

------------------------------------------------------------------------------

### ReadState

```lua
SharedMemoryProtocol.ReadState()
```

Returns the current Runtime state.

------------------------------------------------------------------------------

### ReadMeasurement

```lua
SharedMemoryProtocol.ReadMeasurement()
```

Returns the current Runtime measurement.

------------------------------------------------------------------------------

# 5. Protocol Rules

------------------------------------------------------------------------------

The Shared Memory Protocol shall:

* expose semantic Runtime operations;
* expose no shared memory implementation details;
* delegate all read operations to the Shared Memory Gateway;
* delegate all write operations to the Shared Memory Gateway;
* use IPC protocol definitions as the single source of protocol information;
* provide deterministic protocol operations;
* remain independent from shared memory implementation details.

The Shared Memory Protocol shall not:

* access shared memory directly;
* duplicate IPC protocol definitions;
* duplicate runtime command definitions;
* duplicate runtime state definitions;
* coordinate runtime communication;
* contain business logic.

------------------------------------------------------------------------------

# 6. Design Principles

------------------------------------------------------------------------------

The Shared Memory Protocol follows the Adapter design pattern.

It translates Runtime semantic operations into IPC protocol operations while
remaining independent from the underlying shared memory implementation.

The protocol depends upon:

* SharedMemoryGateway;
* Registers;
* RuntimeCommands;
* RuntimeStates.

The protocol owns no protocol definitions.

All protocol definitions are provided by the IPC Layer.

The protocol remains stateless and deterministic throughout its lifetime.

------------------------------------------------------------------------------

# 7. Certification Criteria

------------------------------------------------------------------------------

The Shared Memory Protocol is certified when:

* Start() requests Runtime execution correctly;
* Reset() requests Runtime reset correctly;
* ReadState() returns the current Runtime state correctly;
* ReadMeasurement() returns the current Runtime measurement correctly;
* all shared memory access is delegated to the Shared Memory Gateway;
* protocol definitions are obtained exclusively from the IPC Layer;
* the protocol remains stateless;
* protocol implementation details remain hidden from Runtime components.

------------------------------------------------------------------------------

# 8. Incremental Implementation

------------------------------------------------------------------------------

The Shared Memory Protocol shall be implemented incrementally.

Each protocol operation shall be implemented, tested and certified
independently before introducing additional functionality.

Implementation order:

1. Start()
2. Reset()
3. ReadState()
4. ReadMeasurement()

Each implementation increment shall preserve backward compatibility and
maintain a fully certified repository state.

------------------------------------------------------------------------------

# Certification

------------------------------------------------------------------------------

Certification Date : 2026-07-16

The Shared Memory Protocol capability has been successfully implemented,
verified and certified.

Certified capabilities:

* Start()
* Reset()
* ReadState()
* ReadMeasurement()

The implementation conforms to the responsibilities, design principles and
certification criteria defined by this specification.

------------------------------------------------------------------------------
