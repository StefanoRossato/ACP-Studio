--------------------------------------------------------------------------------
-- ACP Studio
--
-- Document      : GUI-106 — View Framework Foundation
-- Layer         : GUI
-- Type          : Foundation Specification
-- Status        : Approved
--
-- Purpose
--   Define the architectural foundation of the ACP Studio View Framework.
--   This specification establishes the standard architecture, lifecycle,
--   responsibilities, activation model, and interaction rules governing every
--   View within the graphical user interface.
--
-- Scope
--   This document applies to all View components implemented in ACP Studio and
--   serves as the architectural reference for the View Framework.
--------------------------------------------------------------------------------

# 1. Purpose

The View Framework defines the architectural foundation for organizing
graphical content within ACP Studio.

Its purpose is to establish a standardized model for representing,
managing, and rendering application views while preserving consistency,
modularity, and long-term maintainability across the graphical user
interface.

This specification defines the architectural contracts governing the
View lifecycle, activation model, responsibilities, and interaction
rules independently from the surrounding window framework.

The View Framework is implementation-independent and serves as the
reference architecture for every View developed within ACP Studio.

# 2. Architectural Principles

The View Framework is based on a set of architectural principles that govern
the design and behavior of every View implemented within ACP Studio.

These principles ensure consistency, predictability, extensibility, and
long-term maintainability throughout the graphical user interface.

---

## 2.1 Single Responsibility

Each View shall represent a single functional area of the application.

A View shall never combine unrelated application features or assume
responsibilities belonging to the window framework.

---

## 2.2 View Isolation

Views shall remain completely independent from one another.

A View shall not directly access, modify, or control another View.

All coordination between Views shall occur through the View Framework.

---

## 2.3 Explicit Lifecycle

Every View shall expose a well-defined lifecycle.

Initialization, activation, rendering, deactivation, and shutdown are
explicit execution phases.

No View shall perform implicit initialization during rendering.

---

## 2.4 Controlled Activation

At any given time, only one View may be considered active within a
Workspace.

The activation of a View shall occur exclusively through the View
Framework.

---

## 2.5 Separation of Concerns

A View is responsible exclusively for presenting graphical content.

Application services, runtime execution, domain logic, and business rules
shall remain outside the View Framework.

---

## 2.6 Extensibility

The View Framework shall support future Views without requiring
modifications to existing View implementations.

New Views shall integrate through the established architectural contracts.

---

## 2.7 Testability

Every View shall be independently testable.

Architectural design shall encourage isolated certification of each View
without requiring the complete graphical application.

# 3. Architectural Overview

The View Framework is organized as a hierarchy of independent components, each
owning a single architectural responsibility.

The framework separates view orchestration from view implementation, allowing
individual Views to remain independent from one another while participating in
a common execution model.

The architectural hierarchy is illustrated below.

```text
Workspace
     │
     ▼
ViewManager
     │
     ▼
Active View
     │
     ▼
View
```

The Workspace provides the graphical region dedicated to application Views.

The ViewManager coordinates the lifecycle and activation of Views without
participating in their graphical implementation.

A View represents an independent graphical unit responsible exclusively for
its own presentation.

The framework guarantees that only one View is active within a Workspace at
any given time.

Views remain isolated from one another and interact exclusively through the
architectural contracts established by the View Framework.

This organization promotes predictable behavior, low coupling, and independent
development of graphical features while allowing new Views to be introduced
without modifying the existing framework.

# 4. View Lifecycle

Every View implemented within ACP Studio shall follow the same execution
lifecycle.

The lifecycle defines the ordered sequence of phases required to create,
activate, render, deactivate, and destroy a View.

The View Framework guarantees that every View executes these phases in a
predictable and deterministic order.

```text
Initialize
      │
      ▼
Activate
      │
      ▼
Render
      │
      ▼
Deactivate
      │
      ▼
Shutdown
```

## 4.1 Initialize

