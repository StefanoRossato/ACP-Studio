# GUI-001 — ReaImGui Platform

**Layer**  
Platform Certification

**Status**  
Approved

**Version**  
1.0

---

# 1. Objective

The purpose of this document is to certify the ReaImGui platform adopted by ACP Studio.

This certification identifies the graphical capabilities that are approved for use within the Observation Layer.

The objective is not to document the entire ReaImGui API, but to define the subset of functionality that has been verified, tested and accepted for ACP Studio development.

The official ReaImGui documentation remains the authoritative reference for API syntax and semantics.

This document defines how ACP Studio adopts, validates and certifies those capabilities.

Every graphical feature introduced into the project shall complete the certification process before becoming part of the approved graphical platform.

---

# 2. Platform

## 2.1 Purpose

ReaImGui is the graphical platform adopted by ACP Studio for the implementation of the Observation Layer.

It provides an Immediate Mode Graphical User Interface (IMGUI) integrated into REAPER through the ReaScript API.

The platform is responsible exclusively for graphical presentation.

Business logic, runtime execution, measurements and analysis remain completely independent from the graphical platform.

---

## 2.2 Platform

| Property | Value |
|----------|-------|
| Platform | ReaImGui |
| Integration | REAPER ReaScript |
| UI Model | Immediate Mode GUI |
| Language | Lua |
| Certified Platform Version | 0.10.0.5 |

---

## 2.3 Responsibilities

The ReaImGui platform is responsible for:

- Window management
- Layout management
- Widget rendering
- User interaction
- View composition

The ReaImGui platform is **not** responsible for:

- Runtime execution
- Measurements
- Audio analysis
- State management
- Data persistence
- Business logic

---

## 2.4 ACP Studio Integration

Within ACP Studio, ReaImGui represents the Presentation Layer of the Observation Architecture.

The Observation Layer consumes information produced by the Runtime, Measurement and Analysis layers and renders that information through the graphical interface.

The platform therefore acts exclusively as a visualization technology.

---

# 3. Terminology

## Platform

An external technology upon which ACP Studio is built.

---

## Capability

A single functional feature provided by the platform.

Examples include window creation, buttons, tables or child regions.

---

## Certification

The engineering process used to validate a platform capability before it becomes part of ACP Studio.

---

## Approved API

The subset of certified platform capabilities officially accepted for use within ACP Studio.

Only the Approved API may be used during implementation.

---

# 4. Certification Process

## 4.1 Purpose

Every ReaImGui capability adopted by ACP Studio shall be verified before becoming part of the Approved API.

Certification ensures that the Observation Layer is built only upon platform features that have been experimentally validated and documented.

This process guarantees predictable behaviour, stable integration and long-term maintainability.

---

## 4.2 Certification Workflow

Every capability shall follow the workflow below.

```text
Investigate
      ↓
Implement
      ↓
Test
      ↓
PASS
      ↓
Document
      ↓
Approved API
```

A capability becomes part of the ACP Studio graphical platform only after completing the complete certification workflow.

---

## 4.3 Capability Test

Each capability shall be validated independently.

Every capability test shall verify:

- Correct API usage
- Function signature
- Runtime behaviour
- Expected graphical result
- Compatibility with the current certified platform

Every capability shall produce either a PASS or FAIL result.

---

## 4.4 Documentation

Every certified capability shall be documented with:

- Purpose
- API used
- Expected behaviour
- Known limitations
- Engineering notes (when required)

The documentation becomes the official engineering reference.

---

## 4.5 Approved Platform

Only certified capabilities may be used inside the Observation Layer.

Experimental or undocumented ReaImGui features shall not be used within ACP Studio.

Whenever a new graphical capability becomes necessary, it shall first complete the certification process before becoming part of the Approved API.

---

## 4.6 Maintenance

Whenever the certified ReaImGui version changes, previously certified capabilities shall be reviewed.

If behavioural differences are detected, the affected capability shall be re-certified before adoption.

---

