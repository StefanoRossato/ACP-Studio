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

------------------------------------------------------------------------------
End of Document
------------------------------------------------------------------------------