The initialization phase prepares the View for execution.

Typical responsibilities include:

- acquiring graphical resources;
- initializing internal state;
- preparing graphical controls;
- allocating View-specific resources.

Rendering is not permitted during initialization.

---

## 4.2 Activate

The activation phase makes the View the active graphical representation within
the current Workspace.

Only active Views participate in graphical rendering.

Activation shall occur exclusively through the View Framework.

---

## 4.3 Render

The rendering phase is executed repeatedly while the View remains active.

The View is responsible exclusively for rendering its own graphical content.

Rendering shall remain deterministic and independent from initialization,
activation, deactivation, or shutdown activities.

---

## 4.4 Deactivate

The deactivation phase removes the View from active execution.

A deactivated View shall no longer participate in graphical rendering.

The View may preserve its internal state unless explicitly reset by the
application.

---

## 4.5 Shutdown

The shutdown phase releases all resources owned by the View.

Every resource acquired during initialization shall be released before the View
is considered terminated.

# 5. Activation Model

The View Framework controls the activation and deactivation of application
Views through a centralized activation model.

At any given time, a Workspace shall contain exactly one active View.

View activation is coordinated exclusively by the ViewManager.

Direct activation or deactivation performed by individual Views is prohibited.

---

## 5.1 Active View

The active View is the only View authorized to participate in graphical
rendering.

Inactive Views shall not render graphical content.

The framework guarantees that exactly one View is active during normal
execution.

---

## 5.2 View Switching

Changing the active View consists of a deterministic sequence of operations.

```text
Current View
      │
      ▼
Deactivate
      │
      ▼
Select Next View
      │
      ▼
Activate
      │
      ▼
Render
```

The View Framework shall complete this sequence before rendering resumes.

---

## 5.3 Activation Authority

Only the ViewManager may:

- activate a View;
- deactivate a View;
- replace the active View;
- determine the current active View.

Individual Views shall never activate or deactivate themselves.

---

## 5.4 State Preservation

The View Framework may preserve the internal state of an inactive View.

State preservation policy is implementation-dependent and remains outside the
scope of this specification.

Regardless of the chosen implementation, activation behavior shall remain
architecturally consistent.

---

## 5.5 Activation Constraints

The activation model shall satisfy the following constraints.

- Only one View is active at any time.
- Activation is deterministic.
- View transitions occur through the ViewManager.
- Views remain isolated from one another.
- Activation shall not violate the View lifecycle.

# 6. Module Responsibilities

The View Framework is composed of independent modules, each responsible for a
single aspect of view management.

Every module shall expose a clearly defined architectural responsibility and
shall not perform duties belonging to other framework components.

The following sections define the responsibilities of each module composing the
View Framework.

---

## 6.1 ViewManager

ViewManager is the central coordinator of the View Framework.

Responsibilities:

- register available Views;
- activate and deactivate Views;
- maintain the active View;
- coordinate the View lifecycle;
- delegate rendering to the active View.

ViewManager shall never implement application-specific graphical content.

---

## 6.2 View

A View represents an independent functional area of the graphical user
interface.

Responsibilities:

- initialize View resources;
- render graphical content;
- release owned resources;
- manage its own internal presentation state.

A View shall not activate itself, deactivate itself, or manage other Views.

---

## 6.3 Active View

The Active View represents the View currently selected for graphical
presentation.

Responsibilities:

- receive rendering requests from the ViewManager;
- present graphical content;
- participate in the View lifecycle.

The Active View is an architectural role rather than a distinct framework
component.

Any registered View may become the Active View.

---

## 6.4 Workspace

The Workspace provides the graphical region hosting the View Framework.

Responsibilities:

- provide the rendering area for the active View;
- host the View Framework within the Window Framework.

Workspace shall not participate in View activation, View selection, or View
lifecycle management.

Its responsibilities are defined by the Window Framework specification.

# 7. Dependency Rules

