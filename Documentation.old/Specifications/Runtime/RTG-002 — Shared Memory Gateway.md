--------------------------------------------------------------------------------
-- ACP Studio
-- Specification
--------------------------------------------------------------------------------

Title           : RTG-002 — Shared Memory Gateway
Identifier      : RTG-002
Author          : ACP Studio
Status          : Approved
Type            : Capability Specification
Layer           : Runtime
Component       : SharedMemoryGateway

--------------------------------------------------------------------------------

# 1. Purpose

------------------------------------------------------------------------------

The Shared Memory Gateway is responsible for providing controlled access to the
shared memory used by the Runtime infrastructure.

It encapsulates all implementation details related to shared memory access,
including memory attachment, register reading, register writing, and register
initialization.

The Shared Memory Gateway performs no business logic, owns no domain state, and
contains no communication orchestration.

Its sole responsibility is to provide reliable and deterministic access to the
shared memory infrastructure.

------------------------------------------------------------------------------

# 2. Responsibilities

------------------------------------------------------------------------------

The Shared Memory Gateway is responsible for:

* attaching to the shared memory segment;
* reading shared memory registers;
* writing shared memory registers;
* initializing shared memory registers;
* validating shared memory access;
* reporting shared memory access failures.

The Shared Memory Gateway is not responsible for:

* coordinating runtime communication;
* executing analysis workflows;
* applying business rules;
* interpreting shared memory data;
* managing Analysis Session lifecycle.

------------------------------------------------------------------------------

# 3. Memory Model

------------------------------------------------------------------------------

The Shared Memory Gateway operates as the memory access component of the
Runtime Layer.

It provides controlled access to the shared memory infrastructure by exposing
well-defined memory operations while hiding all implementation details related
to the underlying shared memory API.

The gateway does not retain memory state between invocations.

Each memory operation is independent and isolated from previous or subsequent
operations.

The shared memory lifecycle is managed by the runtime infrastructure, while the
Shared Memory Gateway remains responsible only for providing deterministic and
reliable access to the shared memory.

------------------------------------------------------------------------------

# 4. Public API

------------------------------------------------------------------------------

### Attach

```lua
SharedMemoryGateway.Attach()
```

Attaches to the shared memory infrastructure.

------------------------------------------------------------------------------

### Read

```lua
SharedMemoryGateway.Read(register)
```

Reads the value stored in the specified shared memory register.

------------------------------------------------------------------------------

### Write

```lua
SharedMemoryGateway.Write(register, value)
```

Writes the specified value to the shared memory register.

------------------------------------------------------------------------------

### Reset

```lua
SharedMemoryGateway.Reset()
```

Initializes the shared memory registers to their default values.

------------------------------------------------------------------------------

# 5. Memory Access Rules

------------------------------------------------------------------------------

The Shared Memory Gateway shall:

* establish shared memory access deterministically;
* perform one memory operation per invocation;
* perform deterministic memory access;
* provide consistent register read and write operations;
* report memory access failures to the caller.

The Shared Memory Gateway shall not:

* coordinate runtime communication;
* interpret register values;
* apply business rules;
* manage runtime execution state;
* retain memory state after completion.

------------------------------------------------------------------------------

# 6. Design Principles

------------------------------------------------------------------------------

The Shared Memory Gateway shall:

* remain stateless;
* encapsulate all shared memory access;
* expose a minimal public API;
* provide deterministic memory operations;
* remain independent from runtime communication workflows;
* depend only on the underlying shared memory infrastructure.

The Shared Memory Gateway shall not:

* expose REAPER shared memory implementation details;
* interpret shared memory contents;
* contain domain logic;
* coordinate runtime communication;
* manage application workflows.

------------------------------------------------------------------------------

# 7. Certification Criteria

------------------------------------------------------------------------------

The Shared Memory Gateway is certified when:

* shared memory attachment is established correctly;
* register read operations are performed correctly;
* register write operations are performed correctly;
* shared memory initialization is performed correctly;
* invalid memory access is reported correctly;
* the gateway remains stateless;
* shared memory implementation details remain hidden from callers.

------------------------------------------------------------------------------

# 8. Incremental Implementation

------------------------------------------------------------------------------

The Shared Memory Gateway shall be implemented incrementally.

Each public operation shall be implemented, tested, and certified
independently before introducing additional functionality.

The implementation order is:

1. Attach
2. Read
3. Write
4. Reset

Each increment shall preserve backward compatibility and maintain a fully
certified repository state.

------------------------------------------------------------------------------