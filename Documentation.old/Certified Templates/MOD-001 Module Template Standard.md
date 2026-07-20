---

ACP Studio

Document        : MOD-001
Title           : Module Template Standard

Category        : Certified Standard
Status          : Certified

Version         : 2.0.0

Author          : ACP Studio

Dependencies    : ENG-001 Documentation Standard
                  ModuleSkeleton.lua

---

# 1. Purpose

---

This document defines the official template for Lua modules developed within ACP Studio.

Its purpose is to ensure architectural consistency, readability, maintainability and uniform organization across the entire codebase.

---

# 2. Scope

---

This standard applies to every Lua module developed for ACP Studio.

All new Lua modules shall be derived from the certified `ModuleSkeleton.lua` template.

---

# 3. Module Structure

---

Every module shall follow the structure below.

1. Header
2. Module Declaration
3. Constants
4. Private State
5. Private Functions
6. Public API
7. End of Module

The order of these sections shall not be modified.

Sections may remain empty when not required but shall not be removed.

---

# 4. Header

---

Every module shall begin with the standard ACP Studio header.

The header shall contain:

* Module
* Layer
* Purpose
* Specification

These fields uniquely identify the architectural role of the module.

---

# 5. Module Declaration

---

The module shall be declared as a local table.

Example:

```lua
local ModuleName = {}
```

The use of `__index` is optional.

It shall only be introduced when the module represents an object-oriented construct such as a Value Object or Entity.

---

# 6. Constants

---

The Constants section contains module-private constant definitions.

If no constants are required, the section shall remain empty.

---

# 7. Private State

---

The Private State section contains the internal state of the module.

Modules requiring internal state shall store it within the State table.

---

# 8. Private Functions

---

All non-exported functions shall be grouped within the Private Functions section.

Each function shall be preceded by a descriptive section header.

---

# 9. Public API

---

The public API shall expose only the functionality required by the module responsibility.

The template does not require any predefined public functions.

Functions such as:

* `New()`
* `Initialize()`
* `Create()`
* `Destroy()`

shall only be implemented when required by the module responsibility.

---

# 10. Design Principles

---

The Module Template shall:

* remain minimal;
* avoid unnecessary placeholder code;
* support both static modules and object-oriented modules;
* expose only the API required by the module responsibility;
* maintain a consistent structure throughout ACP Studio;
* remain implementation agnostic;

---

# 11. Certified Template

---

`ModuleSkeleton.lua` is the official template for all ACP Studio Lua modules.

All new modules shall be derived from this template.

---

------------------------------------------------------------------------------
End of Document
------------------------------------------------------------------------------