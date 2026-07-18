------------------------------------------------------------------------------
ACP Studio

Document        : GUI-102
Title           : Toolbar Controls

Category        : Certified Capability
Status          : Certified

Version         : 1.0.0

Author          : ACP Studio

Dependencies    : GUI-101 Toolbar Foundation
                  GUI-001 ReaImGui Platform
                  GST-002 Main Window Template

------------------------------------------------------------------------------

------------------------------------------------------------------------------
# 1. Purpose

GUI-102 defines the first certified Toolbar control capability for ACP Studio.

The objective of this capability is to transform the Toolbar from a structural
graphical component into a reusable container capable of hosting graphical
controls while preserving the architecture established by GUI-100 and GUI-101.

This capability introduces the certified infrastructure required for rendering
Toolbar controls without introducing application behavior or business logic.

The Toolbar remains an independent GUI component whose responsibility is
limited exclusively to graphical rendering and control organization.

------------------------------------------------------------------------------
# 2. Design Philosophy

Toolbar controls differ fundamentally from the Toolbar foundation established
by GUI-101.

GUI-101 introduced the graphical structure of the Toolbar.

GUI-102 extends that foundation by introducing the first certified capability
for rendering graphical controls.

The Toolbar remains responsible exclusively for graphical rendering and control
organization.

Application behavior, command execution and business logic remain outside the
scope of the Toolbar.

This separation preserves component independence, improves maintainability and
allows future GUI capabilities to be developed without modifying the certified
Toolbar architecture.

------------------------------------------------------------------------------
# 3. Responsibilities

The Toolbar is responsible exclusively for rendering and organizing graphical
controls within the Main Window.

Its responsibilities include:

- Rendering the Toolbar area.
- Rendering graphical controls.
- Organizing controls using a consistent horizontal layout.
- Preserving a reusable rendering lifecycle.
- Remaining independent from application logic.

The Toolbar shall never:

- Execute application commands.
- Manage project state.
- Implement business logic.
- Coordinate other GUI components.
- Manage the Main Window lifecycle.

------------------------------------------------------------------------------
# 4. Rendering Lifecycle

Every Toolbar implementation shall follow the certified rendering lifecycle.

The rendering lifecycle is identical for every Toolbar developed within ACP
Studio.

```text
Render(context)
      │
      ▼
Begin(context)
      │
      ▼
DrawControls(context)
      │
      ▼
End(context)
```

------------------------------------------------------------------------------
# 5. Certified Capability

GUI-102 certifies the first Toolbar control capability for ACP Studio.

The Toolbar is capable of rendering graphical controls while preserving its
architectural independence and certified rendering lifecycle.

This capability establishes the Toolbar as a reusable graphical component that
can host future controls without requiring modifications to its public
interface.

Future GUI milestones shall extend the Toolbar by introducing additional
graphical capabilities while preserving the rendering architecture certified by
GUI-102.

------------------------------------------------------------------------------
# 6. Architectural Constraints

GUI-102 preserves the architectural responsibilities established by GUI-100
and GUI-101.

The Toolbar shall remain an autonomous graphical component responsible
exclusively for rendering and organizing graphical controls.

GUI-102 shall not introduce:

- Application commands.
- Project logic.
- Menus.
- Icons.
- Status indicators.
- Dynamic control state management.

Future GUI capabilities shall extend the Toolbar through independent,
certifiable components without modifying its certified public rendering
interface.

------------------------------------------------------------------------------
# 7. Development Rules

Every future Toolbar capability shall preserve the architecture certified by
GUI-102.

Future implementations shall:

- Preserve the public rendering interface.
- Preserve the certified rendering lifecycle.
- Maintain a single responsibility.
- Remain independent from business logic.
- Be individually testable and certifiable.

Future implementations shall not:

- Modify the Toolbar public API.
- Introduce application state management.
- Execute application commands directly.
- Create dependencies on unrelated GUI components.
- Break compatibility with previously certified GUI capabilities.

