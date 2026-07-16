---

ACP Studio

Document        : GST-001
Title           : GUI Test Template Standard

Category        : Certified Standard
Status          : Approved

Version         : 1.0.0

Author          : ACP Studio

Dependencies    : ENG-001 Documentation Standard
                  GUI-001 ReaImGui Platform
                  GuiTestSkeleton.lua
                  GST-001
                  GUI-001

---

# 1. Purpose

---

This document defines the architectural standard for graphical capability tests developed for ACP Studio.

The objective of this standard is to establish a consistent, reusable and maintainable approach for testing graphical capabilities implemented through the ReaImGui platform.

Unlike traditional capability tests, graphical tests are event-driven and follow the lifecycle of an ImGui window.

For this reason, ACP Studio defines a dedicated graphical test architecture and a certified template that standardizes the complete graphical lifecycle.

------------------------------------------------------------------------------

# 2. Design Philosophy

---

Graphical capability tests differ fundamentally from traditional capability tests.

A traditional test executes sequentially from initialization to completion.

A graphical capability test is event-driven and remains active for the entire lifetime of a graphical window.

For this reason, ACP Studio separates the graphical lifecycle from the capability under test.

The graphical lifecycle is managed exclusively by the certified GUI Test Skeleton.

Individual capability tests are responsible only for describing the graphical capability being certified.

This separation eliminates duplicated infrastructure, improves consistency and allows every graphical capability test to focus exclusively on its own behavior.

The GUI Test Skeleton therefore acts as the execution framework for every graphical capability test developed within ACP Studio.

The GUI Test Skeleton owns the graphical lifecycle.

The graphical capability test owns the certification of the capability.

This separation of responsibilities is mandatory for every graphical capability test developed within ACP Studio.

------------------------------------------------------------------------------

# 3. Responsibilities

---

The GUI Test Architecture separates the graphical infrastructure from the capability under test.

This separation defines two distinct responsibilities.

---

## 3.1 GUI Test Skeleton

The GUI Test Skeleton is responsible for managing the complete graphical lifecycle.

Its responsibilities include:

- Bootstrap initialization
- Test environment initialization
- Console management
- ReaImGui context creation
- Window lifecycle management
- Render loop execution
- Context destruction
- Validation execution
- Test report generation

The GUI Test Skeleton provides the execution framework for every graphical capability test.

---

## 3.2 Graphical Capability Test

A graphical capability test is responsible exclusively for the capability being certified.

Its responsibilities are limited to:

- Rendering the graphical capability
- Validating the capability after execution

A graphical capability test shall never manage the graphical lifecycle.

All infrastructure required to execute the test is provided by the GUI Test Skeleton.

------------------------------------------------------------------------------

# 4. Lifecycle

---

Every graphical capability test shall follow the lifecycle defined by the GUI Test Skeleton.

The lifecycle is identical for every graphical capability test developed within ACP Studio.

```text
Run()
    │
    ▼
Initialize Test Environment
    │
    ▼
Create ReaImGui Context
    │
    ▼
Render Loop
    │
    ▼
Window Closed
    │
    ▼
Destroy ReaImGui Context
    │
    ▼
Validate()
    │
    ▼
Generate Test Report
    │
    ▼
PASS / FAIL
```

The graphical lifecycle is completely managed by the GUI Test Skeleton.

Individual capability tests participate in the lifecycle only through the Render() and Validate() functions.

The lifecycle remains identical regardless of the graphical capability being certified.

------------------------------------------------------------------------------

# 5. Required Functions

---

Every graphical capability test shall implement exactly two functions.

These functions represent the complete interface between the GUI Test Skeleton and the capability under test.

---

## Render()

The Render() function is responsible for rendering the graphical capability being certified.

The function shall contain only the graphical elements required by the capability under test.

Render() shall not perform:

- Context creation
- Window creation
- Render loop management
- Context destruction
- Test report generation

These responsibilities belong exclusively to the GUI Test Skeleton.

---

## Validate()

The Validate() function is executed after the graphical lifecycle has completed.

Its purpose is to verify that the graphical capability satisfies the expected certification criteria.

The validation shall produce the final PASS or FAIL result for the capability under test.

Validation shall not interact with the graphical lifecycle.

------------------------------------------------------------------------------

# 6. Template Structure

---

The certified GUI Test Skeleton shall provide a predefined structure common to every graphical capability test.

The template shall include the following sections.

1. Header
2. Test Environment
3. Module
4. Test Dependencies
5. Constants
6. Private State
7. Utilities
8. Render
9. Validate
10. Public Interface

The order of these sections shall not be modified.

The GUI Test Skeleton shall implement the complete graphical lifecycle required to execute a graphical capability test.

Individual capability tests shall implement only the Render() and Validate() functions.

------------------------------------------------------------------------------

# 7. Development Rules

---

Graphical capability tests shall comply with the following development rules.

- The graphical lifecycle shall be managed exclusively by the GUI Test Skeleton.
- Graphical capability tests shall implement only the Render() and Validate() functions.
- Context creation and destruction shall never be performed by the capability test.
- The Render() function shall contain only the graphical capability under test.
- The Validate() function shall verify the certification criteria after the graphical lifecycle has completed.
- Every graphical capability test shall be derived from the certified GuiTestSkeleton.lua template.
- All graphical capability tests shall follow the lifecycle defined by this standard.

------------------------------------------------------------------------------

# 8. Certified Template

---

GuiTestSkeleton.lua is the official template for every graphical capability test developed for ACP Studio.

The template implements the complete graphical test framework defined by this standard.

All new graphical capability tests shall be derived from the certified GuiTestSkeleton.lua template.

Individual capability tests shall not modify the graphical lifecycle provided by the template.

------------------------------------------------------------------------------

End of Document

------------------------------------------------------------------------------