# 5. Capability Classification

## 5.1 Purpose

The ReaImGui platform is divided into capability groups.

Each group represents a specific responsibility within the graphical platform.

Capabilities are classified independently and certified incrementally to ensure stable platform evolution.

---

## 5.2 GUI-001 — Context Management

Defines the lifetime of the graphical context.

Typical capabilities include:

- Context creation
- Context ownership
- Context release
- Rendering lifecycle

---

## 5.3 GUI-002 — Window Management

Defines the behaviour of application windows.

Typical capabilities include:

- Window creation
- Window visibility
- Window positioning
- Window sizing
- Window flags

---

## 5.4 GUI-003 — Basic Widgets

Defines the fundamental graphical controls.

Typical capabilities include:

- Text
- Button
- Separator
- SameLine
- Dummy
- Spacing

---

## 5.5 GUI-004 — Layout

Defines the organisation of graphical elements.

Typical capabilities include:

- Groups
- Child windows
- Tables
- Columns
- Splitters
- Alignment
- Indentation

---

## 5.6 GUI-005 — Containers

Defines reusable graphical containers.

Typical capabilities include:

- Tree Nodes
- Collapsing Headers
- Tab Bars
- Tab Items
- Child Regions

---

## 5.7 GUI-006 — Interaction

Defines user interaction controls.

Typical capabilities include:

- Selectable
- CheckBox
- Radio Button
- Combo Box
- Input Text
- Slider

---

## 5.8 GUI-007 — Menus

Defines menu structures.

Typical capabilities include:

- Menu Bar
- Menu
- Menu Item
- Popup
- Context Menu

---

## 5.9 GUI-008 — Styling

Defines the visual appearance of the graphical interface.

Typical capabilities include:

- Colors
- Fonts
- Themes
- Style Variables
- Disabled State

---

## 5.10 GUI-009 — Advanced Features

Defines advanced graphical capabilities not initially required by ACP Studio.

Examples include:

- Docking
- Multi Viewport
- Draw Lists
- Custom Rendering
- Advanced Clipping

These capabilities shall be certified only when required by future project milestones.

---

# 6. Certification Matrix

## 6.1 Purpose

The Certification Matrix defines the implementation status of every approved ReaImGui capability.

Each capability progresses independently through the certification workflow defined in this document.

The matrix is intended to evolve throughout the lifetime of ACP Studio and represents the current certification status of the graphical platform.

---

## 6.2 Capability Status

| Status | Description |
|----------|-------------|
| Not Started | Capability has not yet been investigated. |
| In Progress | Investigation or implementation is currently in progress. |
| Certified | Capability has been implemented, tested and approved. |
| Rejected | Capability has been evaluated and intentionally excluded from the platform. |

---

## 6.3 GUI-001 — Context Management

| Capability | Status |
|------------|--------|
| CreateContext | Certified |
| Context Ownership | Certified |
| Render Lifecycle | Certified |
| Context Release | Certified |

---

## 6.4 GUI-002 — Window Management

| Capability | Status |
|------------|--------|
| Begin | Certified |
| End | Certified |
| Window Open / Close | Certified |
| SetNextWindowSize | Certified |
| SetNextWindowPos | Not Started |
| Window Flags | Not Started |

---

## 6.5 GUI-003 — Basic Widgets

| Capability | Status |
|------------|--------|
| Text | Not Started |
| Button | Not Started |
| Separator | Not Started |
| SameLine | Not Started |
| Dummy | Not Started |
| Spacing | Not Started |

---

## 6.6 GUI-004 — Layout

| Capability | Status |
|------------|--------|
| BeginGroup | Not Started |
| EndGroup | Not Started |
| BeginChild | Not Started |
| EndChild | Not Started |
| Columns | Not Started |
| Tables | Not Started |
| Splitter | Not Started |

---

## 6.7 GUI-005 — Containers