The View Framework follows a strict hierarchical dependency model.

Dependencies shall always flow from framework coordination components toward
individual View implementations.

Reverse dependencies and circular references are prohibited.

The dependency hierarchy is illustrated below.

```text
Workspace
     │
     ▼
ViewManager
     │
     ▼
View
```

Every module shall depend only on the modules immediately below its
architectural layer.

Views shall never bypass the established framework hierarchy.

---

## 7.1 Allowed Dependencies

The following dependencies are permitted.

| Module | Allowed Dependencies |
|---------|----------------------|
| Workspace | ViewManager |
| ViewManager | View |
| View | Internal presentation only |

---

## 7.2 Forbidden Dependencies

The following architectural relationships are prohibited.

- View → Workspace
- View → ViewManager
- View → View
- View → Window Framework
- Workspace → Individual View
- ViewManager → Business Logic

Views shall not directly communicate with one another.

---

## 7.3 Circular Dependencies

Circular dependencies are strictly forbidden.

No View shall directly or indirectly depend on another View in a way that
creates cyclic relationships.

The dependency graph shall always remain acyclic.

---

## 7.4 Architectural Integrity

Every new View introduced into the framework shall integrate through the
existing ViewManager.

New Views shall not introduce alternative activation mechanisms or execution
flows.

When a new feature cannot be integrated without violating the dependency
model, the architectural design shall be reviewed before implementation.

# 8. Design Constraints

The View Framework shall preserve its architectural integrity throughout its
entire lifecycle.

The following constraints apply to every View and every component belonging to
the View Framework.

- Every View shall have a single architectural responsibility.
- Only one View may be active within a Workspace.
- View activation shall remain deterministic.
- Views shall remain isolated from one another.
- View rendering shall remain independent from application business logic.
- Public interfaces shall remain stable once certified.
- Architectural contracts defined by this specification shall not be violated.

Any modification affecting the View Framework architecture shall require an
update to this specification before implementation.

# 9. Extension Guidelines

The View Framework is designed to evolve through incremental architectural
extensions while preserving its structural integrity.

New Views and View Framework components shall integrate into the existing
architecture without modifying its architectural contracts.

Framework evolution shall prioritize extension through new Views rather than
modification of existing certified components.

## 9.1 New Views

Every new View shall define a single functional responsibility.

A View shall integrate exclusively through the ViewManager.

## 9.2 Framework Integration

New View-related components shall integrate through the existing View
Framework hierarchy.

Alternative activation mechanisms or direct View-to-View communication are
prohibited.

## 9.3 Framework Evolution

Future graphical capabilities shall extend the View Framework through
additional Views or supporting framework components.

Existing certified Views shall not require modification unless this
architectural specification is revised.

## 9.4 Certification

Every new View shall:

- define a documented architectural responsibility;
- comply with the View lifecycle;
- respect the activation model;
- satisfy the dependency rules;
- provide an independent certification test.

Only certified Views may become part of the official ACP Studio View
Framework.

# 10. Compliance Requirements

A View or View Framework component is considered compliant with the ACP Studio
View Framework only when it satisfies every architectural requirement defined
by this specification.

Compliance shall be evaluated independently from implementation details.

## 10.1 Architectural Compliance

A compliant component shall:

- implement a single architectural responsibility;
- participate in the View lifecycle;
- respect the activation model;
- preserve dependency integrity;
- avoid circular dependencies.

## 10.2 Implementation Compliance

A compliant implementation shall:

- expose a clear public interface;
- remain independent from application business logic;
- support deterministic rendering;
- support independent initialization and shutdown;
- remain individually testable.

## 10.3 Certification Compliance

Before becoming part of the official ACP Studio View Framework, every
component shall:

- conform to the approved architectural specification;
- follow the certified ACP Studio module template;
- pass its dedicated certification test;
- satisfy all applicable coding standards.

Components failing any compliance requirement shall not be considered part of
the certified View Framework.