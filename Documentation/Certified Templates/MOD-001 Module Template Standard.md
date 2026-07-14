---

ACP Studio

Document        : MOD-001
Title           : Module Template Standard

Category        : Certified Standard
Status          : Certified

Version         : 1.0.0

Author          : ACP Studio

Dependencies    : ENG-001 Documentation Standard
                  ModuleSkeleton.lua

---

1. Purpose

---

This document defines the official structure for Lua modules used in ACP Studio.

Its purpose is to ensure consistency, readability and maintainability across the codebase.

---

2. Scope

---

This standard applies to every Lua module developed for ACP Studio.

All new modules shall be created from the certified ModuleSkeleton.lua template.

---

3. Module Structure

---

Every module shall follow the structure below.

1. Header
2. Module Declaration
3. Constructor
4. Public Methods
5. Private Methods
6. End of Module
7. Return Statement

The order of these sections shall not be modified.

---

4. Naming Conventions

---

The module name shall match the filename.

Example:

RuntimeObserver.lua

contains

RuntimeObserver

---

5. Constructor

---

Every module shall expose a constructor named:

New()

The constructor shall create and return a new module instance.

---

6. Public Methods

---

Public methods shall use the Lua method syntax.

Example:

function Module:Method()

---

7. Private Methods

---

Private methods shall be grouped in the dedicated section.

If no private methods are required, the section shall remain empty.

---

8. Comments

---

Section separators shall use the standard ACP Studio separator format.

Logical comments inside sections shall use the standard ACP Studio compact separator format.

These conventions are defined by the certified ModuleSkeleton.lua template.

---

9. Certified Template

---

ModuleSkeleton.lua is the official template for all ACP Studio Lua modules.

All new modules shall be derived from this template.

---

------------------------------------------------------------------------------
End of Document
------------------------------------------------------------------------------