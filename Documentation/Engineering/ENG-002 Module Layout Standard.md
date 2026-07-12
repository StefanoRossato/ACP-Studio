# ENG-002 Module Layout Standard

**Version:** 1.0

**Status:** Approved

**Author:** ACP Studio

**Category:** Engineering

---

## 1. Purpose

This document defines the standard layout adopted by all ACP Studio modules.

This standard complements ENG-001 Documentation Standard by defining the internal organization of software modules.

Its purpose is to establish a consistent internal organization for every module, improving readability, maintainability and long-term consistency across the entire codebase.

The Module Layout Standard applies to all Core, Framework and engineering modules unless explicitly documented otherwise.

---

## 2. Standard Module Layout

Every ACP Studio module shall follow the structure defined below.

```text
-----------------------------------------------------------------------
-- Header
-----------------------------------------------------------------------

Module Table

-----------------------------------------------------------------------
-- Constants
-----------------------------------------------------------------------

-----------------------------------------------------------------------
-- Private State
-----------------------------------------------------------------------

-----------------------------------------------------------------------
-- Private Functions
-----------------------------------------------------------------------

-----------------------------------------------------------------------
-- Public API
-----------------------------------------------------------------------

-----------------------------------------------------------------------
-- Return Module
-----------------------------------------------------------------------
```

The order of the sections is part of the standard and shall remain consistent across all modules.

---

## 3. Section Responsibilities

Each section has a single, well-defined responsibility.

### Header

Identifies the module, its engineering specification and its overall responsibility.

### Module Table

Defines the module table exported by the file.

This section represents the public identity of the module.

### Constants

Contains immutable values used internally by the module.

Constants shall never be modified after initialization.

### Private State

Contains the internal mutable state of the module.

Private state shall remain inaccessible from outside the module.

### Private Functions

Contains helper functions and internal implementation details.

Functions defined in this section shall never be exposed through the public interface.

### Public API

Contains every function intentionally exported by the module.

Public functions shall be grouped together and clearly separated from the internal implementation.

### Return Module

Exports the module through a single return statement.

The module shall always expose a single public interface.

---

## 4. Design Rules

All ACP Studio modules shall comply with the following rules.

- Sections shall always appear in the defined order.
- Every section shall have a single responsibility.
- Private implementation shall remain encapsulated.
- Constants shall be immutable.
- Public API shall be grouped in a dedicated section.
- Modules shall expose only their intended public interface.
- The module layout shall remain consistent across the entire project.

---

## 5. Example

The following example illustrates the standard module structure.

```lua
-----------------------------------------------------------------------
-- ACP Studio
-- ModuleName.lua
--
-- XXX-001 Module Specification
--
-- Module responsibility description.
-----------------------------------------------------------------------

local ModuleName = {}

-----------------------------------------------------------------------
-- Constants
-----------------------------------------------------------------------

-----------------------------------------------------------------------
-- Private State
-----------------------------------------------------------------------

local State = {

}

-----------------------------------------------------------------------
-- Private Functions
-----------------------------------------------------------------------

-----------------------------------------------------------------------
-- Public API
-----------------------------------------------------------------------

function ModuleName.Initialize()

end

-----------------------------------------------------------------------

return ModuleName
```

---

## 6. Compliance

Every new ACP Studio module shall conform to this specification before implementation begins.

Changes to the module layout standard shall be introduced only through an approved Engineering specification.

This document defines the official module organization standard for the ACP Studio codebase.