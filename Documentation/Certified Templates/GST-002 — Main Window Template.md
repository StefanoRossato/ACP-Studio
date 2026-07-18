------------------------------------------------------------------------------

ACP Studio

Document        : GST-002
Title           : Main Window Template

Category        : Certified Template
Status          : Approved

Version         : 1.0.0

Author          : ACP Studio

Dependencies    : ENG-001 Documentation Standard
                  GUI-001 ReaImGui Platform
                  Tests/GUI/Framework/GuiTestSkeleton.lua
                  GST-001

------------------------------------------------------------------------------

# 1. Purpose

This document defines the certified architectural template for Main Window
implementations developed within ACP Studio.

The objective of this template is to establish a consistent, reusable and
maintainable architecture for top-level graphical windows implemented through
the ReaImGui platform.

Unlike individual graphical capabilities, a Main Window coordinates the
execution of the graphical application while delegating rendering and lifecycle
management to dedicated components.

For this reason, ACP Studio defines a certified Main Window architecture that
standardizes the execution model, public interface and module organization.

------------------------------------------------------------------------------

# 2. Design Philosophy

Main Window implementations differ fundamentally from individual graphical
components.

A Main Window coordinates the execution of the graphical application.

Graphical rendering and window lifecycle are delegated to dedicated modules
with clearly separated responsibilities.

For this reason, ACP Studio separates application coordination, rendering and
lifecycle management into independent components.

The Main Window acts exclusively as the coordinator.

WindowLayout owns the graphical composition.

WindowLifecycle owns the window state.

This separation eliminates duplicated infrastructure, improves maintainability
and allows every component to focus exclusively on its own responsibility.

------------------------------------------------------------------------------

# 3. Responsibilities

The Main Window Architecture separates execution, rendering and lifecycle into
independent components.

This separation defines three distinct responsibilities.

------------------------------------------------------------------------------

## 3.1 MainWindow

MainWindow is responsible for coordinating the complete execution of the
graphical application.

Its responsibilities include:

- Initialization
- Application execution
- Render loop coordination
- Shutdown
- Integration with the certified GUI Test Skeleton

MainWindow shall not implement graphical layout.

------------------------------------------------------------------------------

## 3.2 WindowLayout

WindowLayout is responsible exclusively for rendering the graphical interface.

Its responsibilities include:

- Rendering widgets
- Building the graphical layout
- Visual composition

WindowLayout shall never manage the window lifecycle.

------------------------------------------------------------------------------

## 3.3 WindowLifecycle

WindowLifecycle is responsible exclusively for managing the window state.

Its responsibilities include:

- Opening the window
- Closing the window
- Maintaining visibility state

WindowLifecycle shall never perform graphical rendering.

------------------------------------------------------------------------------

# 4. Lifecycle

Every Main Window shall follow the certified execution lifecycle.

The lifecycle is identical for every Main Window developed within ACP Studio.

```text
Run()
    │
    ▼
Initialize()
    │
    ▼
Create ReaImGui Context
    │
    ▼
Render Loop
    │
    ▼
ImGui_Begin()
    │
    ▼
Render(context)
    │
    ▼
ImGui_End()
    │
    ▼
Window Closed
    │
    ▼
Shutdown()
    │
    ▼
onCompleted()
```

The execution lifecycle is coordinated by MainWindow.

Rendering is delegated to WindowLayout.

Window state management is delegated to WindowLifecycle.

------------------------------------------------------------------------------

# 5. Required Functions

Every Main Window shall implement the following public interface.

------------------------------------------------------------------------------

## Initialize()

Initializes the Main Window execution environment.

------------------------------------------------------------------------------

## Render(context)

Responsible for rendering the graphical interface.

The function shall delegate rendering to WindowLayout.

------------------------------------------------------------------------------

## Shutdown()

Terminates the Main Window execution.

------------------------------------------------------------------------------

## Run(onCompleted)

Executes the complete graphical lifecycle.

This function represents the entry point used by the certified GUI Test
Skeleton.

------------------------------------------------------------------------------

# 6. Module Structure

Every Main Window shall follow the certified module organization.

```text
Core/
└── GUI/
    ├── MainWindow.lua
    ├── WindowLayout.lua
    └── WindowLifecycle.lua
```

Each module shall have a single responsibility.

------------------------------------------------------------------------------

# 7. Development Rules

Main Window implementations shall comply with the following development rules.

- MainWindow shall coordinate execution only.
- WindowLayout shall contain only graphical rendering.
- WindowLifecycle shall manage only window state.
- Responsibilities shall remain independent.
- Public interfaces shall remain consistent.
- MainWindow shall expose Run(onCompleted).
- Main Window implementations shall remain compatible with the certified
  GuiTestSkeleton.lua.

------------------------------------------------------------------------------

# 8. Certified Template

MainWindow.lua is the official template for every Main Window developed for
ACP Studio.

The template implements the certified execution architecture defined by this
standard.

All new Main Window implementations shall be derived from this certified
template.

Individual implementations shall preserve the separation between execution,
rendering and lifecycle management.

This template defines the certified architectural foundation for all Main Window implementations within ACP Studio.

------------------------------------------------------------------------------

End of Document

------------------------------------------------------------------------------