| Capability | Status |
|------------|--------|
| TreeNode | Not Started |
| Collapsing Header | Not Started |
| Tab Bar | Not Started |
| Tab Item | Not Started |
| Child Region | Not Started |

---

## 6.8 GUI-006 — Interaction

| Capability | Status |
|------------|--------|
| Selectable | Not Started |
| CheckBox | Not Started |
| Radio Button | Not Started |
| Combo Box | Not Started |
| Input Text | Not Started |
| Slider | Not Started |

---

## 6.9 GUI-007 — Menus

| Capability | Status |
|------------|--------|
| Menu Bar | Not Started |
| Menu | Not Started |
| Menu Item | Not Started |
| Popup | Not Started |
| Context Menu | Not Started |

---

## 6.10 GUI-008 — Styling

| Capability | Status |
|------------|--------|
| Colors | Not Started |
| Fonts | Not Started |
| Style Variables | Not Started |
| Disabled State | Not Started |

---

## 6.11 GUI-009 — Advanced Features

| Capability | Status |
|------------|--------|
| Docking | Not Started |
| Multi Viewport | Not Started |
| Draw Lists | Not Started |
| Custom Rendering | Not Started |

---

# 7. Approved API

## 7.1 Purpose

The Approved API defines the official subset of the ReaImGui platform that may be used within ACP Studio.

Only capabilities that have successfully completed the certification process shall be considered part of the approved platform.

The Approved API represents the stable graphical foundation upon which the Observation Layer is implemented.

---

## 7.2 Usage Policy

All graphical components developed for ACP Studio shall use only certified API capabilities.

The introduction of a new ReaImGui feature requires:

1. Platform investigation
2. Capability implementation
3. Capability testing
4. Documentation update
5. Certification approval

Only after completing this process may the capability become part of the Approved API.

---

## 7.3 Certified Capabilities

Initially, the Approved API may contain only a limited set of capabilities.

The list shall grow incrementally as new platform features complete the certification process.

Example:

### Context Management

- CreateContext
- Render Lifecycle
- Context Ownership
- Context Release

### Window Management

- Begin
- End
- Window Open / Close
- SetNextWindowSize

Additional capabilities shall be added only after successful certification.

---

## 7.4 Design Principle

ACP Studio intentionally adopts only a controlled subset of the ReaImGui API.

Limiting the Approved API reduces platform complexity, improves maintainability and guarantees consistent behaviour throughout the Observation Layer.

The Approved API constitutes the only graphical interface between ACP Studio and the ReaImGui platform.

---

# 8. Revision History

| Version | Date | Description |
|----------|------|-------------|
| 1.0 | Initial Release | Initial definition of the ReaImGui Platform Certification process. |

---

## 8.1 Future Evolution

The ReaImGui platform certification is intended to evolve together with ACP Studio.

New graphical capabilities shall be introduced incrementally through dedicated certification milestones.

Whenever possible, backward compatibility shall be preserved.

If platform changes introduce incompatible behaviour, the affected capabilities shall be re-certified before adoption.

---

## 8.2 Related Documents

- OBS-001 — Observation Architecture Foundation
- OBS-002 — Observation Layout
- ACP Monitor Specification
- Observation Layer Architecture

---

# 9. References

The following external resources provide the official technical documentation for the graphical platform adopted by ACP Studio.

These references complement, but do not replace, the platform certification defined in this document.

---

## 9.1 Official Documentation

### ReaImGui

- GitHub Repository  
  https://github.com/cfillion/reaimgui

- API Reference  
  https://github.com/cfillion/reaimgui/tree/master/api

### Dear ImGui

- GitHub Repository  
  https://github.com/ocornut/imgui

- Wiki  
  https://github.com/ocornut/imgui/wiki

External documentation always takes precedence regarding API syntax and semantics.

GUI-001 defines exclusively the subset of capabilities certified for ACP Studio.

---

## 9.2 Project Documentation

- OBS-001 — Observation Architecture Foundation
- OBS-002 — Observation Layout
- ACP Monitor Specification
- Observation Layer Architecture