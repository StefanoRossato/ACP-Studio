---

ACP Studio

Document        : TST-001
Title           : Test Template Standard

Category        : Certified Standard
Status          : Certified

Version         : 1.0.0

Author          : ACP Studio

Dependencies    : ENG-001 Documentation Standard
                  TestSkeleton.lua
---

1. Purpose

---

This document defines the official structure for Lua test modules used in ACP Studio.

Its purpose is to ensure consistency, readability and maintainability across the project test suite.

---

2. Scope

---

This standard applies to every Lua test module developed for ACP Studio.

All new test modules shall be created from the certified TestSkeleton.lua template.

---

3. Test Structure

---

Every test module shall follow the structure below.

1. Header
2. Test Setup
3. Module
4. Dependencies
5. Constants
6. Construction
7. Private Methods
8. Test Cases
9. Public Interface
10. Module Export

The order of these sections shall not be modified.

---

4. Naming Conventions

---

The test filename shall match the component under test and shall use the suffix:

_Test.lua

Example:

RuntimeObserver_Test.lua

---

5. Test Setup

---

Every test module shall load the common ACP Studio TestSetup.lua.

The Test Setup section shall precede every other implementation section.

Every production module shall be imported using the ACP Studio
module loading convention:

    require("Core.<Layer>.<Module>")

The certified TestSkeleton.lua shall provide this declaration as the
standard module import template.

---

6. Private Methods

---

The Private Methods section shall contain common helper functions used by the test.

The standard logging utilities shall be implemented in this section.

Example:

* ClearLog()
* Log()

Additional helper functions may be added when required.

---

7. Test Cases

---

Each logical test shall be implemented as an independent function.

Each test case shall validate a single behavior whenever practical.

Test cases shall be invoked from the public interface.

---

8. Public Interface

---

Every test module shall expose a single entry point named:

Run()

The Run() function shall:

* initialize the test environment;
* execute the test cases;
* report the test result.

---

9. Certified Template

---

TestSkeleton.lua is the official template for all ACP Studio Lua test modules.

All new test modules shall be derived from this template.

---

------------------------------------------------------------------------------
End of Document
------------------------------------------------------------------------------
