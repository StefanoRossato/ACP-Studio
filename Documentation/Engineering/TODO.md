# ACP Studio Engineering TODO

---

## Purpose

This document tracks approved engineering improvements that are intentionally deferred.

Items listed in this document do not affect the certification status of the current implementation.

Each item shall receive a unique identifier and shall be removed once implemented.

---

## Status Values

Engineering TODO items shall use one of the following status values.

* Open
* In Progress
* Completed
* Cancelled

---

## Priority Values

Engineering TODO items shall use one of the following priority values.

* Low
* Medium
* High
* Critical

---

## Categories

Engineering TODO items shall belong to one of the following categories.

* Engineering
* Framework
* Runtime
* Observability
* Domain
* Test Infrastructure

---

## Rules

Engineering TODO items shall never replace implementation defects.

Only approved improvements that do not affect the correctness of the current implementation shall be tracked in this document.

Open issues requiring architectural decisions shall be tracked in **ENG-OPEN Engineering Open Issues**.

Completed TODO items shall be removed from this document after implementation.

---

## ENG-TODO-001

**Title**

Centralize Repository Configuration

**Category**

Test Infrastructure

**Priority**

Low

**Status**

Open

**Description**

Replace the hardcoded repository name used by `Tests/Bootstrap.lua`
with a centralized repository configuration shared across the ACP Studio framework.

**Rationale**

The current implementation is intentionally simple and certified.

A centralized configuration will eliminate repository-specific constants while preserving the existing Bootstrap public API.

---

## ENG-TODO — ModuleSkeleton v2

Evaluate the introduction of a dedicated "Factory Methods" section in the
ModuleSkeleton standard.

Current structure:

Constructor
Public Methods

Proposed structure:

Constructor
Factory Methods
Public Methods

Rationale

Some immutable Domain Objects expose named factory methods
(e.g. MeasurementResult.Empty()) that conceptually differ from both
constructors and ordinary public methods.

Separating factory methods improves readability and better reflects
DDD design patterns.

Priority: Low
Category: Engineering Standard

ARC-00X — Repository Naming Review

Status
------
TODO

Objective
---------
Review the naming and responsibilities of the Observation and
Observability packages after the Observation Layer is completed.

Motivation
----------
Current repository contains both:

- Core/Observability
- Core/Observation

The distinction is intentional but may be confusing for future
maintenance.

The review will determine whether:
- the current naming is appropriate,
- clearer documentation is sufficient,
- or a repository-wide rename is justified.

Notes
-----
Any rename must be performed as a dedicated refactoring milestone,
including:
- require() updates
- test verification
- documentation updates
- full repository certification

TODO

Repository Cleanup

- Valutare la separazione tra:
    Documentation Templates
    Runtime Templates
    Test Framework

Possibile struttura futura

Documentation/
    Templates/

Framework/
    Templates/

Tests/
    Framework/
    GUI/
        Framework/

------------------------------------------------------------------------------
End of Document
------------------------------------------------------------------------------