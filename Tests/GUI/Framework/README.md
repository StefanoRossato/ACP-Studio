# GUI Test Framework

**Project:** ACP Studio

**Component:** GUI Testing Infrastructure

**Location:** `Tests/GUI/Framework`

**Status:** Certified

**Certification Level:** GUI-103

This document defines the architecture, responsibilities and certification
model of the ACP Studio GUI Test Framework.


## Purpose

The GUI Test Framework provides a consistent, deterministic and reusable
structure for validating ACP Studio GUI modules.

Its purpose is to ensure every certified GUI milestone is executed using the
same test lifecycle, logging format and certification process.

---

## Scope

The GUI Test Framework provides the infrastructure required to certify GUI
modules.

It does not define application behaviour.

Application behaviour is defined exclusively by each certified GUI test.

---

# Architecture

```
GUI Test
    │
    ▼
Bootstrap.Initialize()
    │
    ▼
GuiTestSkeleton.Run()
    │
    ▼
OnCompleted(Test)
    │
    ▼
GUI Module
```

The framework is divided into three independent components:

- Bootstrap
- GUI Test Skeleton
- Certified GUI Test

Each component has a clearly defined responsibility.

---

# Components

## Bootstrap

Location

```
Tests/Bootstrap.lua
```

### Responsibilities

- Initialize the test environment.
- Configure `package.path`.
- Prepare the repository for testing.

The bootstrap is application-independent and is shared by every ACP Studio
test suite.

It never contains application-specific logic.

---

## GUI Test Skeleton

Location

```
Tests/GUI/Framework/GuiTestSkeleton.lua
```

### Responsibilities

- Display the test banner.
- Load the module under test.
- Create the Test API.
- Execute the test callback.
- Display the certification summary.

The skeleton contains only framework behaviour.

It never contains application logic.

---

## GUI Test

Each certified GUI test is responsible for:

- Initializing the bootstrap.
- Selecting the module under test.
- Executing the functional validation.
- Certifying the expected behaviour.

The framework never decides how a module should behave.

That responsibility belongs exclusively to the certified GUI test.

---

# Execution Flow

Every certified GUI test follows the same execution sequence.

```
Load Bootstrap

        │
        ▼

Bootstrap.Initialize()

        │
        ▼

Require GuiTestSkeleton

        │
        ▼

GuiTestSkeleton.Run(configuration)

        │
        ▼

Load Module

        │
        ▼

Create Test API

        │
        ▼

OnCompleted(Test)

        │
        ▼

Certification Summary
```

This deterministic lifecycle guarantees that every certified GUI milestone is
executed using the same framework behaviour.

---

# Design Principles

## Single Responsibility

Each component has exactly one responsibility.

| Component       | Responsibility                  |
|-----------------|---------------------------------|
| Bootstrap       | Initialize the test environment |
| GuiTestSkeleton | Execute the framework lifecycle |
| GUI Test        | Validate module behaviour       |

---

## Framework Independence

The framework never knows application modules.

It interacts only with the test configuration.

It never invokes application-specific APIs directly.

For example, the framework never calls:

- `MainWindow.Initialize()`
- `Toolbar.Initialize()`
- `Toolbar.Render()`
- `Actions.Initialize()`
- `Actions.Set()`

Application behaviour belongs exclusively to the certified GUI test.

---

## Deterministic Execution

Every certified GUI test follows the same execution flow.

This guarantees:

- consistent logging;
- deterministic execution;
- repeatable certification;
- simplified maintenance.

---

## Configuration Driven

The framework is completely configuration driven.

Every GUI test provides:

- test identity;
- module information;
- execution messages;
- validation callback.

The framework never contains milestone-specific logic.

---

# Directory Structure

```
Tests/
│
├── Bootstrap.lua
│
└── GUI/
    │
    ├── Framework/
    │   └── GuiTestSkeleton.lua
    │
    ├── GUI-100 — Main Window Foundation Test.lua
    ├── GUI-101 Toolbar Foundation Test.lua
    ├── GUI-102 — Toolbar Controls Test.lua
    └── GUI-103 — Toolbar Actions Test.lua
```

---

# Certified Test Structure

Every certified GUI test follows the same implementation pattern.

```
Load Bootstrap

↓

Initialize Test Environment

↓

Require GuiTestSkeleton

↓

GuiTestSkeleton.Run(configuration)

↓

OnCompleted(Test)

↓

Certification Summary
```

Each test contains only the validation logic required for the module under
certification.

---

# Certification

The following GUI milestones are certified using this framework.

- GUI-100 — Main Window Foundation
- GUI-101 — Toolbar Foundation
- GUI-102 — Toolbar Controls
- GUI-103 — Toolbar Actions

Future certified GUI milestones shall follow the same execution model.

---

# Philosophy

The GUI Test Framework is intentionally simple.

Framework behaviour belongs to the framework.

Application behaviour belongs to the certified GUI test.

Keeping these responsibilities separate produces a framework that is easier to
understand, maintain and extend.

---

# Design Constraints

The GUI Test Framework intentionally remains minimal.

The framework shall not:

- initialize application modules;
- invoke application APIs;
- implement milestone-specific behaviour;
- contain GUI business logic.

Its only responsibility is to provide a deterministic execution environment for
GUI certification.

---

# Version History

| Version | Description |
|---------|-------------|
| GUI-006 | Initial GUI Test Framework |
| GUI-100 | Certified Main Window Foundation |
| GUI-101 | Certified Toolbar Foundation |
| GUI-102 | Certified Toolbar Controls |
| GUI-103 | Certified Toolbar Actions |

---

# Maintenance Policy

The GUI Test Framework is considered stable.

Future GUI milestones shall extend the framework by introducing new certified
tests rather than modifying the framework itself.

Framework modifications should occur only when introducing new framework
capabilities that benefit every certified GUI test.

Application-specific behaviour shall never be implemented inside the framework.

This policy preserves deterministic execution, framework independence and
long-term maintainability.